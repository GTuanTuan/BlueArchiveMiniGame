using UnityEngine;
using UnityEngine.Audio;

public class AudioManager : SingletonMono<AudioManager>
{
    readonly System.Random characterSoundRandom = new System.Random();
    readonly System.Collections.Generic.List<AudioSource> createdSources = new System.Collections.Generic.List<AudioSource>();
    [SerializeField] AudioSource[] authoredSources = System.Array.Empty<AudioSource>();
    public System.Func<float> CharacterSoundPitch;
    private AudioMixer _mixer;
    private AudioMixerGroup _masterGroup;

    public void Init() => ApplySettings();

    public void RegisterMixer(AudioMixer mixer)
    {
        if (mixer != null) _mixer = mixer;
        _masterGroup = null;
        if (_mixer != null)
            foreach (var group in _mixer.FindMatchingGroups("Master"))
                if (group != null && group.name == "Master") { _masterGroup = group; break; }
        for (int i = createdSources.Count - 1; i >= 0; i--)
        {
            var source = createdSources[i];
            if (!source) createdSources.RemoveAt(i);
            else source.outputAudioMixerGroup = _masterGroup;
        }
        foreach (var source in authoredSources)
            if (source) source.outputAudioMixerGroup = _masterGroup;
        ApplySettings();
    }

    public void ApplySettings() => PreviewVolume(SettingsManager.Inst.CurrentSettings.masterVolume);

    public void PreviewVolume(float volume)
    {
        volume = Mathf.Clamp01(volume);
        float decibels = Mathf.Log10(Mathf.Max(volume, 0.0001f)) * 20f;
        if (_masterGroup != null && _mixer != null &&
            _mixer.SetFloat("MyExposedParam", decibels))
            AudioListener.volume = 1f;
        else
            AudioListener.volume = volume;
    }

    // The sound remains under the persistent manager until its natural end.
    public void Play(AudioClip clip, Vector3 position, float volume = 1f,
        float pitch = 1f, float spatialBlend = 0f)
    {
        if (!clip) return;
        var sound = new GameObject(clip.name);
        sound.transform.SetParent(transform);
        sound.transform.position = position;
        var source = sound.AddComponent<AudioSource>();
        createdSources.Add(source);
        source.playOnAwake = false;
        source.outputAudioMixerGroup = _masterGroup;
        source.clip = clip;
        source.volume = volume;
        source.pitch = pitch;
        source.spatialBlend = spatialBlend;
        source.Play();
        Destroy(sound, clip.length / Mathf.Max(0.01f, Mathf.Abs(pitch)) + 0.1f);
    }

    // Dynamic 3D cue: the editor has already resolved its source path to a
    // local position. Each voice follows the effect root until it is released.
    public AudioSource PlayAttached(CharacterSound cue, Transform effectRoot)
    {
        if (cue == null || !effectRoot || cue.clips == null || cue.clips.Length == 0) return null;
        var clip = cue.clips[characterSoundRandom.Next(cue.clips.Length)];
        if (!clip) return null;
        var sound = new GameObject(clip.name);
        sound.transform.SetParent(effectRoot, false);
        sound.transform.localPosition = cue.localPosition;
        var source = sound.AddComponent<AudioSource>();
        createdSources.Add(source);
        source.playOnAwake = false;
        source.outputAudioMixerGroup = _masterGroup;
        source.clip = clip;
        source.volume = cue.volume;
        source.spatialBlend = cue.spatialBlend;
        if (cue.maxDistance > 0f)
        {
            source.minDistance = cue.minDistance;
            source.maxDistance = cue.maxDistance;
            source.rolloffMode = cue.rolloffMode;
        }
        source.loop = cue.loop;
        int halfStep = Random.Range(cue.randomPitchMin * 2, cue.randomPitchMax * 2 + 1);
        float hostPitch = CharacterSoundPitch != null ? CharacterSoundPitch() : cue.pitch;
        source.pitch = hostPitch * Mathf.Pow(1.0594631433486938f, halfStep * .5f);
        source.PlayDelayed(cue.delay);
        return source;
    }

    // Keep the sound's current world position and natural tail when its visual
    // owner stops. Looping voices are explicitly ended at that point.
    public void ReleaseAttached(AudioSource source)
    {
        if (!source) return;
        source.transform.SetParent(transform, true);
        if (source.loop) source.Stop();
        float remaining = source.clip ? source.clip.length / Mathf.Max(.01f, Mathf.Abs(source.pitch)) : 0f;
        Destroy(source.gameObject, remaining + .1f);
    }
}

