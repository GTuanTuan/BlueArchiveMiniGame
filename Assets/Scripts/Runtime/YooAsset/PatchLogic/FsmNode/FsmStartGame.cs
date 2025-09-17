using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UniFramework.Machine;
using YooAsset;

internal class FsmStartGame : IStateNode
{
    private PatchOperation _owner;
    private StateMachine _machine;
    PatchOperationData data;

    void IStateNode.OnCreate(StateMachine machine)
    {
        _owner = machine.Owner as PatchOperation;
        _machine = machine;
    }
    void IStateNode.OnEnter()
    {
        data = (PatchOperationData)_machine.GetBlackboardValue("PatchOperationData");
        if (data.playMode != EPlayMode.EditorSimulateMode)
        {
            var packageVersion = (string)_machine.GetBlackboardValue($"{data.packageName}_Version");
            PlayerPrefs.SetString($"{data.packageName}_Version", packageVersion);
            Debug.Log($"{data.packageName} 更新流程完毕 保存版本{packageVersion}");
        }
        _owner.SetFinish();
    }
    void IStateNode.OnUpdate()
    {
    }
    void IStateNode.OnExit()
    {
    }
}