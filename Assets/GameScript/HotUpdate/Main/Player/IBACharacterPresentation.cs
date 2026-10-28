using UnityEngine;

// 玩家只关心这些入口，不需要知道角色使用哪一种表现实现。
public interface IBACharacterPresentation
{
    bool IsBusy { get; }
    void BindPlayer(BACharacterController player, Camera camera, Light variantLight);
    void PlayAnimation();
    void PlayEx();
}
