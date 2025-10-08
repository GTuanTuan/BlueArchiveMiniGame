using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GeneralPanel : UIBasePanel,ISettingsPanel
{
    [SerializeField] private TMP_InputField serverAddressInput;
    public override void OnShow()
    {
        serverAddressInput.text = SettingsManager.Inst.CurrentSettings.serverAddress;
    }
    public void OnServerAddressChanged(string value)
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = value;
    }
    public void ApplySettings()
    {
       
    }

    public void ResetToDefault()
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = SettingsManager.Inst.DefSetting.serverAddress;
    }
}