#if UNITY_EDITOR
using System;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace SimpleCharacterTrial.Editor
{
    public static class AddMomoiExAreaHitEvents
    {
        const string ClipPath = "Assets/GameRes/Characters/才羽桃井/Animations/Momoi_Original_FieldVoice_Exs.anim";
        const string HitName = "FX_Momoi_Original_Ex01_Hit_Variant";

        [MenuItem("Tools/Simple Character Trial/Add Momoi EX Area Hit Events")]
        public static void Build()
        {
            var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(ClipPath);
            if (!clip) throw new InvalidOperationException("Missing generated field clip: " + ClipPath);
            var hits = AssetDatabase.FindAssets(HitName + " t:Prefab")
                .Select(AssetDatabase.GUIDToAssetPath)
                .Select(path => AssetDatabase.LoadAssetAtPath<GameObject>(path))
                .Where(prefab => prefab && prefab.name == HitName).ToArray();
            if (hits.Length != 1) throw new InvalidOperationException("Expected one original Momoi hit prefab; found " + hits.Length);

            var events = AnimationUtility.GetAnimationEvents(clip).Where(e => e.functionName != "OnAreaHit").ToList();
            if (!events.Any(e => e.functionName == "OnAnimationEvent" && e.stringParameter == "SkillEnd"))
                throw new InvalidOperationException("The selected Exs clip has no SkillEnd event: " + ClipPath);
            // MomoiEx01: ActionRelease 35/50/65/70, FanArea HitFrames[1], Radius 850, Degree 45.
            foreach (int frame in new[] { 36, 51, 66, 71 })
                events.Add(new AnimationEvent { time = frame / 30f, functionName = "OnAreaHit",
                    objectReferenceParameter = hits[0], floatParameter = 8.5f, intParameter = 45,
                    stringParameter = "BodyBone" });
            AnimationUtility.SetAnimationEvents(clip, events.OrderBy(e => e.time).ToArray());
            EditorUtility.SetDirty(clip);
            AssetDatabase.SaveAssets();
            Debug.Log("Momoi EX area hit events written to " + ClipPath);
        }

        [MenuItem("Tools/Simple Character Trial/Add Maid Momoi EX Buff Events")]
        public static void BuildMaid()
        {
            const string root = "Assets/GameRes/Characters/才羽桃井（女仆）/";
            const string clipPath = root + "Animations/Gameplay/Exs.anim";
            const string voicePath = root + "Audio/Voice/CH0201_ExSkill_Level_1.ogg";
            const string buffPath = root + "Effects/Prefabs/FX_CH0201_Ex01_Buff_Start.prefab";
            const string previewPath = root + "Prefabs/Preview/才羽桃井（女仆）_Preview.prefab";
            const string anchorPath = "EX_Root/FX_Local_DM";
            var clip = AssetDatabase.LoadAssetAtPath<AnimationClip>(clipPath);
            var voice = AssetDatabase.LoadAssetAtPath<AudioClip>(voicePath);
            var buff = AssetDatabase.LoadAssetAtPath<GameObject>(buffPath);
            if (!clip || !voice || !buff || !AssetDatabase.LoadAssetAtPath<GameObject>(previewPath))
                throw new InvalidOperationException("Maid Momoi EX clip, voice, buff prefab or preview prefab is missing.");
            var events = AnimationUtility.GetAnimationEvents(clip).Where(e =>
                !(e.functionName == "OnAudioEvent" && e.objectReferenceParameter == voice) &&
                !(e.functionName == "OnEffectEvent" && e.objectReferenceParameter == buff) &&
                !(e.functionName == "StopEffect" && e.objectReferenceParameter == buff)).ToList();
            if (!events.Any(e => e.functionName == "OnAnimationEvent" && e.stringParameter == "SkillEnd"))
                throw new InvalidOperationException("Maid Momoi Exs clip has no SkillEnd event.");
            events.Add(new AnimationEvent { time = 1f / 30f, functionName = "OnAudioEvent",
                objectReferenceParameter = voice, floatParameter = 1f });
            events.Add(new AnimationEvent { time = 36f / 30f, functionName = "OnEffectEvent",
                objectReferenceParameter = buff, stringParameter = anchorPath });
            events.Add(new AnimationEvent { time = 70f / 30f, functionName = "StopEffect",
                objectReferenceParameter = buff });
            AnimationUtility.SetAnimationEvents(clip, events.OrderBy(e => e.time).ToArray());
            EditorUtility.SetDirty(clip);

            var preview = PrefabUtility.LoadPrefabContents(previewPath);
            try
            {
                var exRoot = preview.transform.Find("EX_Root");
                if (!exRoot) { exRoot = new GameObject("EX_Root").transform; exRoot.SetParent(preview.transform, false); }
                var anchor = exRoot.Find("FX_Local_DM");
                if (!anchor) { anchor = new GameObject("FX_Local_DM").transform; anchor.SetParent(exRoot, false); }
                if (exRoot.localPosition != Vector3.zero || exRoot.localRotation != Quaternion.identity || exRoot.localScale != Vector3.one ||
                    anchor.localPosition != Vector3.zero || anchor.localRotation != Quaternion.identity || anchor.localScale != Vector3.one)
                    throw new InvalidOperationException("The gameplay buff anchor must retain the original identity transform.");
                PrefabUtility.SaveAsPrefabAsset(preview, previewPath);
            }
            finally { PrefabUtility.UnloadPrefabContents(preview); }
            AssetDatabase.SaveAssets();
            Debug.Log("Maid Momoi EX voice, buff events and gameplay anchor written.");
        }
    }
}
#endif
