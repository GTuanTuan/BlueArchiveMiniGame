using Cinemachine;
using Mirror;
using UnityEngine;

public class MyRoomPlayer : NetworkRoomPlayer
{
    public CinemachineVirtualCamera vCam;
    public GameObject model;
    public override void OnStartClient()
    {
        //Debug.Log($"OnStartClient {gameObject}");
    }

    public override void OnClientEnterRoom()
    {
        //Debug.Log($"OnClientEnterRoom {SceneManager.GetActiveScene().path}");
    }
    [Command]
    public override void CmdChangeReadyState(bool readyState)
    {
        Debug.Log($"CmdChangeReadyState called (Host={isServer}, Local={isLocalPlayer})");
        SetReadyToBegin(readyState);
        MyRoomManager room = MyRoomManager.singleton as MyRoomManager;
        if (room != null)
        {
            room.ReadyStatusChanged();
        }
        //base.CmdChangeReadyState(readyState);
    }
    public override void OnClientExitRoom()
    {
        //Debug.Log($"OnClientExitRoom {SceneManager.GetActiveScene().path}");
    }

    public override void IndexChanged(int oldIndex, int newIndex)
    {
        //Debug.Log($"IndexChanged {newIndex}");
        transform.position += new Vector3(2 * newIndex, 0, 0);
    }

    public override void ReadyStateChanged(bool oldReadyState, bool newReadyState)
    {
        //Debug.Log($"ReadyStateChanged {newReadyState}");
    }
    public override void OnStartLocalPlayer()
    {
        base.OnStartLocalPlayer();
        vCam.Priority = 12;
    }

#if !UNITY_SERVER
    public override void OnGUI()
    {
        base.OnGUI();
    }
#endif
}
