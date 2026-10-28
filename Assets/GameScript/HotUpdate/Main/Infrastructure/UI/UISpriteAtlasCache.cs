using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.U2D;
using UnityEngine.UI;
using YooAsset;

/// <summary>
/// Shares one YooAsset handle per atlas. A binding owns its Image assignment;
/// disposing it (or destroying the Image) releases that reference automatically.
/// Sprite clones are kept until all bound Images have stopped using the atlas.
/// </summary>
public sealed class UISpriteAtlasCache : IDisposable
{
    private sealed class Entry
    {
        public string Address;
        public AssetHandle Handle;
        public Action<AssetHandle> Completion;
        public SpriteAtlas Atlas;
        public readonly Dictionary<string, Sprite> Sprites = new Dictionary<string, Sprite>(StringComparer.Ordinal);
        public readonly HashSet<Binding> Bindings = new HashSet<Binding>();
    }

    private sealed class HandleLease : IDisposable
    {
        private AssetHandle _handle;
        public HandleLease(AssetHandle handle) { _handle = handle; }
        public void Dispose()
        {
            var handle = _handle;
            _handle = null;
            if (handle != null && handle.IsValid) handle.Release();
        }
    }

    private sealed class Binding : IDisposable
    {
        public UISpriteAtlasCache Cache;
        public Entry Entry;
        public Image Target;
        public string SpriteName;
        public Action<string> ErrorCallback;
        public IDisposable Observation;
        public Sprite Assigned;
        public Sprite Previous;
        public bool Disposed;

        public void Dispose()
        {
            if (Disposed) return;
            Disposed = true;
            Observation?.Dispose();
            Observation = null;
            if (Target != null && Assigned != null && Target.sprite == Assigned) Target.sprite = Previous;
            Cache.Release(this);
            Target = null;
            Assigned = Previous = null;
            ErrorCallback = null;
        }
    }

    private readonly ResourcePackage _package;
    private readonly Dictionary<string, Entry> _entries = new Dictionary<string, Entry>(StringComparer.Ordinal);
    private readonly Dictionary<Image, Binding> _targets = new Dictionary<Image, Binding>();
    private bool _disposed;

    public UISpriteAtlasCache(ResourcePackage package)
    {
        _package = package ?? throw new ArgumentNullException(nameof(package));
    }

    public IDisposable Bind(string atlasAddress, string spriteName, Image target, Action<string> onError = null)
    {
        if (_disposed) throw new ObjectDisposedException(nameof(UISpriteAtlasCache));
        if (target == null) throw new ArgumentNullException(nameof(target));
        if (string.IsNullOrWhiteSpace(atlasAddress)) throw new ArgumentException("An atlas address is required.", nameof(atlasAddress));
        if (string.IsNullOrWhiteSpace(spriteName)) throw new ArgumentException("A sprite name is required.", nameof(spriteName));
        if (_targets.TryGetValue(target, out var previous)) previous.Dispose();

        bool load = !_entries.TryGetValue(atlasAddress, out var entry);
        if (load)
        {
            entry = new Entry { Address = atlasAddress };
            _entries.Add(atlasAddress, entry);
        }
        var binding = new Binding {
            Cache = this, Entry = entry, Target = target, SpriteName = spriteName,
            Previous = target.sprite, ErrorCallback = onError
        };
        entry.Bindings.Add(binding);
        _targets.Add(target, binding);
        binding.Observation = UIWindowAssetLifetime.Track(target, binding);

        if (!load)
        {
            if (entry.Atlas != null) Assign(binding);
            return binding;
        }
        try
        {
            entry.Handle = _package.LoadAssetAsync<SpriteAtlas>(atlasAddress);
            var captured = entry;
            entry.Completion = _ => Complete(captured);
            if (entry.Handle.IsDone) Complete(entry);
            else entry.Handle.Completed += entry.Completion;
        }
        catch (Exception exception) { Fail(entry, exception.Message); }
        return binding;
    }

    private void Complete(Entry entry)
    {
        if (!_entries.TryGetValue(entry.Address, out var current) || !ReferenceEquals(current, entry)) return;
        entry.Handle.Completed -= entry.Completion;
        if (entry.Handle.Status != EOperationStatus.Succeeded || !(entry.Handle.AssetObject is SpriteAtlas atlas))
        {
            Fail(entry, entry.Handle.Error);
            return;
        }
        entry.Atlas = atlas;
        foreach (var binding in new List<Binding>(entry.Bindings)) Assign(binding);
    }

    private void Assign(Binding binding)
    {
        if (binding.Disposed) return;
        if (binding.Target == null) { binding.Dispose(); return; }
        var entry = binding.Entry;
        if (!entry.Sprites.TryGetValue(binding.SpriteName, out var sprite))
        {
            sprite = entry.Atlas.GetSprite(binding.SpriteName);
            if (sprite == null)
            {
                NotifyError(binding, $"Atlas '{entry.Address}' has no sprite '{binding.SpriteName}'.");
                binding.Dispose();
                return;
            }
            entry.Sprites.Add(binding.SpriteName, sprite);
        }
        binding.Assigned = sprite;
        binding.Target.sprite = sprite;
    }

    private void Fail(Entry entry, string error)
    {
        foreach (var binding in new List<Binding>(entry.Bindings))
        {
            NotifyError(binding, $"Cannot load atlas '{entry.Address}': {error}");
            binding.Dispose();
        }
    }

    private static void NotifyError(Binding binding, string error)
    {
        Debug.LogWarning(error);
        try { binding.ErrorCallback?.Invoke(error); }
        catch (Exception exception) { Debug.LogException(exception); }
    }

    private void Release(Binding binding)
    {
        // Unity fake-null objects remain usable as dictionary keys.
        if (!ReferenceEquals(binding.Target, null) && _targets.TryGetValue(binding.Target, out var current) && ReferenceEquals(current, binding))
            _targets.Remove(binding.Target);
        var entry = binding.Entry;
        entry.Bindings.Remove(binding);
        if (entry.Bindings.Count != 0) return;
        _entries.Remove(entry.Address);
        if (entry.Handle == null) return;
        entry.Handle.Completed -= entry.Completion;
        var clones = new List<UnityEngine.Object>();
        foreach (var sprite in entry.Sprites.Values)
        {
            clones.Add(sprite);
            UnityEngine.Object.Destroy(sprite);
        }
        entry.Sprites.Clear();
        if (clones.Count == 0) new HandleLease(entry.Handle).Dispose();
        else UIWindowAssetLifetime.Track(clones.ToArray(), new HandleLease(entry.Handle));
        entry.Handle = null;
        entry.Atlas = null;
    }

    public void Dispose()
    {
        if (_disposed) return;
        _disposed = true;
        foreach (var binding in new List<Binding>(_targets.Values)) binding.Dispose();
    }
}
