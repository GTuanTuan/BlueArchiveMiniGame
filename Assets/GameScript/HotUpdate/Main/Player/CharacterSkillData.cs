using System;
using UnityEngine;
using UnityEngine.Timeline;

// Runtime receives compiled media and gameplay-facing commands only.
[CreateAssetMenu(menuName = "Blue Archive/Character Skill Data")]
public sealed class CharacterSkillData : ScriptableObject
{
    public string characterId;
    public string skillId;
    public bool sourceHasNoNormalSkill;
    public TimelineAsset fieldTimeline;
    public CharacterShotData[] shots = Array.Empty<CharacterShotData>();
    public CharacterEffectData[] targetEffects = Array.Empty<CharacterEffectData>();
    public CharacterOutcomeData[] outcomes = Array.Empty<CharacterOutcomeData>();
    public CharacterOwnerExData[] supportedEx = Array.Empty<CharacterOwnerExData>();
    public CharacterFormData[] forms = Array.Empty<CharacterFormData>();
    public CharacterGameplayStageData[] gameplayStages = Array.Empty<CharacterGameplayStageData>();
    public CharacterNormalAttackData baselineNormal;
    public CharacterNormalAttackData enhancedNormal;
    public RuntimeAnimatorController postAttackController;
    public string postAttackRateParameter;
    public CharacterNormalAudioData[] normalAudio = Array.Empty<CharacterNormalAudioData>();
    public CharacterSound[] fieldSounds = Array.Empty<CharacterSound>();
    public CharacterAreaHitData[] areaHits = Array.Empty<CharacterAreaHitData>();
}

public enum CharacterHitMaterial { Any, Wood, Stone, Flesh, Metal }
public enum CharacterEffectAnchor { Caster, Target, EffectAnchor, VisualOrigin, WorldPoint, HitPoint, Projectile }
public enum CharacterEffectRotation { Prefab, Anchor, CasterForward, TargetForward, ToCaster, ToTarget, EntityDirection }

[Serializable]
public sealed class CharacterVariantCatalog
{
    public string defaultSkill;
    public CharacterVariantForm[] forms = Array.Empty<CharacterVariantForm>();
    public CharacterVariantSelector[] selectors = Array.Empty<CharacterVariantSelector>();
}

[Serializable]
public sealed class CharacterVariantForm
{
    public int weaponGrade, gearTier, formIndex;
    public string[] originalExSlots = Array.Empty<string>();
    // Editor resolves the original source-row gate once during migration.
    public string defaultSkill;
}

[Serializable]
public sealed class CharacterVariantSelector
{
    public string selectorSkill, skillKey;
    public int choiceOrder;
}

[Serializable]
public struct CharacterTargetBinding
{
    public Transform target;
    public Transform aimAnchor;
    public Transform bodyAnchor;
    public Transform headAnchor;
    public Transform effectAnchor;
    public int effectBone;
    public Collider[] hitColliders;
    public Transform areaHitAnchor;
    public Transform logicalOrigin;
    public Transform visualOrigin;
    public Vector3 worldPoint;
    public Vector3 entityDirection;
    public bool useWorldPoint;
    public bool hasConditionResult;
    public bool conditionPassed;
    public string conditionKey;
}

[Serializable]
public sealed class CharacterAreaHitData
{
    public GameObject prefab;
    public float range;
    public float coneDegrees;
}

public struct CharacterFlightArrival
{
    public int shotIndex;
    public int sourceNodeIndex;
    public Transform target;
    public Vector3 worldPoint;
    public bool targetAvailable;
}

[Serializable]
public sealed class CharacterShotData
{
    public int sourceNodeIndex;
    public int targetSlot;
    public int targetBone = -1;
    public int muzzleIndex;
    public string requiredConditionKey;
    public GameObject projectile;
    public GameObject arrivalEffect;
    public float speed;
    public bool fixedForward;
    public bool simpleHoming;
    public float range;
    public float destinationVerticalOffset;
    public float fireDelay;
    public bool useWorldPoint;
    public bool lockDestinationAtLaunch;
    public bool durationFromSpeed = true;
    public float duration;
    public int logicFramesPerSecond = 30;
    public AnimationCurve[] forwardCurves = Array.Empty<AnimationCurve>();
    public AnimationCurve[] rightCurves = Array.Empty<AnimationCurve>();
    public AnimationCurve[] upCurves = Array.Empty<AnimationCurve>();
    public CharacterSound[] sounds = Array.Empty<CharacterSound>();
    public CharacterSound[] arrivalSounds = Array.Empty<CharacterSound>();
}

[Serializable]
public sealed class CharacterEffectData
{
    // Media prefab is compiled in Editor; its nested Timeline and particles
    // keep their authored lifecycle. Variable audio and camera shakes are here.
    public GameObject prefab;
    public int targetSlot;
    public string requiredConditionKey;
    public int anchorIndex;
    public CharacterEffectAnchor anchor;
    public CharacterEffectRotation rotationMode;
    public Vector3 offset;
    public Quaternion rotation = Quaternion.identity;
    public bool attach;
    public bool keepWorldRotation;
    public float delay;
    public float duration;
    public CharacterSound[] sounds = Array.Empty<CharacterSound>();
    public CharacterShakeData[] shakes = Array.Empty<CharacterShakeData>();
}

[Serializable]
public sealed class CharacterSound
{
    public float timelineTime;
    public AudioClip[] clips = Array.Empty<AudioClip>();
    public Vector3 localPosition;
    public float delay;
    public float volume = 1f;
    public float pitch = 1f;
    public int randomPitchMin;
    public int randomPitchMax;
    public float spatialBlend;
    public float minDistance;
    public float maxDistance;
    public AudioRolloffMode rolloffMode;
    public bool loop;
}

[Serializable]
public sealed class CharacterShakeData
{
    public float startDelay;
    public float duration;
    public Vector3 intensity;
    public Vector3 yawPitchRoll;
    public AnimationCurve curve;
}

[Serializable]
public sealed class CharacterOutcomeData
{
    public int sourceNodeIndex;
    public int occurrence;
    public bool hit;
    public CharacterHitMaterial material;
    public int[] effectIndices = Array.Empty<int>();
}

[Serializable]
public sealed class CharacterOwnerExData
{
    public int ordinal;
    public int[] effectIndices = Array.Empty<int>();
}

[Serializable]
public sealed class CharacterFormData
{
    public int formIndex;
    public string transitionKind;
    public string[] dispelTemplates = Array.Empty<string>();
}

[Serializable]
public sealed class CharacterGameplayStageData
{
    public string key;
    public string eventKind;
    public float sourceTime;
}

[Serializable]
public sealed class CharacterNormalAttackData
{
    public string normalSkillId;
    public int[] shotFrames = Array.Empty<int>();
    public int logicFramesPerSecond = 30;
    public int muzzleIndex;
    public bool pointTarget;
    public bool sameImpactForHitAndMiss;
    public GameObject muzzleEffect;
    public GameObject projectile;
    public GameObject hitEffect;
    public GameObject missEffect;
    public CharacterNormalOutcomeData[] outcomes = Array.Empty<CharacterNormalOutcomeData>();
    public float speed;
    public Vector3 destinationOffset;
    public Vector3 destinationRandomMin;
    public Vector3 destinationRandomMax;
    public AnimationCurve forwardCurve;
    public AnimationCurve rightCurve;
    public AnimationCurve upCurve;
}

[Serializable]
public sealed class CharacterNormalOutcomeData
{
    public bool hit;
    public CharacterHitMaterial material;
    public GameObject prefab;
    public Vector3 offset;
    public bool useContactPoint = true;
    public int requiredBone;
    public CharacterEffectRotation rotationMode;
    public Quaternion rotationOffset = Quaternion.identity;
    public CharacterSound[] sounds = Array.Empty<CharacterSound>();
}

[Serializable]
public sealed class CharacterNormalAudioData
{
    public string phase;
    public float sourceStartSeconds;
    public float volume = 1f;
    public AudioClip[] clips = Array.Empty<AudioClip>();
}
