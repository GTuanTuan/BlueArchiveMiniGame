using System;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

/// <summary>Releases leases after Unity's deferred destruction, including never-enabled objects.</summary>
[AddComponentMenu("")]
public sealed class UIWindowAssetLifetime : MonoBehaviour
{
    private sealed class Lease
    {
        public UnityEngine.Object[] Owners;
        public IDisposable Resource;
    }
    private static UIWindowAssetLifetime _instance;
    private readonly List<Lease> _leases = new List<Lease>();
    private static bool _quitting;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
    private static void ResetStatics()
    {
        _instance = null;
        _quitting = false;
    }

    private sealed class Registration : IDisposable
    {
        private UIWindowAssetLifetime _observer;
        private readonly Lease _lease;
        public Registration(UIWindowAssetLifetime observer, Lease lease) { _observer = observer; _lease = lease; }
        public void Dispose()
        {
            if (_observer != null) _observer._leases.Remove(_lease);
            _observer = null;
        }
    }

    public static void Retain(GameObject instance, AssetHandle handle) => Track(instance, handle);
    public static IDisposable Track(UnityEngine.Object owner, IDisposable resource) => Track(new[] { owner }, resource);

    public static IDisposable Track(UnityEngine.Object[] owners, IDisposable resource)
    {
        if (resource == null) throw new ArgumentNullException(nameof(resource));
        if (_quitting) { resource.Dispose(); return null; }
        if (_instance == null)
        {
            var host = new GameObject("UI Asset Lifetime");
            host.hideFlags = HideFlags.HideInHierarchy;
            DontDestroyOnLoad(host);
            _instance = host.AddComponent<UIWindowAssetLifetime>();
        }
        var lease = new Lease { Owners = owners, Resource = resource };
        _instance._leases.Add(lease);
        return new Registration(_instance, lease);
    }

    private void LateUpdate()
    {
        for (int index = _leases.Count - 1; index >= 0; index--)
        {
            var lease = _leases[index];
            bool alive = false;
            foreach (var owner in lease.Owners) if (owner != null) { alive = true; break; }
            if (alive) continue;
            _leases.RemoveAt(index);
            try { lease.Resource.Dispose(); }
            catch (Exception exception) { Debug.LogException(exception); }
        }
    }

    private void OnApplicationQuit() { _quitting = true; }

    private void OnDestroy()
    {
        if (_instance == this) _instance = null;
        var leases = _leases.ToArray();
        _leases.Clear();
        foreach (var lease in leases)
        {
            try { lease.Resource.Dispose(); }
            catch (Exception exception) { Debug.LogException(exception); }
        }
    }
}
