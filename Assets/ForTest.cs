using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForTest : MonoBehaviour
{
    public TMPro.TMP_Text mP_Text;
    // Start is called before the first frame update
    string source = "87.5\r\n95\r\n87.5\r\n90\r\n95\r\n90\r\n97.5\r\n95\r\n100\r\n77.5\r\n97.5\r\n100\r\n95\r\n95\r\n97.5\r\n85\r\n97.5\r\n92.5\r\n95\r\n87.5\r\n92.5\r\n87.5\r\n95\r\n90\r\n97.5\r\n95\r\n87.5\r\n87.5\r\n90\r\n90\r\n90\r\n92.5\r\n92.5\r\n97.5\r\n95\r\n95\r\n90\r\n90\r\n100\r\n90\r\n100\r\n80\r\n90\r\n97.5\r\n92.5\r\n97.5\r\n80\r\n90\r\n90\r\n87.5\r\n92.5\r\n95\r\n87.5\r\n80\r\n90\r\n100\r\n95\r\n87.5\r\n90\r\n87.5\r\n92.5\r\n95\r\n75\r\n90\r\n92.5\r\n97.5\r\n92.5\r\n90\r\n92.5\r\n100\r\n";
    void Start()
    {
        string _out = "";
        string[] strs = source.Split("\r\n");
        foreach (var str in strs)
        {
            if (!string.IsNullOrEmpty(str))
            {
                float targetAverage = float.Parse(str);
                List<float> temp = GenerateNumbersFromAverage(targetAverage, 4);
                string line = "";
                //foreach (float num in temp)
                //{
                //    line += num.ToString("F1") + "\t";
                //}
                //_out += string.Join("", line) + "\r\n";

                foreach (float num in temp)
                {
                    line += num.ToString("F1") + "\t";
                }
                line += targetAverage.ToString("F1");
                _out += line + "\r\n";
            }


        }
        Debug.Log(_out);
        mP_Text.text = _out;
    }

    List<float> GenerateNumbersFromAverage(float targetAverage, int count)
    {
        List<float> numbers = new List<float>();
        float total = targetAverage * count;

        // 生成前4个随机数
        float currentSum = 0f;
        for (int i = 0; i < count - 1; i++)
        {
            // 确保剩余的数字能够满足平均值要求
            float remainingTotal = total - currentSum;
            float maxValue = Mathf.Min(100f, remainingTotal); // 不超过100
            float minValue = Mathf.Max(60f, remainingTotal - (count - i - 1) * 100f); // 不低于60

            int randomNum = Random.Range((int)minValue, (int)maxValue);
            numbers.Add(randomNum);
            currentSum += randomNum;
        }

        // 计算最后一个数字以确保平均值精确
        float lastNum = total - currentSum;
        numbers.Add(lastNum);

        return numbers;
    }
    //void Start()
    //{
    //    string _out = "";
    //    string[] strs = source.Split("\r\n");
    //    foreach (var str in strs)
    //    {
    //        List<string> temp = new List<string>();
    //        for (int i = 0; i < 5; i++)
    //        {
    //            if (!string.IsNullOrEmpty(str))
    //            {
    //                float num = float.Parse(str);
    //                num += Random.Range(-100 + num, 100 - num);
    //                temp.Add(num.ToString() + "\t");
    //            }

    //        }
    //        _out += string.Join("", temp) + "\r\n";

    //    }
    //    Debug.Log(_out);
    //    mP_Text.text = _out;
    //}
}
