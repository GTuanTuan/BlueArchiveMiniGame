using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public class UIManager : SingletonMono<UIManager>
{
    Transform uiRoot;
    Dictionary<string, UIBaseWindow> openedWindows = new Dictionary<string, UIBaseWindow>();
    public void ShowWindow<T>(string windowName,Action<T> onShow = null) where T : UIBaseWindow
    {
        if (openedWindows.ContainsKey(windowName))
        {
            var window = openedWindows[windowName] as T;
            window.Show();
            onShow?.Invoke(window);
        }
        else
        {
            YooAssets.LoadAssetAsync<GameObject>(windowName).Completed += handle =>
            {
                GameObject go = Instantiate((GameObject)handle.AssetObject, GameManager.Inst.MainUICanvas.transform);
                var window = go.GetComponent<T>();
                window.Show();
                onShow?.Invoke(window);
            };
        }
    }
    public void HideWindow(string windowName)
    {
        if (openedWindows.ContainsKey(windowName))
        {
            openedWindows[windowName].Hide();
        }
    }
}
