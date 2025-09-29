using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSystem : Singleton<GameSystem>
{
    public UIManager UI { get; private set; }
    public SettingsManager Settings { get; private set; }

    public GraphicsManager Graphics { get; private set; }
    public void Init()
    {
        UI = UIManager.Inst;
        Settings = SettingsManager.Inst;
        Graphics = GraphicsManager.Inst;
    }

}
