using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEditor;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Rendering;
using UnityEngine.Timeline;
using Object = UnityEngine.Object;

namespace SimpleCharacterTrial.Editor
{
    // Offline native material-curve authoring. No render callbacks or new runtime components.
    public static class BakeGameDevArisExLighting
    {
        const string Characters = "Assets/GameRes/Characters/";
        const float Tolerance = .0001f;
        static readonly string[] Properties = { "_MxCharLightDir", "_MxCharLightTone", "_MxCharShadowTone", "_MxCharLightData" };
        static readonly string[] Components = { "x", "y", "z", "w" };
        const string ReportPath = "Temp/SimpleCharacterTrial/aris-ex-lighting-bake.txt";

        [MenuItem("Tools/Character Trial/Bake Aris EX Native Lighting")]
        public static void Build()
            => Run(false);

        [MenuItem("Tools/Character Trial/Bake Remaining Aris EX04 and EX05 Lighting")]
        public static void BuildRemaining()
            => Run(true);

        [MenuItem("Tools/Character Trial/Debug EX04 Source Light Only")]
        public static void DebugOnly()
            => Run(true, true);

        [MenuItem("Tools/Character Trial/Bake Maid Yuzu EX Native Lighting")]
        public static void BuildMaidYuzu()
        {
            if (EditorApplication.isPlaying) throw new InvalidOperationException("Stop Play before baking.");
            var root = PrefabUtility.LoadPrefabContents(Characters + "花冈柚子（女仆）/Prefabs/Preview/花冈柚子（女仆）_Preview.prefab");
            try
            {
                var director = root.GetComponentInChildren<ExCameraTransition>(true).director;
                var timeline = (TimelineAsset)director.playableAsset;
                // CH0203 原 EX 是固定白色主光；其方向不能沿用战场的中性覆盖值。
                var light = director.GetComponentsInChildren<Light>(true).Single(l => l.type == LightType.Directional);
                var values = Formula(light.color.linear * light.intensity, light.transform.localToWorldMatrix);
                foreach (var track in Tracks(timeline).OfType<AnimationTrack>().Where(t => t.infiniteClip))
                {
                    var animator = Binding(director, track);
                    if (!animator) continue;
                    foreach (var renderer in animator.GetComponentsInChildren<Renderer>(true).Where(r => r.sharedMaterials.Any(HasLighting)))
                        for (int p = 0; p < Properties.Length; p++) for (int c = 0; c < 4; c++)
                            AnimationUtility.SetEditorCurve(track.infiniteClip,
                                EditorCurveBinding.FloatCurve(Path(renderer.transform, animator.transform), renderer.GetType(), "material." + Properties[p] + "." + Components[c]),
                                AnimationCurve.Constant(0, (float)timeline.duration, values[p][c]));
                    EditorUtility.SetDirty(track.infiniteClip);
                }
                AssetDatabase.SaveAssets();
            }
            finally { PrefabUtility.UnloadPrefabContents(root); }
        }

        static void Run(bool remaining, bool debugOnly = false)
        {
            var report = new StringBuilder();
            if (remaining && File.Exists(ReportPath)) report.AppendLine(File.ReadAllText(ReportPath)).AppendLine("RESUME: EX04 and EX05 only; source discontinuities use native step keys.");
            if (debugOnly) report.AppendLine("DEBUG ONLY: EX04 source 120Hz samples and step-neighbor probes; no asset writes.");
            Directory.CreateDirectory(System.IO.Path.GetDirectoryName(ReportPath));
            try
            {
                if (EditorApplication.isPlaying) throw new InvalidOperationException("Stop Play before baking.");
                if (!GraphicsSettings.lightsUseLinearIntensity || !GraphicsSettings.lightsUseColorTemperature)
                    throw new InvalidOperationException("Original lighting requires linear light intensity and color-temperature support.");
                var paths = new List<string>();
                if (!remaining) paths.Add(Characters + "天童爱丽丝（女仆）/Prefabs/Preview/天童爱丽丝（女仆）_Preview.prefab");
                for (int i = remaining ? 4 : 1; i <= (debugOnly ? 4 : 5); i++) paths.Add(Characters + "天童爱丽丝（临战）/Sequences/Preview/CH0334Ex0" + i + "_Cutin.prefab");
                foreach (string path in paths) { Bake(path, report, debugOnly); File.WriteAllText(ReportPath, report.ToString()); }
                if (debugOnly) { report.AppendLine("DEBUG ONLY COMPLETE: no animation or Timeline assets written."); File.WriteAllText(ReportPath, report.ToString()); Debug.Log(report.ToString()); return; }
                AssetDatabase.SaveAssets();
                report.AppendLine("COMPLETE. Existing native animation/event/material-swap curves retained; no backups or runtime classes generated.");
                File.WriteAllText(ReportPath, report.ToString());
                Debug.Log(report.ToString());
            }
            catch (Exception e) { report.AppendLine("FAILED: " + e); File.WriteAllText(ReportPath, report.ToString()); throw; }
        }

        static void Bake(string prefabPath, StringBuilder report, bool debugOnly = false)
        {
            var root = PrefabUtility.LoadPrefabContents(prefabPath);
            AnimationClip generated = null;
            try
            {
                root.SetActive(true);
                var transition = root.GetComponentsInChildren<ExCameraTransition>(true).Single();
                var director = transition.director;
                var timeline = director.playableAsset as TimelineAsset;
                if (!timeline) throw new InvalidOperationException("Native Timeline missing: " + prefabPath);
                string timelinePath = AssetDatabase.GetAssetPath(timeline);
                if (!timelinePath.Contains("/Sequences/Preview/")) throw new InvalidOperationException("Refusing source Timeline write: " + timelinePath);
                var tracks = Tracks(timeline).ToArray();
                var lightTracks = tracks.OfType<ActivationTrack>().Where(t => t.name == "Sequence activation Directional Light").ToArray();
                if (lightTracks.Length != 1) throw new InvalidOperationException("Ambiguous original main-light activation role: " + prefabPath);
                var lightObject = director.GetGenericBinding(lightTracks[0]) as GameObject;
                var light = lightObject ? lightObject.GetComponent<Light>() : null;
                if (!light || light.type != LightType.Directional) throw new InvalidOperationException("Source main-light binding is not a directional Light.");

                var candidates = tracks.OfType<AnimationTrack>().Where(t => t.infiniteClip && Binding(director, t) &&
                    Binding(director, t).GetComponentsInChildren<Renderer>(true).Any(r => r.sharedMaterials.Any(HasLighting))).ToArray();
                if (candidates.Length != 1) throw new InvalidOperationException("Expected one character infinite material track, found " + candidates.Length + ": " + prefabPath);
                var track = candidates[0];
                var animator = Binding(director, track);
                if (Math.Abs(new SerializedObject(track).FindProperty("m_InfiniteClipTimeOffset").doubleValue) > 1e-8 || track.applyAvatarMask && track.avatarMask)
                    throw new InvalidOperationException("Explicit time-offset/avatar-mask composition required: " + track.name);
                var renderers = animator.GetComponentsInChildren<Renderer>(true).Where(r => r.sharedMaterials.Any(HasLighting)).ToArray();
                var actorActivations = tracks.OfType<ActivationTrack>().Where(t => director.GetGenericBinding(t) == animator.gameObject).ToArray();
                if (actorActivations.Length != 1) throw new InvalidOperationException("Missing unambiguous actor visibility track.");
                var actorWindows = actorActivations[0].GetClips().OrderBy(c => c.start).ToArray();
                if (actorWindows.Length != 1 || Math.Abs(actorWindows[0].start) > 1e-8)
                    throw new InvalidOperationException("This authoring pass requires one original actor visibility interval starting at zero.");
                float visibleEnd = (float)actorWindows[0].end;
                float duration = (float)timeline.duration;
                if (visibleEnd <= 0 || duration <= 0) throw new InvalidOperationException("Invalid native duration.");
                report.AppendLine(prefabPath + " | timeline=" + timelinePath + " | actor=" + Path(animator.transform, root.transform) +
                    " | originalKeyLight=" + Path(light.transform, root.transform) + " | actorVisibleEnd=" + visibleEnd.ToString("R"));

                // Sampling is confined to this temporary prefab instance. Suppress user event callbacks;
                // all native animation, activation, nested Control tracks and light curves still evaluate.
                foreach (var d in root.GetComponentsInChildren<PlayableDirector>(true))
                    foreach (var signal in Tracks(d.playableAsset as TimelineAsset).OfType<SignalTrack>()) d.ClearGenericBinding(signal);
                transition.exStage.SetPositionAndRotation(Vector3.zero, Quaternion.identity);
                director.timeUpdateMode = DirectorUpdateMode.Manual;
                director.RebuildGraph();
                director.Play();
                var lightStates = new Dictionary<float, string>();
                Func<float, Vector4[]> sample = t =>
                {
                    // Actor is hidden after its own source activation window; preserve the last visible
                    // light at that boundary, as in NativeArisExLightingBaker's endpoint treatment.
                    director.time = Math.Max(0, Math.Min(t, Math.Min(visibleEnd, duration) - .00001));
                    director.Evaluate(); director.Evaluate();
                    Color color = Color.black;
                    if (light.isActiveAndEnabled && light.intensity > 0)
                    {
                        color = light.color.linear;
                        if (light.useColorTemperature) color *= Mathf.CorrelatedColorTemperatureToRGB(light.colorTemperature);
                        color *= light.intensity;
                    }
                    if (debugOnly) lightStates[t] = "evaluated=" + director.time.ToString("R") + " active=" + light.gameObject.activeInHierarchy +
                        " enabled=" + light.enabled + " intensity=" + light.intensity.ToString("R") + " color=" + light.color.ToString("R");
                    return Formula(color, light.transform.localToWorldMatrix);
                };
                var values = new SortedDictionary<float, Vector4[]>();
                for (int i = 0; i <= Math.Ceiling(duration * 120); i++) { float t = Mathf.Min(duration, i / 120f); values[t] = sample(t); }
                var stepRights = new HashSet<float>();
                Action<double> boundary = time =>
                {
                    if (time <= 0 || time >= Math.Min(visibleEnd, duration) - .00001) return;
                    float right = (float)time;
                    if ((double)right < time) right = AdjacentFloat(right, 1);
                    float left = AdjacentFloat(right, -1);
                    values[left] = sample(left); values[right] = sample(right); stepRights.Add(right);
                };
                foreach (var activation in tracks.OfType<ActivationTrack>())
                {
                    var target = director.GetGenericBinding(activation) as GameObject;
                    if (!target || !light.transform.IsChildOf(target.transform)) continue;
                    foreach (var clip in activation.GetClips()) { boundary(clip.start); boundary(clip.end); }
                }
                foreach (var sourceTrack in tracks.OfType<AnimationTrack>())
                {
                    var owner = Binding(director, sourceTrack);
                    if (!owner) continue;
                    Action<AnimationClip, Func<float, double>> inspect = (source, masterTime) =>
                    {
                        foreach (var binding in AnimationUtility.GetCurveBindings(source))
                        {
                            var node = string.IsNullOrEmpty(binding.path) ? owner.transform : owner.transform.Find(binding.path);
                            if (!node || !light.transform.IsChildOf(node)) continue;
                            var curve = AnimationUtility.GetEditorCurve(source, binding);
                            var keys = curve.keys;
                            for (int k = 0; k < keys.Length; k++)
                            {
                                double time = masterTime(keys[k].time);
                                if (time < 0 || time > duration) continue;
                                float t = (float)time; values[t] = sample(t);
                                bool step = binding.propertyName == "m_IsActive" || binding.propertyName == "m_Enabled" ||
                                    float.IsInfinity(keys[k].inTangent) || k > 0 && (float.IsInfinity(keys[k - 1].outTangent) ||
                                    AnimationUtility.GetKeyRightTangentMode(curve, k - 1) == AnimationUtility.TangentMode.Constant);
                                if (step) { report.AppendLine("SOURCE_STEP master=" + time.ToString("R") + " clip=" + AssetDatabase.GetAssetPath(source) + " path=" + binding.path + " property=" + binding.propertyName + " key=" + keys[k].time.ToString("R")); boundary(time); }
                            }
                        }
                    };
                    if (sourceTrack.infiniteClip)
                    {
                        double offset = new SerializedObject(sourceTrack).FindProperty("m_InfiniteClipTimeOffset").doubleValue;
                        inspect(sourceTrack.infiniteClip, t => t + offset);
                    }
                    foreach (var clip in sourceTrack.GetClips())
                    {
                        var source = (clip.asset as AnimationPlayableAsset)?.clip;
                        if (source) inspect(source, t => clip.start + (t - clip.clipIn) / clip.timeScale);
                    }
                }
                report.AppendLine("COLLECTED_STEP_TIMES " + string.Join(", ", stepRights.OrderBy(t => t).Select(t => t.ToString("R"))));
                foreach (float right in stepRights.OrderBy(t => t))
                {
                    float left = AdjacentFloat(right, -1);
                    report.AppendLine("STEP_PAIR left=" + left.ToString("R") + " " + Format(values[left]) + " | right=" + right.ToString("R") + " " + Format(values[right]));
                }
                if (debugOnly)
                {
                    var times120 = values.Keys.ToArray();
                    var largest = Enumerable.Range(1, times120.Length - 1).Select(i => new { left = times120[i - 1], right = times120[i], delta = Error(values[times120[i - 1]], values[times120[i]]) }).OrderByDescending(p => p.delta).Take(32);
                    foreach (var pair in largest)
                        report.AppendLine("SOURCE_NEIGHBOR delta=" + pair.delta.ToString("R") + " [" + pair.left.ToString("R") + "," + pair.right.ToString("R") + "] left=" + Format(values[pair.left]) + " right=" + Format(values[pair.right]));
                    foreach (float time in stepRights.OrderBy(t => t))
                    {
                        var probes = new SortedSet<float> { time, AdjacentFloat(time, -1), AdjacentFloat(time, 1), time - .001f, time - .0001f, time + .0001f, time + .001f };
                        foreach (float t in probes.Where(t => t >= 0 && t <= duration))
                        { var v = sample(t); report.AppendLine("BOUNDARY_PROBE t=" + t.ToString("R") + " " + lightStates[t] + " " + Format(v)); }
                    }
                    report.AppendLine("EX04 source sampling completed: " + values.Count + " base/key samples; no adaptive refinement or curve writes.");
                    director.Stop();
                    return;
                }
                for (int pass = 0; pass < 9; pass++)
                {
                    var add = new SortedDictionary<float, Vector4[]>(); var keys = values.Keys.ToArray();
                    float maximum = 0; string worst = "none";
                    for (int i = 1; i < keys.Length; i++) for (int q = 1; q <= 3; q++)
                    {
                        if (AdjacentFloat(keys[i - 1], 1) >= keys[i]) continue;
                        float u = q * .25f, t = Mathf.Lerp(keys[i - 1], keys[i], u);
                        // Director/AnimationClip consume representable float times. Near the original
                        // fast Euler turn, quarter times round to uneven fractions or an endpoint.
                        // Compare at the actual sampled time; never refine a duplicate endpoint.
                        if (t <= keys[i - 1] || t >= keys[i]) continue;
                        u = (float)(((double)t - keys[i - 1]) / ((double)keys[i] - keys[i - 1]));
                        var actual = sample(t);
                        var interpolated = Interpolate(values[keys[i - 1]], values[keys[i]], u);
                        float error = Error(actual, interpolated);
                        if (error > maximum) { maximum = error; worst = "interval=[" + keys[i - 1].ToString("R") + "," + keys[i].ToString("R") + "] t=" + t.ToString("R") + " actual=" + Format(actual) + " expected=" + Format(interpolated) + " left=" + Format(values[keys[i - 1]]) + " right=" + Format(values[keys[i]]); }
                        if (error > Tolerance) add[t] = actual;
                    }
                    report.AppendLine("REFINE pass=" + pass + " maxError=" + maximum.ToString("R") + " newKeys=" + add.Count + " " + worst);
                    if (add.Count == 0) break;
                    if (pass == 8 || values.Count + add.Count > 30000) throw new InvalidOperationException("Source lighting requires explicit discontinuity handling. " + worst);
                    foreach (var item in add) values[item.Key] = item.Value;
                }
                generated = Object.Instantiate(track.infiniteClip);
                // Source Recorded clips contain no HaloRoot transform curves; do not freeze the actor halo.
                var halo = AnimationUtility.GetCurveBindings(generated).Where(b => b.type == typeof(Transform) && b.path == "HaloRoot").ToArray();
                AnimationUtility.SetEditorCurves(generated, halo, new AnimationCurve[halo.Length]);
                generated.name = track.infiniteClip.name + "_NativeExLighting";
                var baked = new AnimationCurve[4, 4];
                var times = values.Keys.ToArray();
                for (int p = 0; p < 4; p++) for (int c = 0; c < 4; c++)
                {
                    var curve = new AnimationCurve(values.Select(v => new Keyframe(v.Key, v.Value[p][c])).ToArray());
                    for (int k = 0; k < curve.length; k++) { AnimationUtility.SetKeyLeftTangentMode(curve, k, AnimationUtility.TangentMode.Linear); AnimationUtility.SetKeyRightTangentMode(curve, k, AnimationUtility.TangentMode.Linear); }
                    for (int k = 1; k < times.Length; k++) if (stepRights.Contains(times[k]) && times[k - 1] == AdjacentFloat(times[k], -1))
                        AnimationUtility.SetKeyRightTangentMode(curve, k - 1, AnimationUtility.TangentMode.Constant);
                    baked[p, c] = curve;
                    foreach (var renderer in renderers) AnimationUtility.SetEditorCurve(generated, EditorCurveBinding.FloatCurve(Path(renderer.transform, animator.transform), renderer.GetType(), "material." + Properties[p] + "." + Components[c]), curve);
                }
                float maxError = 0;
                foreach (var item in values) for (int p = 0; p < 4; p++) for (int c = 0; c < 4; c++)
                    maxError = Mathf.Max(maxError, Mathf.Abs(item.Value[p][c] - baked[p, c].Evaluate(item.Key)));
                if (maxError > Tolerance) throw new InvalidOperationException("Sampled native light-key validation failed: " + maxError);
                director.Stop();
                // Only the cloned AnimationClip and native track reference are persisted. Never save
                // these prefab contents after sampling: that would serialize an evaluated animation pose.
                string folder = System.IO.Path.GetDirectoryName(timelinePath).Replace('\\', '/') + "/Lighting";
                if (!AssetDatabase.IsValidFolder(folder)) AssetDatabase.CreateFolder(System.IO.Path.GetDirectoryName(folder).Replace('\\', '/'), "Lighting");
                string output = folder + "/" + System.IO.Path.GetFileNameWithoutExtension(timelinePath) + "_CharacterLight.anim";
                var existing = AssetDatabase.LoadAssetAtPath<AnimationClip>(output);
                if (existing) { EditorUtility.CopySerialized(generated, existing); Object.DestroyImmediate(generated); generated = null; }
                else { AssetDatabase.CreateAsset(generated, output); existing = generated; generated = null; }
                EditorUtility.SetDirty(existing);
                var so = new SerializedObject(track);
                so.FindProperty("m_InfiniteClip").objectReferenceValue = existing;
                so.ApplyModifiedPropertiesWithoutUndo();
                EditorUtility.SetDirty(track); EditorUtility.SetDirty(timeline);
                AssetDatabase.SaveAssets();
                report.AppendLine("  BAKED " + output + " | renderers=" + renderers.Length + " | keys=" + values.Count + " | nativeStepBoundaries=" + stepRights.Count + " | sampledKeyMaxError=" + maxError.ToString("R"));
            }
            finally { if (generated) Object.DestroyImmediate(generated); PrefabUtility.UnloadPrefabContents(root); }
        }

        static bool HasLighting(Material m) => m && Properties.All(m.HasProperty);
        static string Format(Vector4[] values) => string.Join(" ", values.Select((v, i) => Properties[i] + "=" + v.ToString("R")));
        static float AdjacentFloat(float value, int direction)
            => BitConverter.ToSingle(BitConverter.GetBytes(BitConverter.ToInt32(BitConverter.GetBytes(value), 0) + direction), 0);
        static string Path(Transform t, Transform root) => AnimationUtility.CalculateTransformPath(t, root);
        static Animator Binding(PlayableDirector d, TrackAsset track)
        {
            for (var t = track; t; t = t.parent as TrackAsset)
            { var value = d.GetGenericBinding(t); if (value is Animator a) return a; if (value is GameObject go && go.GetComponent<Animator>()) return go.GetComponent<Animator>(); }
            return null;
        }
        static IEnumerable<TrackAsset> Tracks(TimelineAsset timeline)
        {
            if (!timeline) yield break;
            var pending = new Stack<TrackAsset>(timeline.GetRootTracks());
            while (pending.Count > 0) { var t = pending.Pop(); yield return t; foreach (var child in t.GetChildTracks()) pending.Push(child); }
        }
        static Vector4[] Formula(Color c, Matrix4x4 matrix)
        {
            float max = Mathf.Max(c.r, Mathf.Max(c.g, c.b)), min = Mathf.Min(c.r, Mathf.Min(c.g, c.b)), divisor = Mathf.Max(max, .0001f);
            var n = new Vector3(c.r / divisor, c.g / divisor, c.b / divisor);
            var tone = Vector3.Lerp(n, Vector3.one, .25f);
            var shadow = Vector3.Lerp(Vector3.one, .5f * n, Mathf.Clamp01(.88f * (max - min) / divisor));
            var z = matrix.GetColumn(2);
            return new[] { new Vector4(-z.x, -z.y, -z.z, 0), new Vector4(tone.x, tone.y, tone.z, 0), new Vector4(shadow.x, shadow.y, shadow.z, 0), new Vector4(.85f * max + .15f, .5f * (max + min), 0, 0) };
        }
        static Vector4[] Interpolate(Vector4[] a, Vector4[] b, float u) => a.Select((v, i) => Vector4.LerpUnclamped(v, b[i], u)).ToArray();
        static float Error(Vector4[] a, Vector4[] b)
        { float error = 0; for (int p = 0; p < 4; p++) for (int c = 0; c < 4; c++) error = Mathf.Max(error, Mathf.Abs(a[p][c] - b[p][c])); return error; }
    }
}
