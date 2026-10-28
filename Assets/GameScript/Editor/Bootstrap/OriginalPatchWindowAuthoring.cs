using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Rebuilds only the hot-update window prefab. It does not modify the Boot scene.
/// Original sprites are bound by name at runtime so Preload owns its atlas lifetime.
/// </summary>
public static class OriginalPatchWindowAuthoring
{
    private const string PrefabPath = "Assets/GameRes/UI/Preload/Prefabs/PatchWindow.prefab";
    private const string ScriptPath = "Assets/GameScript/HotUpdate/Preload/PatchWindow.cs";
    private const string FontPath = "Assets/GameRes/UI/Shared/Fonts/Minigame/黑体.ttf";
    private static readonly Color Ink = new Color32(31, 67, 91, 255);
    private static readonly Color Muted = new Color32(93, 126, 146, 255);
    private static readonly Color Cyan = new Color32(31, 180, 230, 255);

    private sealed class Binding
    {
        public Image Image;
        public string Name;
    }

    [MenuItem("Tools/UI/Rebuild Original Patch Window")]
    public static void Rebuild()
    {
        string originalGuid = AssetDatabase.AssetPathToGUID(PrefabPath);
        if (string.IsNullOrEmpty(originalGuid))
            throw new InvalidOperationException("The existing PatchWindow prefab is required so its GUID can be retained.");
        var font = AssetDatabase.LoadAssetAtPath<Font>(FontPath);
        if (font == null)
            throw new InvalidOperationException("Chinese UI font is missing: " + FontPath);
        var script = AssetDatabase.LoadAssetAtPath<MonoScript>(ScriptPath);
        Type scriptType = script != null ? script.GetClass() : null;
        if (scriptType == null || !typeof(MonoBehaviour).IsAssignableFrom(scriptType))
            throw new InvalidOperationException("Compile the new PatchWindow script before rebuilding its prefab.");

        var bindings = new List<Binding>();
        GameObject root = new GameObject("PatchWindow", typeof(RectTransform));
        try
        {
            Stretch(root.GetComponent<RectTransform>(), Vector2.zero, Vector2.one);
            var background = root.AddComponent<Image>();
            background.color = new Color32(233, 245, 251, 255);
            background.raycastTarget = true;

            // The parent Boot canvas scales from 1920 x 1080. Percentage anchors keep
            // the layout inside the screen across landscape aspect ratios.
            var accent = MakeImage("TopAccent", root.transform, new Vector2(0, .988f), Vector2.one,
                Cyan, "Common_Square_Bg", bindings);
            accent.raycastTarget = false;
            MakeText("Brand", root.transform, font, "BLUE ARCHIVE", 24, Cyan,
                new Vector2(.12f, .89f), new Vector2(.88f, .94f), TextAnchor.MiddleLeft);
            MakeText("Title", root.transform, font, "资源更新", 52, Ink,
                new Vector2(.12f, .80f), new Vector2(.88f, .89f), TextAnchor.MiddleLeft);

            var cardShadow = MakeImage("CardShadow", root.transform, new Vector2(.12f, .195f), new Vector2(.88f, .775f),
                new Color32(255, 255, 255, 80), "Common_Bg_Raius10px_Shadow", bindings);
            cardShadow.type = Image.Type.Sliced;
            var card = MakeImage("Card", root.transform, new Vector2(.12f, .20f), new Vector2(.88f, .78f),
                Color.white, "Common_Bg_Raius10px", bindings);
            card.type = Image.Type.Sliced;

            var arona = MakeImage("LoadingArona", card.transform, Vector2.zero, Vector2.one,
                Color.white, "Loading_Arona", bindings);
            Fixed(arona.rectTransform, new Vector2(.16f, .54f), new Vector2(174, 204));
            arona.preserveAspect = true;
            var halo = MakeImage("LoadingHalo", card.transform, Vector2.zero, Vector2.one,
                Color.white, "Loading_Halo", bindings);
            Fixed(halo.rectTransform, new Vector2(.16f, .77f), new Vector2(72, 39));
            halo.preserveAspect = true;

            MakeText("CardLabel", card.transform, font, "准备进入游戏", 22, Muted,
                new Vector2(.32f, .78f), new Vector2(.94f, .87f), TextAnchor.MiddleLeft);
            Text status = MakeText("Status", card.transform, font, "正在准备资源", 32, Ink,
                new Vector2(.32f, .62f), new Vector2(.94f, .77f), TextAnchor.MiddleLeft);

            var progressObject = new GameObject("Progress", typeof(RectTransform), typeof(Slider));
            progressObject.transform.SetParent(card.transform, false);
            Stretch(progressObject.GetComponent<RectTransform>(), new Vector2(.32f, .50f), new Vector2(.94f, .54f));
            Slider progress = progressObject.GetComponent<Slider>();
            progress.minValue = 0;
            progress.maxValue = 1;
            progress.value = 0;
            progress.interactable = false;
            progress.transition = Selectable.Transition.None;
            progress.navigation = new Navigation { mode = Navigation.Mode.None };
            MakeImage("Track", progress.transform, Vector2.zero, Vector2.one,
                new Color32(224, 238, 246, 255), "Common_Bg_Raius10px", bindings).type = Image.Type.Sliced;
            var fill = MakeImage("Fill", progress.transform, Vector2.zero, Vector2.one,
                Cyan, "Common_Bg_Raius10px", bindings);
            fill.type = Image.Type.Sliced;
            progress.fillRect = fill.rectTransform;
            progress.direction = Slider.Direction.LeftToRight;

            Text size = MakeText("DownloadSize", card.transform, font, string.Empty, 22, Muted,
                new Vector2(.32f, .38f), new Vector2(.94f, .48f), TextAnchor.MiddleRight);
            Text error = MakeText("Error", card.transform, font, string.Empty, 20, new Color32(148, 65, 67, 255),
                new Vector2(.32f, .12f), new Vector2(.76f, .36f), TextAnchor.UpperLeft);
            error.horizontalOverflow = HorizontalWrapMode.Wrap;
            error.verticalOverflow = VerticalWrapMode.Truncate;

            var retryImage = MakeImage("Retry", card.transform, Vector2.zero, Vector2.one,
                Cyan, "Common_Btn_BG", bindings);
            Fixed(retryImage.rectTransform, new Vector2(.94f, .18f), new Vector2(190, 68));
            retryImage.rectTransform.pivot = new Vector2(1, .5f);
            retryImage.type = Image.Type.Sliced;
            retryImage.raycastTarget = true;
            Button retry = retryImage.gameObject.AddComponent<Button>();
            retry.targetGraphic = retryImage;
            retry.navigation = new Navigation { mode = Navigation.Mode.None };
            ColorBlock colors = retry.colors;
            colors.normalColor = Color.white;
            colors.highlightedColor = new Color(.88f, .97f, 1);
            colors.pressedColor = new Color(.75f, .87f, .93f);
            colors.selectedColor = colors.highlightedColor;
            retry.colors = colors;
            MakeText("Label", retry.transform, font, "重新连接", 24, Color.white,
                new Vector2(.08f, .08f), new Vector2(.92f, .92f), TextAnchor.MiddleCenter);
            retry.gameObject.SetActive(false);

            MakeText("Footer", root.transform, font, "资源准备完成后将自动进入游戏", 22, Muted,
                new Vector2(.12f, .09f), new Vector2(.88f, .15f), TextAnchor.MiddleLeft);

            Component behaviour = root.AddComponent(scriptType);
            var serialized = new SerializedObject(behaviour);
            SetReference(serialized, "statusText", status);
            SetReference(serialized, "progressBar", progress);
            SetReference(serialized, "downloadSizeText", size);
            SetReference(serialized, "errorText", error);
            SetReference(serialized, "retryButton", retry);
            SetReference(serialized, "video", null);
            SerializedProperty images = serialized.FindProperty("atlasImages");
            if (images == null || !images.isArray)
                throw new InvalidOperationException("PatchWindow.atlasImages has not been compiled yet.");
            images.arraySize = bindings.Count;
            for (int i = 0; i < bindings.Count; ++i)
            {
                SerializedProperty element = images.GetArrayElementAtIndex(i);
                element.FindPropertyRelative("image").objectReferenceValue = bindings[i].Image;
                element.FindPropertyRelative("spriteName").stringValue = bindings[i].Name;
            }
            serialized.ApplyModifiedPropertiesWithoutUndo();
            PrefabUtility.SaveAsPrefabAsset(root, PrefabPath, out bool succeeded);
            if (!succeeded)
                throw new InvalidOperationException("Saving PatchWindow prefab failed.");
            if (AssetDatabase.AssetPathToGUID(PrefabPath) != originalGuid)
                throw new InvalidOperationException("PatchWindow prefab GUID changed unexpectedly.");
            Debug.Log("PatchWindow rebuilt with original atlas sprite bindings; retained GUID " + originalGuid);
        }
        finally
        {
            UnityEngine.Object.DestroyImmediate(root);
        }
    }

    private static Image MakeImage(string name, Transform parent, Vector2 min, Vector2 max,
        Color color, string spriteName, List<Binding> bindings)
    {
        var go = new GameObject(name, typeof(RectTransform), typeof(Image));
        go.transform.SetParent(parent, false);
        var image = go.GetComponent<Image>();
        Stretch(image.rectTransform, min, max);
        image.color = color;
        image.raycastTarget = false;
        bindings.Add(new Binding { Image = image, Name = spriteName });
        return image;
    }

    private static Text MakeText(string name, Transform parent, Font font, string value, int fontSize,
        Color color, Vector2 min, Vector2 max, TextAnchor alignment)
    {
        var go = new GameObject(name, typeof(RectTransform), typeof(Text));
        go.transform.SetParent(parent, false);
        var text = go.GetComponent<Text>();
        Stretch(text.rectTransform, min, max);
        text.font = font;
        text.fontSize = fontSize;
        text.text = value;
        text.color = color;
        text.alignment = alignment;
        text.raycastTarget = false;
        text.horizontalOverflow = HorizontalWrapMode.Wrap;
        text.verticalOverflow = VerticalWrapMode.Truncate;
        return text;
    }

    private static void Stretch(RectTransform rect, Vector2 min, Vector2 max)
    {
        rect.anchorMin = min;
        rect.anchorMax = max;
        rect.pivot = new Vector2(.5f, .5f);
        rect.offsetMin = rect.offsetMax = Vector2.zero;
        rect.localScale = Vector3.one;
    }

    private static void Fixed(RectTransform rect, Vector2 anchor, Vector2 size)
    {
        rect.anchorMin = rect.anchorMax = anchor;
        rect.anchoredPosition = Vector2.zero;
        rect.sizeDelta = size;
    }

    private static void SetReference(SerializedObject serialized, string name, UnityEngine.Object value)
    {
        SerializedProperty property = serialized.FindProperty(name);
        if (property == null)
            throw new InvalidOperationException("PatchWindow." + name + " has not been compiled yet.");
        property.objectReferenceValue = value;
    }
}
