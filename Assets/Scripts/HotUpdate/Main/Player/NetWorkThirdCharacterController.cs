using Cinemachine;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using YooAsset;
using Mirror;

public class NetWorkThirdCharacterController : NetworkBehaviour
{
    #region ThirdCharacterController
    public float moveSpeed = 5f;
    public float turnSpeed = 10f;
    public float jumpSpeed = 8f;
    public float gravity = 20f;
    public float minCameraDistance = 2f;
    public float maxCameraDistance = 10f;
    public float cameraZoomSpeed = 0.1f;

    public CharacterController controller;
    public Animator animator;
    public CinemachineVirtualCamera vCam;
    public Transform forwardReference;
    public Transform model;

    private CinemachineFramingTransposer framingTransposer;
    private CinemachinePOV pov;
    private Vector3 moveDirection;
    private Vector3 verticalVelocity;
    private Vector2 moveInput;
    private bool isGrounded;
    private bool isCursorLocked = true;

    void Awake()
    {
        //if (!isLocalPlayer) return;
        framingTransposer = vCam.GetCinemachineComponent<CinemachineFramingTransposer>();
        pov = vCam.GetCinemachineComponent<CinemachinePOV>();
        UpdateCursorState();
    }
    void Update()
    {
        if (!isLocalPlayer) return;
        ApplyGravity();
        Move();
        RotateModel();
        UpdateAnimator();
    }
    private void UpdateCursorState()
    {
        if (!isLocalPlayer) return;
        Cursor.lockState = isCursorLocked ? CursorLockMode.Locked : CursorLockMode.None;
        Cursor.visible = !isCursorLocked;
        if (pov == null) return;
        pov.m_HorizontalAxis.m_InputAxisName = isCursorLocked ? "Mouse X" : "";
        pov.m_VerticalAxis.m_InputAxisName = isCursorLocked ? "Mouse Y" : "";
        pov.m_HorizontalAxis.m_MaxSpeed = isCursorLocked ? 300 : 0;
        pov.m_VerticalAxis.m_MaxSpeed = isCursorLocked ? 300 : 0;
    }
    private void ApplyGravity()
    {
        if (!isLocalPlayer) return;
        isGrounded = controller.isGrounded;
        if (isGrounded && verticalVelocity.y < 0)
        {
            verticalVelocity.y = -2f;
        }
        else
        {
            verticalVelocity.y -= gravity * Time.deltaTime;
        }
    }
    private void Move()
    {
        if (!isLocalPlayer) return;
        forwardReference.rotation = Quaternion.AngleAxis(pov.m_HorizontalAxis.Value+transform.eulerAngles.y, Vector3.up);
        Vector3 horizontalMovement = forwardReference.TransformDirection(
            new Vector3(moveInput.x, 0, moveInput.y)) * moveSpeed;
        moveDirection = horizontalMovement + verticalVelocity;
        controller.Move(moveDirection * Time.deltaTime);
    }
    private void RotateModel()
    {
        if (!isLocalPlayer) return;
        if (moveInput == Vector2.zero) return;
        float targetAngle = Mathf.Atan2(moveInput.x, moveInput.y) * Mathf.Rad2Deg;
        Quaternion targetRotation = forwardReference.rotation * Quaternion.AngleAxis(targetAngle, Vector3.up);
        model.rotation = Quaternion.Slerp(model.rotation, targetRotation, turnSpeed * Time.deltaTime);
    }
    private void UpdateAnimator()
    {
        if (!isLocalPlayer) return;
        if (animator == null) return;
        animator.SetBool("Move", moveInput != Vector2.zero);
    }
    public void OnMove(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        moveInput = context.ReadValue<Vector2>();
    }
    public void OnJump(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed && isGrounded)
        {
            verticalVelocity.y = jumpSpeed;
        }
    }

    public void OnFire(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed)
        {
            animator.SetTrigger("Attack");
        }
    }
    public void OnEsc(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed)
        {
            isCursorLocked = !isCursorLocked;
            UpdateCursorState();
            if (isCursorLocked)
            {
                SettingsManager.Instance.CloseSettingWindow();
            }
            else
            {
                SettingsManager.Instance.OpenSettingWindow();
            }
        }
    }
    public void OnAlt(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed)
        {
            isCursorLocked = false;
            UpdateCursorState();
        }
        else if (context.canceled)
        {
            isCursorLocked = true;
            UpdateCursorState();
        }
    }
    public void OnZoom(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (framingTransposer == null) return;
        float scrollValue = context.ReadValue<float>();
        float newDistance = framingTransposer.m_CameraDistance + (scrollValue * cameraZoomSpeed * 0.01f);
        framingTransposer.m_CameraDistance = Mathf.Clamp(newDistance, minCameraDistance, maxCameraDistance);
    }
    #endregion

    #region Start & Stop Callbacks

    /// <summary>
    /// This is invoked for NetworkBehaviour objects when they become active on the server.
    /// <para>This could be triggered by NetworkServer.Listen() for objects in the scene, or by NetworkServer.Spawn() for objects that are dynamically created.</para>
    /// <para>This will be called for objects on a "host" as well as for object on a dedicated server.</para>
    /// </summary>
    public override void OnStartServer()
    {
        Debug.Log("OnStartServer");
    }

    /// <summary>
    /// Invoked on the server when the object is unspawned
    /// <para>Useful for saving object data in persistent storage</para>
    /// </summary>
    public override void OnStopServer() { }

    /// <summary>
    /// Called on every NetworkBehaviour when it is activated on a client.
    /// <para>Objects on the host have this function called, as there is a local client on the host. The values of SyncVars on object are guaranteed to be initialized correctly with the latest state from the server when this function is called on the client.</para>
    /// </summary>
    public override void OnStartClient()
    {
        Debug.Log("OnStartClient");
    }

    /// <summary>
    /// This is invoked on clients when the server has caused this object to be destroyed.
    /// <para>This can be used as a hook to invoke effects or do client specific cleanup.</para>
    /// </summary>
    public override void OnStopClient() { }

    /// <summary>
    /// Called when the local player object has been set up.
    /// <para>This happens after OnStartClient(), as it is triggered by an ownership message from the server. This is an appropriate place to activate components or functionality that should only be active for the local player, such as cameras and input.</para>
    /// </summary>
    public override void OnStartLocalPlayer()
    {
        Debug.Log("OnStartLocalPlayer");
        vCam.Priority = 15;
    }

    /// <summary>
    /// Called when the local player object is being stopped.
    /// <para>This happens before OnStopClient(), as it may be triggered by an ownership message from the server, or because the player object is being destroyed. This is an appropriate place to deactivate components or functionality that should only be active for the local player, such as cameras and input.</para>
    /// </summary>
    public override void OnStopLocalPlayer() { }

    /// <summary>
    /// This is invoked on behaviours that have authority, based on context and <see cref="NetworkIdentity.hasAuthority">NetworkIdentity.hasAuthority</see>.
    /// <para>This is called after <see cref="OnStartServer">OnStartServer</see> and before <see cref="OnStartClient">OnStartClient.</see></para>
    /// <para>When <see cref="NetworkIdentity.AssignClientAuthority">AssignClientAuthority</see> is called on the server, this will be called on the client that owns the object. When an object is spawned with <see cref="NetworkServer.Spawn">NetworkServer.Spawn</see> with a NetworkConnectionToClient parameter included, this will be called on the client that owns the object.</para>
    /// </summary>
    public override void OnStartAuthority() { }

    /// <summary>
    /// This is invoked on behaviours when authority is removed.
    /// <para>When NetworkIdentity.RemoveClientAuthority is called on the server, this will be called on the client that owns the object.</para>
    /// </summary>
    public override void OnStopAuthority() { }

    #endregion

    public NetworkAnimator networkAnimator;

    [SyncVar(hook = nameof(OnCurCharacterNameChange))]
    public string curCharacterName;
    public void OnCurCharacterNameChange(string _Old,string _New)
    {
        animator = null;
        model.GetChild(0).gameObject.SetActive(false);
        AssetHandle assetHandle = YooAssets.LoadAssetAsync(_New);
        assetHandle.Completed += (handle) =>
        {
            GameObject character = handle.InstantiateSync(model);
            animator = character.GetComponent<Animator>();
            networkAnimator.animator = animator;
            character.transform.SetAsFirstSibling();
            curCharacterName = _New;
        };
    }
    public void ChangeCharacter(InputAction.CallbackContext context)
    {
        if (context.performed && isLocalPlayer)
        {
            int bindingIndex = context.action.GetBindingIndexForControl(context.control);
            CmdChangeCharacter(test[bindingIndex]);
        }
    }
    [Command]
    public void CmdChangeCharacter(string name)
    {
        curCharacterName = name;
    }
    List<string> test = new List<string>()
        {
            "Aris",
            "Momoi",
            "Midori",
            "Yuzu",
            "CH0200"
        };
}