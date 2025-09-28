
using UnityEngine;

public class Singleton<T> where T:class,new()
{
    static T _inst;
    static readonly object _lock = new object();
    public static T Inst
    {
        get
        {
            lock (_lock)
            {
                if(_inst == null)
                {
                    _inst = new T();
                    Debug.Log($"[Singleton] 创建 {typeof(T).Name} 实例");
                }
                return _inst;
            }
        }
    }
}
