using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using YooAsset;

public static class OperationMonitor
{
    private static OperationMonitorDriver _driver;

    public static void RegisterOperationCallback()
    {
        if (_driver != null)
            return;
        // YooAsset 3 removed global callbacks. Observe the scheduler queues and
        // subscribe to each operation without modifying scheduling or execution.
        var go = new GameObject("YooAsset Operation Monitor");
        UnityEngine.Object.DontDestroyOnLoad(go);
        _driver = go.AddComponent<OperationMonitorDriver>();
    }
}

[DefaultExecutionOrder(32000)]
public sealed class OperationMonitorDriver : MonoBehaviour
{
    private static readonly FieldInfo Schedulers = RequiredField(typeof(AsyncOperationSystem), "_schedulerDict", true);
    private static readonly FieldInfo Running = RequiredField(typeof(AsyncOperationScheduler), "_runningOperations", false);
    private static readonly FieldInfo Pending = RequiredField(typeof(AsyncOperationScheduler), "_pendingOperations", false);
    private readonly HashSet<AsyncOperationBase> _observed = new HashSet<AsyncOperationBase>();
    private readonly HashSet<AsyncOperationBase> _current = new HashSet<AsyncOperationBase>();

    private static FieldInfo RequiredField(Type type, string name, bool isStatic)
    {
        var field = type.GetField(name, BindingFlags.NonPublic | (isStatic ? BindingFlags.Static : BindingFlags.Instance));
        if (field == null)
            throw new MissingFieldException(type.FullName, name);
        return field;
    }

    private void LateUpdate()
    {
        _current.Clear();
        foreach (DictionaryEntry entry in (IDictionary)Schedulers.GetValue(null))
        {
            Observe((IEnumerable)Running.GetValue(entry.Value));
            Observe((IEnumerable)Pending.GetValue(entry.Value));
        }
        _observed.RemoveWhere(operation => !_current.Contains(operation));
    }

    private void Observe(IEnumerable operations)
    {
        foreach (AsyncOperationBase operation in operations)
        {
            _current.Add(operation);
            if (!_observed.Add(operation))
                continue;
            Debug.Log($"Operation start : {operation.GetType().Name}");
            operation.Completed += OnFinished;
        }
    }

    private void OnFinished(AsyncOperationBase operation)
    {
        operation.Completed -= OnFinished;
        Debug.Log($"Operation finish : {operation.GetType().Name}");
    }

    private void OnDestroy()
    {
        foreach (var operation in _observed)
            operation.Completed -= OnFinished;
        _observed.Clear();
    }
}
