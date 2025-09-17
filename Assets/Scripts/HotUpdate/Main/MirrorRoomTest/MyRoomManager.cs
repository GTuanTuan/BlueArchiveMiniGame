using Mirror;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class MyRoomManager : NetworkRoomManager
{

    public static new MyRoomManager singleton => NetworkManager.singleton as MyRoomManager;
    public override void OnRoomClientSceneChanged()
    {
        base.OnRoomClientSceneChanged();
        if (networkSceneName == GameplayScene)
        {
            foreach (MyRoomPlayer player in roomSlots.ToList())
            {
                player.model.SetActive(false);
            }
        }
        else if (networkSceneName == RoomScene)
        {
                foreach (MyRoomPlayer player in roomSlots.ToList())
                {
                    player.model.SetActive(true);
                }
            }
    }
    public override void OnRoomStopClient()
    {
        base.OnRoomStopClient();
    }

    public override void OnRoomStopServer()
    {
        base.OnRoomStopServer();
    }

    /*
        This code below is to demonstrate how to do a Start button that only appears for the Host player
        showStartButton is a local bool that's needed because OnRoomServerPlayersReady is only fired when
        all players are ready, but if a player cancels their ready state there's no callback to set it back to false
        Therefore, allPlayersReady is used in combination with showStartButton to show/hide the Start button correctly.
        Setting showStartButton false when the button is pressed hides it in the game scene since NetworkRoomManager
        is set as DontDestroyOnLoad = true.
    */

#if !UNITY_SERVER
    bool showStartButton;
#endif

    public override void OnRoomServerPlayersReady()
    {
        // calling the base method calls ServerChangeScene as soon as all players are in Ready state.
        if (Utils.IsHeadless())
            base.OnRoomServerPlayersReady();
#if !UNITY_SERVER
        else
            showStartButton = true;
#endif
    }

#if !UNITY_SERVER
    public override void OnGUI()
    {
        base.OnGUI();

        if (allPlayersReady && showStartButton && GUI.Button(new Rect(150, 300, 120, 20), "START GAME"))
        {
            // set to false to hide it in the game scene
            showStartButton = false;

            ServerChangeScene(GameplayScene);
        }
    }
#endif
}
