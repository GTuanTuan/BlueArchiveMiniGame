using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class UIBaseWindow : MonoBehaviour
{
    public virtual void Show()
    {
        gameObject.SetActive(true);
        OnShow();
    }
    public virtual void Hide()
    {
        gameObject.SetActive(false);
        OnHide();
    }
    protected virtual void OnShow() { }
    protected virtual void OnHide() { }
}
