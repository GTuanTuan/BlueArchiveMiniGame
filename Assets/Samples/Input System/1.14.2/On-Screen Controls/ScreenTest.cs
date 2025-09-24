using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
public class ScreenTest : MonoBehaviour
{
    public InputActionReference inputAction;
    // Start is called before the first frame update
    void Start()
    {
        inputAction.action.Enable();
        inputAction.action.performed += ScreenTouchTest;
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
