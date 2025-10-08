using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using YooAsset;

public class UIManager : Singleton<UIManager>
{
    Dictionary<string, UIBaseWindow> openedWindows = new Dictionary<string, UIBaseWindow>();
    public void Init()
    {

    }
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
                GameObject go = GameObject.Instantiate((GameObject)handle.AssetObject, GameManager.Inst.MainUICanvas.transform);
                var window = go.GetComponent<T>();
                window.Show();
                openedWindows[windowName] = window;
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
        else
        {
            Debug.Log("未找到该名字窗口，使用窗口类名试试");
        }
    }
    public bool CheckShow(string windowName)
    {
        if (openedWindows.ContainsKey(windowName))
        {
            return openedWindows[windowName].gameObject.activeSelf;
        }
        else
        {
            return false;
        }
    }
}
