using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class UIBasePanel : MonoBehaviour
{
    public virtual void OnShow() { }
    public virtual void OnHide() { }

    public virtual void Refresh() { }
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
}
