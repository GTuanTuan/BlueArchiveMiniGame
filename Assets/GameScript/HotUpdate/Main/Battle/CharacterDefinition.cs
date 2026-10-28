using UnityEngine;

namespace Game.Battle
{
    [CreateAssetMenu(menuName = "Blue Archive/Battle/Character")]
    public sealed class CharacterDefinition : ScriptableObject
    {
        public string displayName;
        public Texture2D portrait;
        public AnimationClip entranceClip, idleClip, victoryStart, victoryEnd, defeatClip;
        public AudioClip[] entranceVoices = System.Array.Empty<AudioClip>();
        public AudioClip victoryVoice;
        public AudioClip[] pickupVoices = System.Array.Empty<AudioClip>();
        public AudioClip[] moveVoices = System.Array.Empty<AudioClip>();
        public float exPiercingWidth;
        public float exPiercingHeight;
        [Header("Demo 属性，可独立调整；不是原游戏数值")]
        public float hitPoints = 300;
        public float moveSpeed = 3;
        public float turnSpeed = 720;
        public float attackRange = 5;
        public float detectionRange = 16;
        public float maxChaseDistance = 20;
        public float damage = 12;
        public int magazineSize = 5;
        public float exDamage = 65;
        public float exRadius = 2;
        public float exCooldown = 12;
        public bool exArea;

        [Header("由原版动作和技能数据提取的秒数")]
        public float attackSeconds;
        public float reloadSeconds;
        public float[] normalShotTimes;
        public float[] exShotTimes;
        public int[] exShotIndices;
        public float exDuration;
        [Header("移动刹车状态，由演示专用 Controller 播放")]
        public string stopState = "Base Layer.MoveStop";
    }
}
