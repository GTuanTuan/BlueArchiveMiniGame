using Cinemachine;
using UnityEngine;
using UnityEngine.InputSystem;
using NativePresentation = Game.Characters.BACharacterPresentation;

public enum BACharacterState { Idle, Move, Shoot, Reload, Ex }

// Input and movement host. Scene references are assigned once in the Inspector.
[DefaultExecutionOrder(-100)]
public sealed class BACharacterController : MonoBehaviour
{
    [SerializeField] InputActionAsset inputAction;
    [SerializeField] CharacterController characterController;
    [SerializeField] Transform movementForward;
    [SerializeField] Transform modelRoot;
    [SerializeField] CinemachineVirtualCamera virtualCamera;
    [SerializeField] CinemachineFramingTransposer framingTransposer;
    [SerializeField] CinemachinePOV pov;
    [SerializeField] CinemachineInputProvider cameraInput;
    [SerializeField] Camera mainCamera;
    [SerializeField] Light variantLight;
    [SerializeField] NativePresentation character;
    [SerializeField] float moveSpeed = 5f, turnSpeed = 10f;
    [SerializeField] float minCameraDistance = 2f, maxCameraDistance = 10f, cameraZoomSpeed = .1f;
    [SerializeField] CursorLockMode cursorLock = CursorLockMode.Locked;
    [SerializeField] bool holdRightMouseToLook;

    GameSystem gameSystem;
    Vector2 moveInput;
    Vector3 moveDirection;
    public BACharacterState currentState;
    public event System.Action ExRequested;
    public global::CharacterCombat Combat => character ? character.combat : null;
    public Transform ModelRoot => modelRoot;

    public void BindCharacter(NativePresentation value)
    {
        character = value;
        currentState = BACharacterState.Idle;
        if (character) character.BindPlayer(this, mainCamera, variantLight);
    }

    public void OnMove(InputAction.CallbackContext context) => moveInput = context.ReadValue<Vector2>();

    public void OnZoom(InputAction.CallbackContext context)
    {
        if (!framingTransposer) return;
        float distance = framingTransposer.m_CameraDistance + context.ReadValue<float>() * cameraZoomSpeed * .01f;
        framingTransposer.m_CameraDistance = Mathf.Clamp(distance, minCameraDistance, maxCameraDistance);
    }

    public void OnShoot(InputAction.CallbackContext context)
    {
        if (context.performed && character && !character.IsBusy) currentState = BACharacterState.Shoot;
    }

    public void OnReload(InputAction.CallbackContext context)
    {
        if (context.performed && character && !character.IsBusy) currentState = BACharacterState.Reload;
    }

    public void OnEx(InputAction.CallbackContext context)
    {
        if (!context.performed) return;
        if (ExRequested != null) ExRequested();
        else if (character) character.PlayEx();
    }

    public void RequestEx() => ExRequested?.Invoke();
    public void PlayBoundEx() { if (character) character.PlayEx(); }

    void Awake()
    {
        Cursor.lockState = cursorLock;
        if (character) character.BindPlayer(this, mainCamera, variantLight);
        if (inputAction)
        {
            inputAction.FindAction("Move").started += OnMove;
            inputAction.FindAction("Move").performed += OnMove;
            inputAction.FindAction("Move").canceled += OnMove;
            inputAction.FindAction("Zoom").started += OnZoom;
            inputAction.FindAction("Zoom").performed += OnZoom;
            inputAction.FindAction("Zoom").canceled += OnZoom;
            inputAction.FindAction("Shoot").performed += OnShoot;
            inputAction.FindAction("Reload").performed += OnReload;
            inputAction.FindAction("Ex").performed += OnEx;
            inputAction.Enable();
        }
        gameSystem = GameSystem.Inst;
        if (gameSystem != null) gameSystem.CursorStateChanged += OnCursorStateChanged;
        currentState = BACharacterState.Idle;
    }

    void OnCursorStateChanged(bool locked)
    {
        if (cameraInput) cameraInput.enabled = locked;
        if (!inputAction) return;
        if (locked) inputAction.Enable();
        else { inputAction.Disable(); moveInput = Vector2.zero; }
    }

    void Move()
    {
        if (!character || character.IsBusy) return;
        movementForward.eulerAngles = new Vector3(0, virtualCamera.State.FinalOrientation.eulerAngles.y, 0);
        moveDirection = movementForward.TransformDirection(new Vector3(moveInput.x, 0, moveInput.y));
        if (moveInput != Vector2.zero)
        {
            var target = Quaternion.LookRotation(new Vector3(moveDirection.x, 0, moveDirection.z));
            modelRoot.rotation = Quaternion.Slerp(modelRoot.rotation, target, turnSpeed * Time.deltaTime);
            currentState = BACharacterState.Move;
            characterController.Move(moveDirection * moveSpeed * Time.deltaTime);
        }
        else currentState = BACharacterState.Idle;
    }

    void Update()
    {
        if (holdRightMouseToLook && Mouse.current != null && Mouse.current.rightButton.isPressed && pov)
        {
            Vector2 look = Mouse.current.delta.ReadValue() * .15f;
            pov.m_HorizontalAxis.Value += look.x;
            pov.m_VerticalAxis.Value -= look.y;
        }
        if (!character) return;
        character.PlayAnimation();
        Move();
    }

    void OnDestroy()
    {
        if (gameSystem != null) gameSystem.CursorStateChanged -= OnCursorStateChanged;
        if (!inputAction) return;
        inputAction.FindAction("Move").started -= OnMove;
        inputAction.FindAction("Move").performed -= OnMove;
        inputAction.FindAction("Move").canceled -= OnMove;
        inputAction.FindAction("Zoom").started -= OnZoom;
        inputAction.FindAction("Zoom").performed -= OnZoom;
        inputAction.FindAction("Zoom").canceled -= OnZoom;
        inputAction.FindAction("Shoot").performed -= OnShoot;
        inputAction.FindAction("Reload").performed -= OnReload;
        inputAction.FindAction("Ex").performed -= OnEx;
    }
}
