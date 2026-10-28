using UnityEngine;

// Explicit scene binding. This component never searches for cameras or loads assets.
[ExecuteAlways, DisallowMultipleComponent]
public sealed class BAResourceOriginalPostProcessCamera : MonoBehaviour
{
    public BAOriginalUIBloomFeature feature;
    public Camera targetCamera;
    public GameObject ownerCharacterRoot;
    public bool enableEffect;
    [System.NonSerialized] public bool registered;
    private BAOriginalUIBloomFeature registeredFeature;
    private Camera registeredCamera;

    public bool CanRender(Camera camera)
    {
        return isActiveAndEnabled && enableEffect && ownerCharacterRoot != null &&
            ownerCharacterRoot.activeInHierarchy && targetCamera != null &&
            targetCamera == camera && targetCamera.isActiveAndEnabled;
    }

    private void OnEnable() { RefreshRegistration(); }
    private void OnDisable() { ReleaseRegistration(); }
    private void OnDestroy() { ReleaseRegistration(); }
    private void OnValidate() { if (isActiveAndEnabled) RefreshRegistration(); }

    public void RefreshRegistration()
    {
        // Release the old key even when only targetCamera changes in the inspector.
        ReleaseRegistration();
        registered = feature != null && isActiveAndEnabled &&
            feature.Register(this, targetCamera);
        registeredFeature = registered ? feature : null;
        registeredCamera = registered ? targetCamera : null;
    }

    public void SetEffectEnabled(bool value)
    { enableEffect = value; RefreshRegistration(); }

    public void ReleaseRegistration()
    {
        if (registeredFeature != null) registeredFeature.Unregister(this, registeredCamera);
        registeredFeature = null; registeredCamera = null; registered = false;
    }
}
