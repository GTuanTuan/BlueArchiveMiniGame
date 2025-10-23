using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dialogue : MonoBehaviour
{
    public DialogueData curData;
    public MyTypewriter typewriter;
    public AudioSource textAudio;
    private void Awake()
    {
        if(typewriter==null)
            typewriter = GetComponent<MyTypewriter>();
    }
    public void SetData(DialogueData _curData)
    {
        curData = _curData;
        typewriter.text = curData.dialogueText;

    }
    public void Play()
    {
        SetTransform();
        StartTypewriter();
        PlayAudio();
    }
    public void SetTransform()
    {
        gameObject.transform.position = curData.worldPosition;
        gameObject.transform.eulerAngles = curData.rotataion;
        gameObject.transform.localScale = curData.scale;
        gameObject.SetActive(true);
    }
    public void StartTypewriter()
    {
        typewriter.StartTyping();
    }
    public void PlayAudio()
    {
        if (textAudio != null)
        {
            textAudio.clip = curData.voiceOver;
            textAudio.Play();
        }
    }
}
