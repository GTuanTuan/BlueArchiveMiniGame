using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SettingsWindow : UIBaseWindow
{
    [Serializable]
    public struct AtlasImage
    {
        public Image image;
        public string spriteName;
    }

    [Header("Original atlas images")]
    public AtlasImage[] atlasImages;
    [Header("Panels")]
    public GeneralPanel generalPanel;
    public AudioPanel audioPanel;
    public GraphicsPanel graphicsPanel;
    [Header("Tab Buttons")]
    public Button generalTab;
    public Button audioTab;
    public Button graphicsTab;
    [Header("Action Buttons")]
    public Button applyButton;
    public Button cancelButton;
    public Button defaultsButton;
    public Button quitButton;

    private UIBasePanel _currentPanel;
    private CursorLockMode _previousCursorLock;
    private bool _previousCursorVisible;
    private readonly List<IDisposable> _atlasBindings = new List<IDisposable>();

    protected override void OnInitialize()
    {
        if (generalTab != null) generalTab.onClick.AddListener(ShowGeneral);
        if (audioTab != null) audioTab.onClick.AddListener(ShowAudio);
        if (graphicsTab != null) graphicsTab.onClick.AddListener(ShowGraphics);
        if (applyButton != null) applyButton.onClick.AddListener(ApplyAllSettings);
        if (cancelButton != null) cancelButton.onClick.AddListener(Cancel);
        if (defaultsButton != null) defaultsButton.onClick.AddListener(ResetToDefaults);
        if (quitButton != null) quitButton.onClick.AddListener(Quit);

        if (atlasImages != null && atlasImages.Length > 0)
        {
            foreach (var binding in atlasImages) BindOriginal(binding.image, binding.spriteName);
            return;
        }
        // Compatibility for an older prefab that has not been rebuilt yet.
        BindOriginal(GetComponent<Image>(), "Common_Bg_Raius10px");
        BindOriginal(applyButton != null ? applyButton.targetGraphic as Image : null, "Common_Btn_BG");
        BindOriginal(cancelButton != null ? cancelButton.targetGraphic as Image : null, "Common_Btn_BG");
        BindOriginal(defaultsButton != null ? defaultsButton.targetGraphic as Image : null, "Common_Btn_BG");
        BindOriginal(quitButton != null ? quitButton.targetGraphic as Image : null, "Common_Btn_BG");
        BindOriginal(generalTab != null ? generalTab.targetGraphic as Image : null, "Common_Sub_Btn");
        BindOriginal(audioTab != null ? audioTab.targetGraphic as Image : null, "Common_Sub_Btn");
        BindOriginal(graphicsTab != null ? graphicsTab.targetGraphic as Image : null, "Common_Sub_Btn");
    }

    private void BindOriginal(Image target, string spriteName)
    {
        if (target == null || UIManager.Inst.Atlases == null) return;
        _atlasBindings.Add(UIManager.Inst.Atlases.Bind("MainOriginalAtlas", spriteName, target));
    }

    protected override void OnShow()
    {
        _previousCursorLock = Cursor.lockState;
        _previousCursorVisible = Cursor.visible;
        SettingsManager.Inst.BeginEdit();
        if (generalPanel != null) generalPanel.Hide();
        if (audioPanel != null) audioPanel.Hide();
        if (graphicsPanel != null) graphicsPanel.Hide();
        _currentPanel = null;
        SwitchPanel(graphicsPanel != null ? (UIBasePanel)graphicsPanel : audioPanel != null ? audioPanel : (UIBasePanel)generalPanel);
        GameSystem.Inst.UpdateCursorState(false);
    }

    protected override void OnHide()
    {
        // Apply clears the edit transaction; all other close paths cancel it.
        SettingsManager.Inst.CancelEdit();
        if (_currentPanel != null) _currentPanel.Hide();
        _currentPanel = null;
        GameSystem.Inst.UpdateCursorState(_previousCursorLock == CursorLockMode.Locked);
        Cursor.lockState = _previousCursorLock;
        Cursor.visible = _previousCursorVisible;
    }

    private void ShowGeneral() => SwitchPanel(generalPanel);
    private void ShowAudio() => SwitchPanel(audioPanel);
    private void ShowGraphics() => SwitchPanel(graphicsPanel);
    private void Quit() => Application.Quit();
    private void Cancel() => UIManager.Inst.HideWindow(string.IsNullOrEmpty(Address) ? nameof(SettingsWindow) : Address);

    private void SwitchPanel(UIBasePanel panel)
    {
        if (panel == null) return;
        if (_currentPanel != panel && _currentPanel != null) _currentPanel.Hide();
        _currentPanel = panel;
        panel.Show();
        if (generalTab != null) generalTab.interactable = panel != generalPanel;
        if (audioTab != null) audioTab.interactable = panel != audioPanel;
        if (graphicsTab != null) graphicsTab.interactable = panel != graphicsPanel;
    }

    public void ApplyAllSettings()
    {
        try { SettingsManager.Inst.ApplyAllSettings(); }
        catch (Exception exception)
        {
            Debug.LogError("保存设置失败：" + exception.Message);
            var box = MessageBox.Show();
            if (box != null) box.SetTitle("保存设置失败").SetContent(exception.Message).AddButton("知道了");
            return;
        }
        Cancel();
    }

    public void ResetToDefaults()
    {
        SettingsManager.Inst.ResetDraftToDefaults();
        if (_currentPanel != null) _currentPanel.Refresh();
    }

    private void OnDestroy()
    {
        if (generalTab != null) generalTab.onClick.RemoveListener(ShowGeneral);
        if (audioTab != null) audioTab.onClick.RemoveListener(ShowAudio);
        if (graphicsTab != null) graphicsTab.onClick.RemoveListener(ShowGraphics);
        if (applyButton != null) applyButton.onClick.RemoveListener(ApplyAllSettings);
        if (cancelButton != null) cancelButton.onClick.RemoveListener(Cancel);
        if (defaultsButton != null) defaultsButton.onClick.RemoveListener(ResetToDefaults);
        if (quitButton != null) quitButton.onClick.RemoveListener(Quit);
        foreach (var binding in _atlasBindings) binding.Dispose();
        _atlasBindings.Clear();
    }
}
