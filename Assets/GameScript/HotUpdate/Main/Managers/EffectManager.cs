using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

public class EffectManager : SingletonMono<EffectManager>
{
    private readonly HashSet<GameObject> held = new HashSet<GameObject>();
    private readonly HashSet<GameObject> nativeEffects = new HashSet<GameObject>();
    private readonly Dictionary<GameObject, AudioSource[]> attachedVoices = new Dictionary<GameObject, AudioSource[]>();
    private readonly Dictionary<GameObject, float> expireUntil = new Dictionary<GameObject, float>();
    private readonly HashSet<GameObject> stopped = new HashSet<GameObject>();
    private readonly HashSet<GameObject> expiryProjectiles = new HashSet<GameObject>();
    private readonly Dictionary<GameObject, float> trailUntil = new Dictionary<GameObject, float>();

    public GameObject Play(GameObject prefab, Vector3 position, Quaternion rotation,
        Transform parent = null, bool manualStop = false)
        => PlayCore(prefab, position, rotation, parent, manualStop, null, false);

    public GameObject Play(GameObject prefab, Vector3 position, Quaternion rotation,
        Transform parent, bool manualStop, CharacterSound[] sounds)
        => PlayCore(prefab, position, rotation, parent, manualStop, sounds, true);

    GameObject PlayCore(GameObject prefab, Vector3 position, Quaternion rotation,
        Transform parent, bool manualStop, CharacterSound[] sounds, bool useNativeParticleStart)
    {
        if (!prefab) return null;
        var effect = Instantiate(prefab, position, rotation, parent ? parent : transform);
        effect.SetActive(true);
        if (useNativeParticleStart) nativeEffects.Add(effect);
        var particles = effect.GetComponentsInChildren<ParticleSystem>(true);
        if (!useNativeParticleStart)
            foreach (var particle in particles)
                if (particle.gameObject.activeInHierarchy) particle.Play(false);
        foreach (var trail in effect.GetComponentsInChildren<TrailRenderer>(true))
        {
            trail.Clear();
            if (!useNativeParticleStart) trail.emitting = true;
        }
        var originalAudio = useNativeParticleStart ? effect.GetComponentsInChildren<AudioSource>(true) : System.Array.Empty<AudioSource>();
        var directors = useNativeParticleStart ? effect.GetComponentsInChildren<PlayableDirector>(true) : System.Array.Empty<PlayableDirector>();
        var voices = new List<AudioSource>();
        float latestAudioStart = Time.time;
        foreach (var sound in sounds ?? System.Array.Empty<CharacterSound>())
        {
            var voice = AudioManager.Inst.PlayAttached(sound, effect.transform);
            if (!voice) continue;
            voices.Add(voice);
            latestAudioStart = Mathf.Max(latestAudioStart, Time.time + sound.delay);
        }
        attachedVoices[effect] = voices.ToArray();
        if (manualStop)
        {
            var animation = effect.GetComponent<Animation>();
            var expiry = animation ? animation.clip : null;
            if (expiry && expiry.name.EndsWith("_Expiry_Expire", System.StringComparison.Ordinal))
                expiryProjectiles.Add(effect);
        }
        if (manualStop || !useNativeParticleStart && particles.Length == 0) held.Add(effect);
        StartCoroutine(RecycleWhenFinished(effect, particles, voices.ToArray(), originalAudio, directors, latestAudioStart));
        return effect;
    }

    public void Stop(GameObject effect, bool clear = false)
    {
        if (!effect || !stopped.Add(effect)) return;
        effect.transform.SetParent(transform, true); // 角色切换后仍让尾迹播完。
        held.Remove(effect);
        bool native = nativeEffects.Contains(effect);
        if (native)
        {
            var expire = effect.GetComponent<Animation>();
            var clip = expire ? (expiryProjectiles.Contains(effect) ? expire.clip : expire.GetClip("Expire")) : null;
            if (clip)
            {
                expire.Play(expiryProjectiles.Contains(effect) ? clip.name : "Expire");
                expireUntil[effect] = Time.time + clip.length;
            }
        }
        if (attachedVoices.TryGetValue(effect, out var voices))
        {
            foreach (var voice in voices) ReleaseVoice(voice);
            attachedVoices.Remove(effect);
        }
        if (native)
        {
            foreach (var voice in effect.GetComponentsInChildren<AudioSource>(true))
                if (voice && voice.isPlaying) ReleaseVoice(voice);
            foreach (var director in effect.GetComponentsInChildren<PlayableDirector>(true))
                if (director) director.Stop();
        }
        foreach (var particle in effect.GetComponentsInChildren<ParticleSystem>(true))
            particle.Stop(false, clear ? ParticleSystemStopBehavior.StopEmittingAndClear : ParticleSystemStopBehavior.StopEmitting);
        trailUntil[effect] = StopTrails(effect);
        // Control 轨道的片段结束会隐藏实例；已释放的音频仍可自然播完。
        if (clear) effect.SetActive(false);
    }

    static void ReleaseVoice(AudioSource voice)
    {
        if (!voice) return;
        if (AudioManager.Existing) AudioManager.Existing.ReleaseAttached(voice);
        else Destroy(voice.gameObject);
    }

    // Expire hides only authored projectile cores. Their invisible control
    // particles must not keep an otherwise finished projectile alive for 5s.
    // Visible particle tails and systems with particle trails/sub-emitters drain.
    bool ParticleAlive(GameObject effect, ParticleSystem particle)
    {
        if (!particle) return false;
        if (expiryProjectiles.Contains(effect) && stopped.Contains(effect))
        {
            var renderer = particle.GetComponent<ParticleSystemRenderer>();
            bool hidden = !particle.gameObject.activeInHierarchy || !renderer ||
                !renderer.enabled || renderer.renderMode == ParticleSystemRenderMode.None;
            if (hidden && !particle.subEmitters.enabled && !particle.trails.enabled && !particle.lights.enabled)
            {
                particle.Clear(false);
                return false;
            }
        }
        return particle.IsAlive(false);
    }

    static float StopTrails(GameObject effect)
    {
        float tail = 0f;
        foreach (var trail in effect.GetComponentsInChildren<TrailRenderer>(true))
        {
            trail.emitting = false;
            if (trail.enabled && trail.gameObject.activeInHierarchy && trail.positionCount > 0)
                tail = Mathf.Max(tail, trail.time);
        }
        return Time.time + tail;
    }

    private IEnumerator RecycleWhenFinished(GameObject effect, ParticleSystem[] particles,
        AudioSource[] voices, AudioSource[] originalAudio, PlayableDirector[] directors, float latestAudioStart)
    {
        yield return null;
        while (effect && (held.Contains(effect) ||
            expireUntil.TryGetValue(effect, out var expireTime) && Time.time < expireTime ||
            System.Array.Exists(particles, p => ParticleAlive(effect, p)) ||
            !stopped.Contains(effect) && Time.time < latestAudioStart ||
            System.Array.Exists(voices, a => VoiceAttached(effect, a)) ||
            System.Array.Exists(originalAudio, a => VoiceAttached(effect, a)) ||
            System.Array.Exists(directors, d => d && d.state == PlayState.Playing)))
            yield return null;
        if (effect)
        {
            // Explicit Stop already began draining trails. Do not add their
            // full lifetime again after particles and audio have finished.
            if (!trailUntil.TryGetValue(effect, out var deadline)) deadline = StopTrails(effect);
            while (effect && Time.time < deadline) yield return null;
        }
        held.Remove(effect);
        attachedVoices.Remove(effect);
        nativeEffects.Remove(effect);
        expireUntil.Remove(effect);
        stopped.Remove(effect);
        expiryProjectiles.Remove(effect);
        trailUntil.Remove(effect);
        if (!effect) yield break;
        Destroy(effect);
    }

    static bool VoiceAttached(GameObject effect, AudioSource voice) =>
        voice && voice.isPlaying && voice.transform.IsChildOf(effect.transform);
}
