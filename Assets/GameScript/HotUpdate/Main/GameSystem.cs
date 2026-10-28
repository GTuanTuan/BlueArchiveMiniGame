using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public class GameSystem : Singleton<GameSystem>
{
    public event System.Action<bool> CursorStateChanged;
    public void Init()
    {
        if (GameManager.Inst.MainUICanvas == null)
            throw new System.InvalidOperationException("Game UI canvas is not configured.");
        UIManager.Inst.Init(GameManager.Inst.MainUICanvas.transform, YooAssets.GetPackage("Main"));
        SettingsManager.Inst.Init();
        GraphicsManager.Inst.Init();
        AudioManager.Inst.Init();
    }
    public void UpdateCursorState(bool value)
    {
        Cursor.lockState = value ? CursorLockMode.Locked : CursorLockMode.None;
        Cursor.visible = !value;
        CursorStateChanged?.Invoke(value);
    }
}
