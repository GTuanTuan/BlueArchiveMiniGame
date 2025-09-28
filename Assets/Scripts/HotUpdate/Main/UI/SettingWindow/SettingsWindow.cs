using UnityEngine;
using UnityEngine.UI;

public class SettingsWindow : UIBaseWindow
{
    [Header("Panels")]
    public GeneralPanel generalPanel;
    public AudioPanel audioPanel;
    public GraphicsPanel graphicsPanel;
    public DisplayPanel displayPanel;

    [Header("Tab Buttons")]
    public Button generalTab;
    public Button audioTab;
    public Button graphicsTab;
    public Button displayTab;

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
            displayTab.onClick.AddListener(() => SwitchPanel(displayPanel));

            applyButton.onClick.AddListener(ApplyAllSettings);
            cancelButton.onClick.AddListener(() => { UIManager.Inst.HideWindow(gameObject.name); });
            defaultsButton.onClick.AddListener(ResetToDefaults);
            quitButton.onClick.AddListener(() => { Application.Quit(); });
        }
        SwitchPanel(generalPanel);
        base.OnShow();
    }

    private void SwitchPanel(UIBasePanel newPanel)
    {
        if (currentPanel != null)
            currentPanel.gameObject.SetActive(false);

        newPanel.gameObject.SetActive(true);
        currentPanel = newPanel;
        UpdateTabButtons();
    }

    private void UpdateTabButtons()
    {
        generalTab.interactable = currentPanel != generalPanel;
        audioTab.interactable = currentPanel != audioPanel;
        graphicsTab.interactable = currentPanel != graphicsPanel;
        displayTab.interactable = currentPanel != displayPanel;
    }

    public void ApplyAllSettings()
    {
        generalPanel.ApplySettings();

        displayPanel.ApplySettings();

        graphicsPanel.ApplySettings();

        audioPanel.ApplySettings();

        SettingsManager.Inst.SaveSettings();

        UIManager.Inst.HideWindow(gameObject.name);
    }

    public void ResetToDefaults()
    {
        SettingsManager.Inst.ResetToDefaultSettings();
        SwitchPanel(currentPanel); 
    }
}