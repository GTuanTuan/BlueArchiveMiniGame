using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GeneralPanel : UIBasePanel,ISettingsPanel
{
    [SerializeField] private TMP_InputField serverAddressInput;
    string serverAddress;
    public override void OnShow()
    {
        serverAddressInput.text = SettingsManager.Inst.CurrentSettings.serverAddress;
    }
    public void OnServerAddressChanged(string value)
    {
        serverAddress = value;
    }
    public void ApplySettings()
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = serverAddress;
    }

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = serverAddress = SettingsManager.Inst.DefSetting.serverAddress;
    }
}