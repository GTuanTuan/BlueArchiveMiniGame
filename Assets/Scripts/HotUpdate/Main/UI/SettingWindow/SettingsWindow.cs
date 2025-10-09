using UnityEngine;
using UnityEngine.UI;

public class SettingsWindow : UIBaseWindow
{
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

    private UIBasePanel currentPanel;
    bool init = false;

    protected override void OnShow()
    {
        if (!init)
        {
            generalTab.onClick.AddListener(() => SwitchPanel(generalPanel));
            audioTab.onClick.AddListener(() => SwitchPanel(audioPanel));
            graphicsTab.onClick.AddListener(() => SwitchPanel(graphicsPanel));

            applyButton.onClick.AddListener(ApplyAllSettings);
            cancelButton.onClick.AddListener(() => { UIManager.Inst.HideWindow(nameof(SettingsWindow)); });
            defaultsButton.onClick.AddListener(ResetToDefaults);
            quitButton.onClick.AddListener(() => { Application.Quit(); });
        }
        SwitchPanel(generalPanel);
        base.OnShow();
        GameSystem.Inst.UpdateCursorState(false);
    }
    protected override void OnHide()
    {
        GameSystem.Inst.UpdateCursorState(true);
    }
    private void SwitchPanel(UIBasePanel newPanel)
    {
        if (currentPanel != null)
        {
            currentPanel.Hide();
        }
        newPanel.Show();
        currentPanel = newPanel;
        UpdateTabButtons();
    }

    private void UpdateTabButtons()
    {
        generalTab.interactable = currentPanel != generalPanel;
        audioTab.interactable = currentPanel != audioPanel;
        graphicsTab.interactable = currentPanel != graphicsPanel;
    }

    public void ApplyAllSettings()
    {
        SettingsManager.Inst.ApplyAllSettings();
        UIManager.Inst.HideWindow(nameof(SettingsWindow));
    }

    public void ResetToDefaults()
    {
        SettingsManager.Inst.ResetToDefaultSettings();
        SwitchPanel(currentPanel); 
    }
}