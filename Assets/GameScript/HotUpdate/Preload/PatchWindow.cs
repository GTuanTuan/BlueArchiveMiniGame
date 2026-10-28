using System;
using System.Collections;
using System.Collections.Generic;
using BA.Bootstrap;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.U2D;
using UnityEngine.Video;
using YooAsset;

/// <summary>Hot-update presentation. The AOT bootstrap owns all update operations.</summary>
public class PatchWindow : MonoBehaviour, IPatchView
{
    public Text statusText;
    public Slider progressBar;
    public Text downloadSizeText;
    public Text errorText;
    public VideoPlayer video;
    [SerializeField] private Button retryButton;
    [Serializable] public sealed class PatchSpriteBinding { public Image image; public string spriteName; }
    public PatchSpriteBinding[] atlasImages;
    private Action _retry;
    private AssetHandle _atlasHandle;
    private readonly List<Sprite> _sprites = new List<Sprite>();

    private IEnumerator Start()
    {
        if (atlasImages == null || atlasImages.Length == 0) yield break;
        _atlasHandle = YooAssets.GetPackage("Preload").LoadAssetAsync<SpriteAtlas>("PreloadOriginalAtlas");
        yield return _atlasHandle;
        var atlas = _atlasHandle.AssetObject as SpriteAtlas;
        if (_atlasHandle.Status != EOperationStatus.Succeeded || atlas == null)
        { Debug.LogWarning("原版更新界面图集加载失败：" + _atlasHandle.Error); yield break; }
        foreach (var binding in atlasImages)
        {
            if (binding.image == null) continue;
            var sprite = atlas.GetSprite(binding.spriteName);
            if (sprite == null) { Debug.LogWarning("图集缺少原版图片：" + binding.spriteName); continue; }
            _sprites.Add(sprite);
            binding.image.sprite = sprite;
        }
    }

    private void Awake()
    {
        if (video != null) video.targetCamera = GameManager.Inst.UICamera;
        if (retryButton != null)
        {
            retryButton.onClick.AddListener(Retry);
            retryButton.gameObject.SetActive(false);
        }
        Render(new PackageUpdateProgress { Message = "正在准备资源" });
    }

    public void Render(PackageUpdateProgress progress)
    {
        _retry = null;
        if (errorText != null) { errorText.text = string.Empty; errorText.gameObject.SetActive(false); }
        if (retryButton != null) retryButton.gameObject.SetActive(false);
        if (statusText != null) statusText.text = progress.Message;
        if (progressBar != null) progressBar.value = Mathf.Clamp01(progress.Progress);
        if (downloadSizeText != null)
            downloadSizeText.text = progress.TotalBytes > 0
                ? $"{progress.DownloadedBytes / 1048576f:F1} MB / {progress.TotalBytes / 1048576f:F1} MB"
                : string.Empty;
    }

    public void ShowFailure(string message, Action retry)
    {
        _retry = retry;
        if (statusText != null) statusText.text = retry != null ? "资源暂不可用，请联网后重试" : "启动未完成，请重新启动游戏";
        if (errorText != null) { errorText.text = message; errorText.gameObject.SetActive(true); }
        else if (downloadSizeText != null) downloadSizeText.text = message;
        if (retryButton != null) retryButton.gameObject.SetActive(retry != null);
        else
        {
            var box = MessageBox.Show();
            if (box != null)
            {
                box.SetTitle("启动未完成").SetContent(message);
                if (retry != null) box.AddButton("重试", _ => Retry());
                else box.AddButton("知道了");
            }
        }
    }

    private void Retry()
    {
        var action = _retry;
        _retry = null;
        if (retryButton != null) retryButton.gameObject.SetActive(false);
        action?.Invoke();
    }

    private void OnDestroy()
    {
        StopAllCoroutines();
        _retry = null;
        if (retryButton != null) retryButton.onClick.RemoveListener(Retry);
        if (video != null) video.Stop();
        if (atlasImages != null)
            foreach (var binding in atlasImages) if (binding.image != null) binding.image.sprite = null;
        foreach (var sprite in _sprites) if (sprite != null) Destroy(sprite);
        _sprites.Clear();
        _atlasHandle?.Release();
        _atlasHandle = null;
    }
}
