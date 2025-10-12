using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSystem : Singleton<GameSystem>
{
    public NetWorkThirdCharacterController localPlayer;
    public void Init()
    {
        UIManager.Inst.Init();
        SettingsManager.Inst.Init();
        GraphicsManager.Inst.Init();
        AudioManager.Inst.Init();
    }
    public void UpdateCursorState(bool value)
    {
        if (localPlayer != null) 
        {
            localPlayer.UpdateCursorState(value);
        }
    }
}
