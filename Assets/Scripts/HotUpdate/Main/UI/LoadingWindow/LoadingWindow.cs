using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using YooAsset;

public class LoadingWindow : UIBaseWindow
{
    public Slider slider;
    public Text progressText;
    private HandleBase _currentOperation;

    void Update()
    {
        if (_currentOperation == null) return;

        slider.value = _currentOperation.Progress;
        Debug.Log(slider.value);
        if (progressText != null)
            progressText.text = $"{_currentOperation.Progress * 100:F0}%";

        if (_currentOperation.IsDone)
            StopTracking();
    }

    public void TrackOperation(HandleBase operation)
    {
        _currentOperation = operation;
        gameObject.SetActive(true);
    }

    public void StopTracking()
    {
        _currentOperation = null;
        gameObject.SetActive(false);
    }
}
