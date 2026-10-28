#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using Game.Battle;
using UnityEditor;
using UnityEditor.Animations;
using UnityEditor.SceneManagement;
using UnityEngine;
using Object = UnityEngine.Object;

// 独立装配：复制 Controller，保留演示现有 Override，再给移动结束接原刹车动作。
public static class SquadBrakeSetup
{
    const string Folder = "Assets/GameRes/Battle/Animations";

    [MenuItem("Tools/Blue Archive/Build Squad Brakes")]
    public static void Build()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("请先退出 Play。");
        var battle = Object.FindObjectOfType<BattleSession>();
        if (!battle || battle.allies == null || battle.allies.Length != 4)
            throw new InvalidOperationException("请先打开已装配四人的 Squad Demo 场景。");
        if (!AssetDatabase.IsValidFolder(Folder))
            throw new InvalidOperationException("缺少演示动画目录：" + Folder);

        foreach (var unit in battle.allies)
        {
            var name = unit.definition.displayName;
            var animator = unit.presentation.animator;
            var effective = new Dictionary<AnimationClip, AnimationClip>();
            var source = Flatten(animator.runtimeAnimatorController, effective);
            var original = source as AnimatorController;
            if (!original) throw new InvalidOperationException(name + " 缺少基础 AnimatorController。");

            string basePath = Folder + "/" + name + "_Brake.controller";
            var brake = AssetDatabase.LoadAssetAtPath<AnimatorController>(basePath);
            if (!brake)
            {
                string sourcePath = AssetDatabase.GetAssetPath(original);
                if (string.IsNullOrEmpty(sourcePath) || !AssetDatabase.CopyAsset(sourcePath, basePath))
                    throw new InvalidOperationException(name + " 无法复制基础 Controller。");
                brake = AssetDatabase.LoadAssetAtPath<AnimatorController>(basePath);
            }
            WireBrake(brake, name);
            WireContinuousAttack(brake);
            var machine = brake.layers[0].stateMachine;
            AnimatorState defeat = null;
            foreach (var state in machine.states)
                if (state.state.name == "Defeat_Vital_Death") defeat = state.state;
            if (!defeat) defeat = machine.AddState("Defeat_Vital_Death");
            defeat.motion = AssetDatabase.LoadAssetAtPath<AnimationClip>(
                "Assets/GameRes/Characters/" + name + "/Animations/Vital_Death.anim");

            string overridePath = Folder + "/" + name + "_Brake.overrideController";
            var result = AssetDatabase.LoadAssetAtPath<AnimatorOverrideController>(overridePath);
            if (!result) result = new AnimatorOverrideController(brake);
            else result.runtimeAnimatorController = brake;
            var pairs = new List<KeyValuePair<AnimationClip, AnimationClip>>();
            result.GetOverrides(pairs);
            for (int i = 0; i < pairs.Count; i++)
            {
                var key = pairs[i].Key;
                if (!effective.TryGetValue(key, out var clip)) clip = key;
                pairs[i] = new KeyValuePair<AnimationClip, AnimationClip>(key, clip);
            }
            result.ApplyOverrides(pairs);
            if (!AssetDatabase.Contains(result)) AssetDatabase.CreateAsset(result, overridePath);
            animator.runtimeAnimatorController = result;
            PrefabUtility.RecordPrefabInstancePropertyModifications(animator);
            unit.definition.stopState = "Base Layer.MoveStop";
            EditorUtility.SetDirty(brake);
            EditorUtility.SetDirty(result);
            EditorUtility.SetDirty(unit.definition);
            SaveDemoPrefab(name, result);
        }
        AssetDatabase.SaveAssets();
        EditorSceneManager.SaveScene(battle.gameObject.scene);
        Debug.Log("Squad Demo：四人的原版刹车动作已接入演示专用 Controller。");
    }

    [MenuItem("Tools/Blue Archive/Connect Continuous Normal Attacks")]
    public static void ConnectContinuousAttacks()
    {
        if (EditorApplication.isPlaying) throw new InvalidOperationException("请先退出 Play。");
        foreach (var name in new[] { "天童爱丽丝", "才羽绿", "才羽桃井", "花冈柚子" })
            WireContinuousAttack(AssetDatabase.LoadAssetAtPath<AnimatorController>(
                Folder + "/" + name + "_Brake.controller"));
        AssetDatabase.SaveAssets();
    }

    static void WireContinuousAttack(AnimatorController controller)
    {
        // 原版 NormalAttackAction：Start 一次，Ing/Delay 循环；停止或弹空才进 End。
        var machine = controller.layers[0].stateMachine;
        bool aris = controller.name.StartsWith("天童爱丽丝");
        var fire = FindState(machine, aris ? "Attack_Normal_Attack_Ing" : "Attack");
        var delay = FindState(machine, aris ? "Attack_Normal_Attack_Delay" : "AttackDelay");
        var end = FindState(machine, aris ? "Attack_Normal_Attack_End" : "AttackEnd");
        bool hasParameter = Array.Exists(controller.parameters, p => p.name == "KeepAttacking");
        if (!hasParameter) controller.AddParameter("KeepAttacking", AnimatorControllerParameterType.Bool);
        float blend = fire.transitions[0].duration;
        bool fixedDuration = fire.transitions[0].hasFixedDuration;
        // 保留各条已调好的过渡，不把一条的时长覆盖到整个攻击循环。
        float fireEndBlend = BlendTo(fire, end, blend);
        float repeatBlend = BlendTo(delay, fire, blend);
        float delayEndBlend = BlendTo(delay, end, blend);
        foreach (var transition in fire.transitions) fire.RemoveTransition(transition);
        foreach (var transition in delay.transitions) delay.RemoveTransition(transition);
        AttackTransition(fire, delay, true, true, blend, fixedDuration);
        AttackTransition(fire, end, false, true, fireEndBlend, fixedDuration);
        AttackTransition(delay, fire, true, true, repeatBlend, fixedDuration);
        AttackTransition(delay, end, false, false, delayEndBlend, fixedDuration);
        EditorUtility.SetDirty(controller);
    }

    static float BlendTo(AnimatorState from, AnimatorState to, float fallback)
    {
        foreach (var transition in from.transitions)
            if (transition.destinationState == to) return transition.duration;
        return fallback;
    }

    static void AttackTransition(AnimatorState from, AnimatorState to,
        bool continuing, bool finishClip, float blend, bool fixedDuration)
    {
        var transition = from.AddTransition(to);
        transition.hasExitTime = finishClip;
        transition.exitTime = 1f;
        transition.hasFixedDuration = fixedDuration;
        transition.duration = blend;
        transition.AddCondition(continuing ? AnimatorConditionMode.If : AnimatorConditionMode.IfNot,
            0, "KeepAttacking");
    }

    static RuntimeAnimatorController Flatten(RuntimeAnimatorController source,
        Dictionary<AnimationClip, AnimationClip> effective)
    {
        if (!(source is AnimatorOverrideController layer))
        {
            foreach (var clip in source.animationClips)
                if (clip && !effective.ContainsKey(clip)) effective.Add(clip, clip);
            return source;
        }
        var basis = Flatten(layer.runtimeAnimatorController, effective);
        var pairs = new List<KeyValuePair<AnimationClip, AnimationClip>>();
        layer.GetOverrides(pairs);
        foreach (var pair in pairs)
        {
            if (!pair.Value) continue;
            AnimationClip key = null;
            foreach (var candidate in effective.Keys)
                if (candidate == pair.Key || effective[candidate] == pair.Key)
                { key = candidate; break; }
            if (!key) throw new InvalidOperationException("Override 来源不明：" + pair.Key.name);
            effective[key] = pair.Value;
        }
        return basis;
    }

    static void WireBrake(AnimatorController controller, string name)
    {
        var machine = controller.layers[0].stateMachine;
        var states = machine.states;
        AnimatorState move = null, idle = null, stop = null;
        foreach (var child in states)
        {
            var state = child.state;
            if (state.name == "Move") move = state;
            if (state.name == "Idle") idle = state;
            if (state.name == "MoveStop" || state.name == "MoveEnd" ||
                state.name == "Move_End_Normal" && stop == null) stop = state;
        }
        if (!move || !idle)
            throw new InvalidOperationException(name + " 缺少 Move、Idle 或原版 Move_End_Normal 动作。");
        if (!stop)
        {
            // 小绿的原状态在 Library 子状态机；只取动作，不动 Library。
            var originalStop = FindState(machine, "Move_End_Normal");
            if (!originalStop || !originalStop.motion)
                throw new InvalidOperationException(name + " 的 Library 缺少 Move_End_Normal 动作。");
            stop = machine.AddState("MoveStop");
            stop.motion = originalStop.motion;
            stop.speed = originalStop.speed;
        }
        if (!stop.motion)
            throw new InvalidOperationException(name + " 的刹车状态没有动作。");
        stop.name = "MoveStop";
        AnimatorStateTransition leaving = null;
        foreach (var transition in move.transitions)
            foreach (var condition in transition.conditions)
                if (condition.parameter == "Moving" && condition.mode == AnimatorConditionMode.IfNot)
                    leaving = transition;
        if (!leaving) throw new InvalidOperationException(name + " 缺少 Moving=false 的退出转换。");

        if (leaving.destinationState == idle) leaving.destinationState = stop;
        if (leaving.destinationState != stop)
            throw new InvalidOperationException(name + " 的 Move 退出没有连接到刹车状态。");
        bool returnsToIdle = false;
        foreach (var transition in stop.transitions)
            if (transition.destinationState == idle && transition.hasExitTime) returnsToIdle = true;
        if (!returnsToIdle && name == "才羽绿")
        {
            // 保留 Move 原退出转换；新加的刹车按原片段播完，再回 Idle。
            var finish = stop.AddTransition(idle);
            finish.hasExitTime = true;
            finish.exitTime = 1f;
            finish.hasFixedDuration = leaving.hasFixedDuration;
            finish.duration = leaving.duration;
            returnsToIdle = true;
        }
        if (!returnsToIdle) throw new InvalidOperationException(name + " 的刹车状态不能自然返回 Idle。");
    }

    static AnimatorState FindState(AnimatorStateMachine machine, string stateName)
    {
        foreach (var child in machine.states)
            if (child.state.name == stateName) return child.state;
        foreach (var child in machine.stateMachines)
        {
            var found = FindState(child.stateMachine, stateName);
            if (found) return found;
        }
        return null;
    }

    static void SaveDemoPrefab(string name, RuntimeAnimatorController controller)
    {
        string path = "Assets/GameRes/Battle/Characters/" + name + ".prefab";
        if (!AssetDatabase.LoadAssetAtPath<GameObject>(path)) return;
        var root = PrefabUtility.LoadPrefabContents(path);
        try
        {
            var unit = root.GetComponent<CharacterUnit>();
            if (!unit || !unit.presentation)
                throw new InvalidOperationException(name + " 演示 Prefab 缺少 CharacterUnit/Presentation。");
            unit.presentation.animator.runtimeAnimatorController = controller;
            PrefabUtility.RecordPrefabInstancePropertyModifications(unit.presentation.animator);
            unit.definition.stopState = "Base Layer.MoveStop";
            PrefabUtility.SaveAsPrefabAsset(root, path);
        }
        finally { PrefabUtility.UnloadPrefabContents(root); }
    }
}
#endif
