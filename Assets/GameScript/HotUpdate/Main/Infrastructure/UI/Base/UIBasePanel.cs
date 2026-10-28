using UnityEngine;

public abstract class UIBasePanel : MonoBehaviour
{
    private bool _visible;
    public bool IsVisible => _visible && gameObject.activeInHierarchy;
    public virtual void OnShow() { }
    public virtual void OnHide() { }
    public virtual void Refresh() { }

    public virtual void Show()
    {
        if (_visible && gameObject.activeSelf) { Refresh(); return; }
        _visible = true;
        gameObject.SetActive(true);
        if (_visible && gameObject.activeInHierarchy) OnShow();
    }

    public virtual void Hide()
    {
        bool notify = _visible;
        _visible = false;
        gameObject.SetActive(false);
        if (notify) OnHide();
    }

    protected virtual void OnDisable()
    {
        if (!_visible) return;
        _visible = false;
        OnHide();
    }
}
