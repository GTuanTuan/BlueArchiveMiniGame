using System;
using System.Collections.Generic;
using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

/// <summary>Restyles the existing settings prefab without replacing its bound controls or events.</summary>
public static class OriginalSettingsWindowAuthoring
{
    private const string PrefabPath = "Assets/GameRes/UI/Main/Prefabs/SettingsWindow.prefab";
    private const string FontPath = "Assets/GameRes/UI/Shared/Fonts/Minigame/黑体.ttf";
    private const string TmpFontPath = "Assets/GameRes/UI/Shared/Fonts/Minigame/SettingsChinese SDF.asset";
    private const string ArtPath = "Assets/GameRes/UI/Main/Art/OriginalCommon/";
    private static readonly Color Ink = new Color32(31, 67, 91, 255);
    private static readonly Color Muted = new Color32(93, 126, 146, 255);
    private static readonly Color Cyan = new Color32(31, 180, 230, 255);
    private static readonly Color Pale = new Color32(236, 244, 249, 255);
    private static Font _font;
    private static TMP_FontAsset _tmpFont;
    private static readonly Dictionary<Image, string> AtlasImages = new Dictionary<Image, string>();

    [MenuItem("Tools/UI/Rebuild Original Settings Window")]
    public static void Rebuild()
    {
        string guid = AssetDatabase.AssetPathToGUID(PrefabPath);
        if (string.IsNullOrEmpty(guid)) throw new InvalidOperationException("The existing SettingsWindow prefab is required.");
        if (AssetDatabase.LoadMainAssetAtPath("Assets/GameRes/UI/Main/Atlases/MainOriginalAtlas.spriteatlas") == null)
            throw new InvalidOperationException("Build MainOriginalAtlas before rebuilding SettingsWindow.");
        _font = AssetDatabase.LoadAssetAtPath<Font>(FontPath);
        if (_font == null) throw new InvalidOperationException("Chinese UI font is missing: " + FontPath);
        _tmpFont = PrepareTMPFont(_font);
        AtlasImages.Clear();
        var root = PrefabUtility.LoadPrefabContents(PrefabPath);
        try
        {
            Component window = FindScript(root, "SettingsWindow");
            var windowData = new SerializedObject(window);
            var general = Reference<Component>(windowData, "generalPanel");
            var audio = Reference<Component>(windowData, "audioPanel");
            var graphics = Reference<Component>(windowData, "graphicsPanel");
            var generalTab = Reference<Button>(windowData, "generalTab");
            var audioTab = Reference<Button>(windowData, "audioTab");
            var graphicsTab = Reference<Button>(windowData, "graphicsTab");
            var apply = Reference<Button>(windowData, "applyButton");
            var cancel = Reference<Button>(windowData, "cancelButton");
            var defaults = Reference<Button>(windowData, "defaultsButton");
            var quit = Reference<Button>(windowData, "quitButton");
            var gd = new SerializedObject(graphics);
            var quality = Reference<TMP_Dropdown>(gd, "qualityDropdown");
            var resolution = Reference<TMP_Dropdown>(gd, "resolutionDropdown");
            var aa = Reference<TMP_Dropdown>(gd, "antiAliasingDropdown");
            var display = Reference<TMP_Dropdown>(gd, "displayDropdown");
            var fullscreen = Reference<Toggle>(gd, "fullscreenToggle");
            var borderless = Reference<Toggle>(gd, "borderlessToggle");
            var vsync = Reference<Toggle>(gd, "vsyncToggle");
            var bloom = Reference<Toggle>(gd, "bloomToggle");
            var shadows = Reference<Slider>(gd, "shadowDistanceSlider");
            var scale = Reference<Slider>(gd, "renderScaleSlider");
            var volume = Reference<Slider>(new SerializedObject(audio), "masterVolumeSlider");
            var server = Reference<TMP_InputField>(new SerializedObject(general), "serverAddressInput");

            // Move the bound objects out before removing only obsolete layout objects.
            var holding = Rect("Authoring Holding", root.transform, Vector2.zero, Vector2.one);
            Component[] preserved = { general, audio, graphics, generalTab, audioTab, graphicsTab, apply, cancel, defaults, quit,
                quality, resolution, aa, display, fullscreen, borderless, vsync, bloom, shadows, scale, volume, server };
            foreach (var component in preserved) component.transform.SetParent(holding, false);
            foreach (Transform child in Snapshot(root.transform))
                if (child != holding) UnityEngine.Object.DestroyImmediate(child.gameObject);
            foreach (var panel in new[] { general, audio, graphics })
            {
                foreach (Transform child in Snapshot(panel.transform)) UnityEngine.Object.DestroyImmediate(child.gameObject);
                foreach (var scroll in panel.GetComponents<ScrollRect>()) UnityEngine.Object.DestroyImmediate(scroll);
                foreach (var layout in panel.GetComponents<LayoutGroup>()) UnityEngine.Object.DestroyImmediate(layout);
                foreach (var fitter in panel.GetComponents<ContentSizeFitter>()) UnityEngine.Object.DestroyImmediate(fitter);
                var image = panel.GetComponent<Image>();
                if (image != null) { image.color = Color.clear; image.raycastTarget = false; }
            }

            Stretch((RectTransform)root.transform, Vector2.zero, Vector2.one);
            var blocker = root.GetComponent<Image>() ?? root.AddComponent<Image>();
            Bind(blocker, "Common_Bg_Raius10px");
            blocker.type = UnityEngine.UI.Image.Type.Sliced;
            blocker.color = new Color32(18, 39, 54, 175);
            blocker.raycastTarget = true;
            var card = Image("Settings Card", root.transform, new Vector2(.08f, .08f), new Vector2(.92f, .92f), Color.white);
            card.raycastTarget = true;
            Image("Accent", card.transform, new Vector2(.035f, .965f), new Vector2(.095f, .973f), Cyan);
            Label("Title", card.transform, "系统设置", 36, Ink, new Vector2(.035f, .885f), new Vector2(.65f, .96f));
            Label("Subtitle", card.transform, "画面、声音与连接选项", 18, Muted, new Vector2(.035f, .845f), new Vector2(.65f, .89f));
            Image("Divider", card.transform, new Vector2(.035f, .823f), new Vector2(.965f, .825f), Pale);

            PlaceButton(graphicsTab, card.transform, "画面", new Vector2(.035f, .695f), new Vector2(.215f, .79f), true, false);
            PlaceButton(audioTab, card.transform, "声音", new Vector2(.035f, .58f), new Vector2(.215f, .675f), true, false);
            PlaceButton(generalTab, card.transform, "高级", new Vector2(.035f, .465f), new Vector2(.215f, .56f), true, false);
            Label("Hint", card.transform, "修改后保存生效\n取消将还原本次调整", 17, Muted,
                new Vector2(.045f, .255f), new Vector2(.21f, .405f));
            Image("Vertical Divider", card.transform, new Vector2(.239f, .20f), new Vector2(.241f, .795f), Pale);

            foreach (var panel in new[] { general, audio, graphics })
            {
                panel.transform.SetParent(card.transform, false);
                Stretch((RectTransform)panel.transform, new Vector2(.275f, .19f), new Vector2(.955f, .795f));
            }
            general.gameObject.name = "AdvancedPanel";
            audio.gameObject.name = "AudioPanel";
            graphics.gameObject.name = "GraphicsPanel";

            Label("Heading", graphics.transform, "画面", 27, Ink, new Vector2(0, .89f), new Vector2(1, 1));
            DropdownRow(graphics.transform, resolution, "显示分辨率", "选择适合屏幕的尺寸", .75f);
            ToggleRow(graphics.transform, fullscreen, "全屏显示", "在窗口与全屏之间切换", .63f);
            ToggleRow(graphics.transform, borderless, "无边框全屏", "全屏模式下使用无边框窗口", .51f);
            ToggleRow(graphics.transform, vsync, "垂直同步", "减少画面撕裂", .39f);
            aa.ClearOptions();
            aa.AddOptions(new List<string> { "关闭", "2 倍", "4 倍", "8 倍" });
            DropdownRow(graphics.transform, aa, "抗锯齿", "改善物体边缘的平滑度", .27f);
            SliderRow(graphics.transform, shadows, "阴影距离", "0–150 米", .15f, 0, 150);
            SliderRow(graphics.transform, scale, "渲染比例", "10%–200%", .03f, .1f, 2f);
            // Existing serialized fields and event hookups stay intact, but unsupported
            // controls and the redundant quality/MSAA preset are not presented as features.
            foreach (var hidden in new Component[] { bloom, display, quality })
            {
                hidden.transform.SetParent(graphics.transform, false);
                hidden.gameObject.SetActive(false);
            }

            Label("Heading", audio.transform, "声音", 27, Ink, new Vector2(0, .89f), new Vector2(1, 1));
            Label("Description", audio.transform, "调整游戏整体音量，修改时可即时试听。", 20, Muted,
                new Vector2(0, .73f), new Vector2(1, .86f));
            SliderRow(audio.transform, volume, "主音量", "静音 — 最大", .52f, 0, 1);
            Label("Preview Note", audio.transform, "选择“保存设置”保留调整，选择“取消”恢复原来的音量。", 19, Muted,
                new Vector2(.025f, .32f), new Vector2(.96f, .46f));

            Label("Heading", general.transform, "高级连接", 27, Ink, new Vector2(0, .89f), new Vector2(1, 1));
            Label("Description", general.transform, "通常无需修改以下连接配置。", 20, Muted,
                new Vector2(0, .73f), new Vector2(1, .86f));
            var connection = Image("Connection", general.transform, new Vector2(0, .36f), new Vector2(1, .68f), Pale);
            Label("Label", connection.transform, "服务地址", 23, Ink, new Vector2(.035f, .64f), new Vector2(.96f, .93f));
            server.transform.SetParent(connection.transform, false);
            Stretch((RectTransform)server.transform, new Vector2(.035f, .17f), new Vector2(.965f, .55f));
            StyleInput(server);
            Label("Connection Note", general.transform, "留空使用默认地址，保存后下次启动生效。", 19, Muted,
                new Vector2(.025f, .22f), new Vector2(.96f, .33f));

            Image("Footer Divider", card.transform, new Vector2(.035f, .154f), new Vector2(.965f, .156f), Pale);
            PlaceButton(quit, card.transform, "退出游戏", new Vector2(.035f, .045f), new Vector2(.205f, .125f), false, false);
            var quitLabel = quit.GetComponentInChildren<Text>();
            if (quitLabel != null) quitLabel.color = new Color32(157, 83, 83, 255);
            PlaceButton(defaults, card.transform, "恢复默认", new Vector2(.275f, .045f), new Vector2(.475f, .125f), false, false);
            PlaceButton(cancel, card.transform, "取消", new Vector2(.535f, .045f), new Vector2(.725f, .125f), false, false);
            PlaceButton(apply, card.transform, "保存设置", new Vector2(.755f, .045f), new Vector2(.965f, .125f), false, true);
            UnityEngine.Object.DestroyImmediate(holding.gameObject);
            graphics.gameObject.SetActive(true);
            general.gameObject.SetActive(false);
            audio.gameObject.SetActive(false);
            root.SetActive(true);
            CompleteAtlasBindings(root);
            windowData.Update();
            var bindings = windowData.FindProperty("atlasImages");
            if (bindings == null || !bindings.isArray)
                throw new InvalidOperationException("Compile SettingsWindow.atlasImages before rebuilding.");
            bindings.arraySize = AtlasImages.Count;
            int bindingIndex = 0;
            foreach (var binding in AtlasImages)
            {
                var element = bindings.GetArrayElementAtIndex(bindingIndex++);
                element.FindPropertyRelative("image").objectReferenceValue = binding.Key;
                element.FindPropertyRelative("spriteName").stringValue = binding.Value;
            }
            windowData.ApplyModifiedPropertiesWithoutUndo();
            PrefabUtility.SaveAsPrefabAsset(root, PrefabPath, out bool saved);
            if (!saved || AssetDatabase.AssetPathToGUID(PrefabPath) != guid)
                throw new InvalidOperationException("SettingsWindow save failed or GUID changed.");
            AssetDatabase.SaveAssets();
            Debug.Log("SettingsWindow rebuilt with original sprites, Chinese labels, and preserved control bindings: " + guid);
        }
        finally { PrefabUtility.UnloadPrefabContents(root); }
    }

    private static TMP_FontAsset PrepareTMPFont(Font font)
    {
        var asset = AssetDatabase.LoadAssetAtPath<TMP_FontAsset>(TmpFontPath);
        if (asset != null) return asset;
        asset = TMP_FontAsset.CreateFontAsset(font);
        if (asset == null) throw new InvalidOperationException("Cannot create Chinese TMP font from the existing font.");
        asset.name = "SettingsChinese SDF";
        asset.TryAddCharacters("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789:/.-_ 关闭倍当前输入服务地址显示分辨率");
        AssetDatabase.CreateAsset(asset, TmpFontPath);
        asset.material.name = "SettingsChinese SDF Material";
        AssetDatabase.AddObjectToAsset(asset.material, asset);
        foreach (var texture in asset.atlasTextures)
        {
            texture.name = "SettingsChinese SDF Atlas";
            AssetDatabase.AddObjectToAsset(texture, asset);
        }
        EditorUtility.SetDirty(asset);
        AssetDatabase.SaveAssets();
        return asset;
    }

    private static void DropdownRow(Transform panel, TMP_Dropdown control, string title, string detail, float y)
    {
        var row = Row(panel, title, detail, y);
        control.transform.SetParent(row.transform, false);
        Stretch((RectTransform)control.transform, new Vector2(.50f, .19f), new Vector2(.96f, .81f));
        StyleSelectable(control);
        foreach (var text in control.GetComponentsInChildren<TMP_Text>(true)) StyleTMP(text, 20);
        if (control.captionText != null)
            Stretch(control.captionText.rectTransform, new Vector2(.055f, .05f), new Vector2(.86f, .95f));
        if (control.template != null)
        {
            control.template.anchorMin = new Vector2(0, 0);
            control.template.anchorMax = new Vector2(1, 0);
            control.template.pivot = new Vector2(.5f, 1);
            control.template.anchoredPosition = Vector2.zero;
            control.template.sizeDelta = new Vector2(0, 230);
            control.template.gameObject.SetActive(false);
            var image = control.template.GetComponent<Image>();
            if (image != null) { Bind(image, "Common_Bg_Raius10px"); image.color = Color.white; image.type = UnityEngine.UI.Image.Type.Sliced; }
        }
        control.RefreshShownValue();
    }

    private static void ToggleRow(Transform panel, Toggle control, string title, string detail, float y)
    {
        var row = Row(panel, title, detail, y);
        control.transform.SetParent(row.transform, false);
        Fixed((RectTransform)control.transform, new Vector2(.92f, .5f), new Vector2(38, 38));
        foreach (var label in control.GetComponentsInChildren<Text>(true)) label.gameObject.SetActive(false);
        foreach (var label in control.GetComponentsInChildren<TMP_Text>(true)) label.gameObject.SetActive(false);
        if (control.targetGraphic is Image background)
        {
            Stretch(background.rectTransform, Vector2.zero, Vector2.one);
            Bind(background, "Common_Bg_Raius10px");
            background.type = UnityEngine.UI.Image.Type.Sliced;
            background.color = Color.white;
        }
        if (control.graphic is Image check)
        {
            Stretch(check.rectTransform, new Vector2(.15f, .15f), new Vector2(.85f, .85f));
            Bind(check, "Common_Icon_Check_B");
            check.type = UnityEngine.UI.Image.Type.Simple;
            check.preserveAspect = true;
            check.color = Cyan;
        }
        control.navigation = new Navigation { mode = Navigation.Mode.Automatic };
    }

    private static void SliderRow(Transform panel, Slider control, string title, string detail, float y, float min, float max)
    {
        var row = Row(panel, title, detail, y);
        control.transform.SetParent(row.transform, false);
        Stretch((RectTransform)control.transform, new Vector2(.50f, .20f), new Vector2(.96f, .80f));
        control.minValue = min;
        control.maxValue = max;
        control.wholeNumbers = false;
        control.direction = Slider.Direction.LeftToRight;
        foreach (var label in control.GetComponentsInChildren<Text>(true)) label.gameObject.SetActive(false);
        foreach (var label in control.GetComponentsInChildren<TMP_Text>(true)) label.gameObject.SetActive(false);
        var background = control.transform.Find("Background")?.GetComponent<Image>();
        if (background != null)
        {
            Stretch(background.rectTransform, new Vector2(0, .40f), new Vector2(1, .60f));
            Bind(background, "Common_Bg_Raius10px");
            background.type = UnityEngine.UI.Image.Type.Sliced;
            background.color = new Color32(204, 221, 233, 255);
        }
        if (control.fillRect != null)
        {
            var fillArea = control.fillRect.parent as RectTransform;
            if (fillArea != null) Stretch(fillArea, new Vector2(0, .40f), new Vector2(1, .60f));
            var fill = control.fillRect.GetComponent<Image>();
            if (fill != null) { Bind(fill, "Common_Bg_Raius10px"); fill.type = UnityEngine.UI.Image.Type.Sliced; fill.color = Cyan; }
        }
        if (control.handleRect == null)
        {
            var area = Rect("Handle Slide Area", control.transform, Vector2.zero, Vector2.one);
            var handle = Image("Handle", area, Vector2.zero, Vector2.one, Color.white);
            handle.raycastTarget = true;
            control.handleRect = handle.rectTransform;
            control.targetGraphic = handle;
        }
        if (control.handleRect != null)
        {
            var area = control.handleRect.parent as RectTransform;
            if (area != null)
            {
                Stretch(area, new Vector2(0, .5f), new Vector2(1, .5f));
                area.sizeDelta = new Vector2(0, 26);
            }
            control.handleRect.anchorMin = control.handleRect.anchorMax = new Vector2(.5f, .5f);
            control.handleRect.pivot = new Vector2(.5f, .5f);
            control.handleRect.anchoredPosition = Vector2.zero;
            control.handleRect.sizeDelta = new Vector2(26, 0);
            var image = control.handleRect.GetComponent<Image>();
            if (image != null) { Bind(image, "Common_Bg_Raius10px"); image.type = UnityEngine.UI.Image.Type.Sliced; image.color = Color.white; }
        }
        control.navigation = new Navigation { mode = Navigation.Mode.Automatic };
    }

    private static void StyleInput(TMP_InputField input)
    {
        StyleSelectable(input);
        input.fontAsset = _tmpFont;
        input.pointSize = 20;
        foreach (var text in input.GetComponentsInChildren<TMP_Text>(true)) StyleTMP(text, 20);
        if (input.placeholder is TMP_Text placeholder) { placeholder.text = "输入服务地址"; placeholder.color = Muted; }
        if (input.textViewport != null) Stretch(input.textViewport, new Vector2(.025f, .05f), new Vector2(.975f, .95f));
    }

    private static Image Row(Transform panel, string title, string detail, float y)
    {
        var row = Image(title, panel, new Vector2(0, y), new Vector2(1, y + .105f), Pale);
        Label("Title", row.transform, title, 21, Ink, new Vector2(.025f, .43f), new Vector2(.47f, .95f));
        Label("Detail", row.transform, detail, 15, Muted, new Vector2(.025f, .03f), new Vector2(.47f, .47f));
        return row;
    }

    private static void PlaceButton(Button button, Transform parent, string text, Vector2 min, Vector2 max, bool tab, bool primary)
    {
        button.transform.SetParent(parent, false);
        Stretch((RectTransform)button.transform, min, max);
        foreach (var child in Snapshot(button.transform)) UnityEngine.Object.DestroyImmediate(child.gameObject);
        var image = button.GetComponent<Image>();
        Bind(image, tab ? "Common_Sub_Btn" : "Common_Btn_BG");
        image.type = UnityEngine.UI.Image.Type.Sliced;
        image.color = primary ? Cyan : Color.white;
        button.targetGraphic = image;
        button.transition = Selectable.Transition.ColorTint;
        button.navigation = new Navigation { mode = Navigation.Mode.Automatic };
        var colors = button.colors;
        colors.normalColor = tab ? new Color(.62f, .75f, .86f, 1) : Color.white;
        colors.highlightedColor = Color.white;
        colors.selectedColor = Color.white;
        colors.pressedColor = new Color(.72f, .88f, .96f, 1);
        colors.disabledColor = tab ? Color.white : new Color(.8f, .85f, .88f, 1);
        button.colors = colors;
        var label = Label("Label", button.transform, text, 22, tab || primary ? Color.white : Ink,
            new Vector2(.05f, .08f), new Vector2(.95f, .92f));
        label.alignment = TextAnchor.MiddleCenter;
    }

    private static void StyleSelectable(Selectable control)
    {
        if (control.targetGraphic is Image image)
        {
            Bind(image, "Common_Bg_Raius10px");
            image.type = UnityEngine.UI.Image.Type.Sliced;
            image.color = Color.white;
        }
        control.navigation = new Navigation { mode = Navigation.Mode.Automatic };
    }

    private static void StyleTMP(TMP_Text text, float size)
    {
        text.font = _tmpFont;
        text.fontSize = size;
        text.enableAutoSizing = false;
        text.color = Ink;
        text.raycastTarget = false;
        text.margin = new Vector4(3, 0, 3, 0);
    }

    private static void Bind(Image image, string name)
    {
        // Names, not source Sprite references, are serialized into the window.
        if (AssetDatabase.LoadAssetAtPath<Sprite>(ArtPath + name + ".png") == null)
            throw new InvalidOperationException("Verified original sprite is missing: " + name);
        image.sprite = null;
        image.overrideSprite = null;
        AtlasImages[image] = name;
    }

    private static void CompleteAtlasBindings(GameObject root)
    {
        foreach (var image in root.GetComponentsInChildren<Image>(true))
        {
            if (AtlasImages.ContainsKey(image)) continue;
            if (image.name.IndexOf("Arrow", StringComparison.OrdinalIgnoreCase) >= 0)
            {
                image.sprite = null;
                image.overrideSprite = null;
                image.enabled = false;
                // A text chevron needs no additional image asset.
                var existing = image.transform.Find("Chevron")?.GetComponent<Text>();
                if (existing == null)
                    existing = Label("Chevron", image.transform, "▼", 16, Ink, Vector2.zero, Vector2.one);
                existing.alignment = TextAnchor.MiddleCenter;
                continue;
            }
            string spriteName = image.name.IndexOf("Checkmark", StringComparison.OrdinalIgnoreCase) >= 0
                ? "Common_Icon_Check_B" : "Common_Square_Bg";
            Bind(image, spriteName);
        }
        foreach (var selectable in root.GetComponentsInChildren<Selectable>(true))
            selectable.spriteState = new SpriteState();
    }

    private static Image Image(string name, Transform parent, Vector2 min, Vector2 max, Color color)
    {
        var rect = Rect(name, parent, min, max);
        var image = rect.gameObject.AddComponent<Image>();
        Bind(image, "Common_Bg_Raius10px");
        image.type = UnityEngine.UI.Image.Type.Sliced;
        image.color = color;
        image.raycastTarget = false;
        return image;
    }

    private static Text Label(string name, Transform parent, string value, int size, Color color, Vector2 min, Vector2 max)
    {
        var rect = Rect(name, parent, min, max);
        var text = rect.gameObject.AddComponent<Text>();
        text.font = _font;
        text.fontSize = size;
        text.text = value;
        text.color = color;
        text.alignment = TextAnchor.MiddleLeft;
        text.horizontalOverflow = HorizontalWrapMode.Wrap;
        text.verticalOverflow = VerticalWrapMode.Truncate;
        text.raycastTarget = false;
        return text;
    }

    private static RectTransform Rect(string name, Transform parent, Vector2 min, Vector2 max)
    {
        var rect = new GameObject(name, typeof(RectTransform)).GetComponent<RectTransform>();
        rect.SetParent(parent, false);
        Stretch(rect, min, max);
        return rect;
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
        rect.pivot = new Vector2(.5f, .5f);
        rect.anchoredPosition = Vector2.zero;
        rect.sizeDelta = size;
    }

    private static Component FindScript(GameObject root, string typeName)
    {
        foreach (var component in root.GetComponents<Component>())
            if (component != null && component.GetType().Name == typeName) return component;
        throw new InvalidOperationException("Required component missing: " + typeName);
    }

    private static T Reference<T>(SerializedObject source, string property) where T : UnityEngine.Object
    {
        var value = source.FindProperty(property)?.objectReferenceValue as T;
        if (value == null) throw new InvalidOperationException(source.targetObject.GetType().Name + "." + property + " is not configured.");
        return value;
    }

    private static List<Transform> Snapshot(Transform parent)
    {
        var result = new List<Transform>();
        foreach (Transform child in parent) result.Add(child);
        return result;
    }
}
