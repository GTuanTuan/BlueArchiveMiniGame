using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
[CreateAssetMenu(fileName = "NewDialogueDatabase", menuName = "Dialogue/Dialogue Database")]
public class DialogueDatabase : ScriptableObject
{
    public List<DialogueData> dialogues = new List<DialogueData>();
    public DialogueData GetDialogueById(int id)
    {
        return dialogues.Find(d => d.id == id);
    }
    public bool TryGetDialogue(int id,out DialogueData dialogue)
    {
        dialogue = dialogues.Find(d => d.id == id);
        return dialogue != null;
    }
}
[System.Serializable]
public class DialogueData
{
    public int id;
    public string speakerName;
    public string dialogueText;
    public AudioClip voiceOver;
    public float displayDuration = 5f;
    public Vector3 worldPosition;
    public Vector3 rotataion;
    public Vector3 scale = Vector3.one;
    public int nextDialogueId = -1;

    public UnityEvent onStart;
    public UnityEvent onEnd;
    public List<DialogueEvent> dialogueEvents;
}
[Serializable]
public class DialogueEvent
{
    public float triggerTime;
    public UnityEvent onTrigger;
    public bool hasTriggered;
}