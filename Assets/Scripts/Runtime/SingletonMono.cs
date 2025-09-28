using UnityEngine;

public class SingletonMono<T> : MonoBehaviour where T : MonoBehaviour
{
    private static T _instance;
    private static readonly object _lock = new object();
    public static T Inst
    {
        get
        {
            lock (_lock)
            {
                if (_instance == null)
                {
                    _instance = FindAnyObjectByType<T>();

                    if (_instance == null)
                    {
                        GameObject singletonObject = new GameObject(typeof(T).Name);
                        DontDestroyOnLoad(singletonObject);
                        _instance = singletonObject.AddComponent<T>();
                        Debug.Log($"实例化{singletonObject.name}");
                    }
                }
                return _instance;
            }
        }
    }
}