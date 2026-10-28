using UnityEngine;
using UnityEngine.UI;
using YooAsset;

public class LoadingWindow : UIBaseWindow
{
    public Slider slider;
    public Text progressText;
    private HandleBase _operation;

    private void Update()
    {
        if (_operation == null) return;
        if (!_operation.IsValid) { StopTracking(); return; }
        Render(_operation.Progress);
        if (_operation.IsDone) StopTracking();
    }

    // The caller owns the operation and window visibility. This view never releases it.
    public void TrackOperation(HandleBase operation)
    {
        if (operation == null || !operation.IsValid) { StopTracking(); return; }
        _operation = operation;
        Render(operation.Progress);
    }

    public void StopTracking() => _operation = null;
    protected override void OnHide() => StopTracking();

    private void Render(float progress)
    {
        progress = Mathf.Clamp01(progress);
        if (slider != null) slider.SetValueWithoutNotify(progress);
        if (progressText != null) progressText.text = $"{progress * 100:F0}%";
    }
}
