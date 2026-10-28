using UnityEngine;

public abstract class UIBaseWindow : MonoBehaviour
{
    private bool _initialized;
    private bool _visible;
    public string Address { get; private set; }
    public bool IsVisible => _visible && gameObject.activeInHierarchy;
    internal void SetAddress(string address) => Address = address;

    public virtual void Show()
    {
        if (_visible && gameObject.activeSelf) return;
        if (!_initialized) { OnInitialize(); _initialized = true; }
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

    protected virtual void OnInitialize() { }
    protected virtual void OnShow() { }
    protected virtual void OnHide() { }
}
