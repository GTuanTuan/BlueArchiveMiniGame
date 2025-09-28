using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class GeneralPanel : UIBasePanel,ISettingsPanel
{
    [SerializeField] private TMP_InputField serverAddressInput;

    public override void OnShow()
    {
        serverAddressInput.text = SettingsManager.Inst.CurrentSettings.serverAddress;
        base.Refresh();
    }
    public override void Refresh()
    {
        base.Refresh();
    }

    public void OnServerAddressChanged(string value)
    {
        SettingsManager.Inst.CurrentSettings.serverAddress = value;
    }

    public void ApplySettings()
    {
       // SettingsManager.Inst.CurrentSettings.serverAddress = value;
    }

    public void ResetToDefault()
    {
        
    }
}