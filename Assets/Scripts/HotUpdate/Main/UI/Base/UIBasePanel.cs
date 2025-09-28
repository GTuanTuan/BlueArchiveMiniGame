using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class UIBasePanel : MonoBehaviour
{
    public virtual void OnShow() { }
    public virtual void OnHide() { }

    public virtual void Refresh() { }
}
