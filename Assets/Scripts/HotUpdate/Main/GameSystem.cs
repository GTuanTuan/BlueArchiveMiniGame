using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSystem : Singleton<GameSystem>
{
    public void Init()
    {
        UIManager.Inst.Init();
        SettingsManager.Inst.Init();
        GraphicsManager.Inst.Init();
        AudioManager.Inst.Init();
    }
}
