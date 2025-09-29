using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.OnScreen;
public class ScreenTest : MonoBehaviour
{
    public InputActionReference inputAction;
    public RectTransform ParentObj;
    public OnScreenStick onScreenStick;
    Vector2 startPos;
    // Start is called before the first frame update
    void Start()
    {
        startPos = ParentObj.anchoredPosition;
        inputAction.action.Enable();
        inputAction.action.performed += ScreenTouchTest;
        //onScreenStick.onPointerDown += () =>
        //{
        //    ParentObj.anchoredPosition = onScreenStick.PointerDownPos;
        //};
        //onScreenStick.onPointerUp += () =>
        //{
        //    ParentObj.anchoredPosition = startPos;
        //};
    }

    private void ScreenTouchTest(InputAction.CallbackContext obj)
    {
        Debug.Log(obj);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
