using Cinemachine;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using YooAsset;

public class ThirdCharacterController : MonoBehaviour
{
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
    public bool isLocalPlayer;
    string curCharacterName;

    public Action<GameObject> changeCharacterComplete;
    void Awake()
    {
        //if (!isLocalPlayer) return;
        framingTransposer = vCam.GetCinemachineComponent<CinemachineFramingTransposer>();
        pov = vCam.GetCinemachineComponent<CinemachinePOV>();
        UpdateCursorState();
        ChangeCharacter("Aris");
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
    public void OnFire(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed)
        {
            animator.SetTrigger("Attack");
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
    public void OnChangeCharacter(InputAction.CallbackContext context)
    {
        if (!isLocalPlayer) return;
        if (context.performed)
        {
            int bindingIndex = context.action.GetBindingIndexForControl(context.control);
            ChangeCharacter(test[bindingIndex]);
        }
    }
    public void ChangeCharacter(string name)
    {
        if (!isLocalPlayer) return;
        if (curCharacterName == name) return;
        animator = null;
        model.GetChild(0).gameObject.SetActive(false);
        AssetHandle assetHandle = YooAssets.LoadAssetAsync(name);
        assetHandle.Completed += (handle) =>
        {
            GameObject character = handle.InstantiateSync(model);
            animator = character.GetComponent<Animator>();
            character.transform.SetAsFirstSibling();
            curCharacterName = name;
            changeCharacterComplete?.Invoke(character);
        };
    }
    List<string> test = new List<string>()
        {
            "Aris",
            "Momoi",
            "Midori",
            "Yuzu"
        };
}