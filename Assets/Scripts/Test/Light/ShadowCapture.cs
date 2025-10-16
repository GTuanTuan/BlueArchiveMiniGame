// ShadowCapture.cs
using UnityEngine;
using UnityEngine.Rendering;

public class ShadowCapture : MonoBehaviour
{
    public Light mainLight;
    public Camera shadowCamera;
    public RenderTexture shadowTexture;

    private CommandBuffer commandBuffer;

    void Start()
    {
        commandBuffer = new CommandBuffer();
        commandBuffer.name = "Shadow Capture";

        //// 创建Render Texture
        //shadowTexture = new RenderTexture(1024, 1024, 0, RenderTextureFormat.ARGB32);
        //shadowTexture.name = "Shadow Map";

        // 设置Command Buffer
        commandBuffer.SetRenderTarget(shadowTexture);
        commandBuffer.ClearRenderTarget(true, true, Color.clear);

        // 只渲染特定层的物体
        commandBuffer.SetGlobalColor("_ShadowColor", Color.black);

        // 添加到相机
        shadowCamera.AddCommandBuffer(CameraEvent.BeforeForwardOpaque, commandBuffer);
    }

    void Update()
    {
        // 更新阴影纹理到Shader
        Shader.SetGlobalTexture("_CustomShadowMap", shadowTexture);
    }

    void OnDestroy()
    {
        if (commandBuffer != null)
        {
            shadowCamera.RemoveCommandBuffer(CameraEvent.BeforeForwardOpaque, commandBuffer);
            commandBuffer.Dispose();
        }
    }
}