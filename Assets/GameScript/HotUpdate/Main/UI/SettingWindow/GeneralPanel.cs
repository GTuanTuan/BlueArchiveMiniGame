using TMPro;
using UnityEngine;

public class GeneralPanel : UIBasePanel, ISettingsPanel
{
    [SerializeField] private TMP_InputField serverAddressInput;

    public override void OnShow() => Refresh();

    public override void Refresh()
    {
        if (serverAddressInput != null)
            serverAddressInput.SetTextWithoutNotify(SettingsManager.Inst.CurrentSettings.serverAddress ?? string.Empty);
    }

    public void OnServerAddressChanged(string value)
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = (value ?? string.Empty).Trim();
    }

    public void ApplySettings() { }

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = SettingsManager.Inst.DefSetting.serverAddress;
        Refresh();
    }
}