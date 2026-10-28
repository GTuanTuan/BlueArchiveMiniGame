using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

// Original UIRenderPass.RenderBloom, GameAssembly RVA 0xA060080.
// Shader globalgamemanagers.assets:62; settings:11586. See ../BloomNative evidence.
// The camera registry restricts this integration to explicitly opted-in preview cameras.
public sealed class BAOriginalUIBloomFeature : ScriptableRendererFeature
{
    [Serializable]
    public sealed class BloomSettings
    {
        public bool enable;
        [Min(0)] public float intensity;
        [Min(0)] public float threshold;
        [Range(0, 1)] public float softKnee;
        [Min(0)] public float clamp;
        [Range(1, 10)] public int diffusion;
        [Range(-1, 1)] public float anamorphicRatio;
        public Color color = Color.white;
    }

    public Shader originalBloomShader;
    public BloomSettings bloom = new BloomSettings();
    public bool parametersConfigured;
    [TextArea] public string configurationEvidence;
    [NonSerialized] public string lastStatus = "No enabled registered camera";
    [NonSerialized] public Vector4 lastThreshold;
    [NonSerialized] public Vector4 lastBloomSettings;
    [NonSerialized] public int lastMipCount;
    [NonSerialized] public int renderedFrameCount;
    [NonSerialized] public Camera lastRenderedCamera;

    private readonly Dictionary<Camera, BAResourceOriginalPostProcessCamera> cameras =
        new Dictionary<Camera, BAResourceOriginalPostProcessCamera>();
    private BloomPass pass;
    private Material bloomMaterial;
    private Mesh triangle;

    public override void Create()
    {
        if (pass != null) pass.Release();
        pass = new BloomPass(this);
    }

    public bool Register(BAResourceOriginalPostProcessCamera marker, Camera camera)
    {
        if (marker == null || camera == null || marker.ownerCharacterRoot == null) return false;
        BAResourceOriginalPostProcessCamera existing;
        if (cameras.TryGetValue(camera, out existing) && existing != null && existing != marker)
        {
            lastStatus = "Camera already has a different original Bloom marker";
            return false;
        }
        cameras[camera] = marker;
        return true;
    }

    public void Unregister(BAResourceOriginalPostProcessCamera marker, Camera camera)
    {
        BAResourceOriginalPostProcessCamera existing;
        if (!ReferenceEquals(camera, null) && cameras.TryGetValue(camera, out existing) && existing == marker)
            cameras.Remove(camera);
        if (cameras.Count == 0)
        {
            ReleaseResources();
            lastStatus = "No registered cameras; rendering resources released";
        }
    }

    private bool CameraEnabled(Camera camera)
    {
        BAResourceOriginalPostProcessCamera marker;
        return isActive && camera != null && cameras.TryGetValue(camera, out marker) &&
            marker != null && marker.feature == this && marker.CanRender(camera);
    }

    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
    {
        if (!CameraEnabled(renderingData.cameraData.camera)) return;
        if (!parametersConfigured || string.IsNullOrWhiteSpace(configurationEvidence) || bloom == null || !bloom.enable)
        { lastStatus = "Explicit source parameters are not configured or are disabled"; return; }
        if (!ValidNumbers())
        { lastStatus = "Invalid source Bloom parameters"; return; }
        var descriptor = renderingData.cameraData.cameraTargetDescriptor;
        if (SystemInfo.graphicsDeviceType != GraphicsDeviceType.Direct3D11 ||
            renderingData.cameraData.camera.stereoEnabled || descriptor.dimension != TextureDimension.Tex2D ||
            descriptor.volumeDepth != 1)
        { lastStatus = "Only D3D11 non-XR 2D cameras are supported by this integration"; return; }
        if (originalBloomShader == null || !originalBloomShader.isSupported ||
            (originalBloomShader.name != "Hidden/MXFinalBloom" && originalBloomShader.name != "BA/Reconstructed/Hidden/MXFinalBloom") || originalBloomShader.passCount != 5)
        { lastStatus = "Persistent original Hidden/MXFinalBloom five-pass shader is required"; return; }
        EnsureResources();
        renderer.EnqueuePass(pass);
    }

    private bool ValidNumbers()
    {
        return Finite(bloom.intensity) && Finite(bloom.threshold) && Finite(bloom.softKnee) &&
            Finite(bloom.clamp) && Finite(bloom.anamorphicRatio) && Finite(bloom.color.r) &&
            Finite(bloom.color.g) && Finite(bloom.color.b) && Finite(bloom.color.a) &&
            bloom.intensity >= 0 && bloom.threshold >= 0 && bloom.clamp >= 0 &&
            bloom.softKnee >= 0 && bloom.softKnee <= 1;
    }

    private static bool Finite(float value) { return !float.IsNaN(value) && !float.IsInfinity(value); }

    private void EnsureResources()
    {
        if (pass == null) pass = new BloomPass(this);
        if (bloomMaterial != null && bloomMaterial.shader != originalBloomShader)
        { CoreUtils.Destroy(bloomMaterial); bloomMaterial = null; }
        if (bloomMaterial == null)
            bloomMaterial = new Material(originalBloomShader)
            { name = "Original MX UI Bloom", hideFlags = HideFlags.HideAndDontSave };
        if (triangle == null)
        {
            triangle = new Mesh { name = "Original UIRenderPass Fullscreen Triangle", hideFlags = HideFlags.HideAndDontSave };
            triangle.vertices = new[] { new Vector3(-1, -1, 0), new Vector3(-1, 3, 0), new Vector3(3, -1, 0) };
            triangle.SetIndices(new[] { 0, 1, 2 }, MeshTopology.Triangles, 0, false);
            // Source has no UV stream: the compiled vertex shader derives UV from position.
            triangle.UploadMeshData(false);
        }
    }

    private void ReleaseResources()
    {
        if (pass != null) pass.Release();
        CoreUtils.Destroy(bloomMaterial); bloomMaterial = null;
        CoreUtils.Destroy(triangle); triangle = null;
    }
    private void OnDisable() { ReleaseResources(); }
    protected override void Dispose(bool disposing)
    {
        ReleaseResources();
        pass = null;
        // Keep explicit registrations if the renderer is rebuilt while scene markers stay enabled.
    }

    private sealed class BloomPass : ScriptableRenderPass
    {
        private static readonly int MainTex = Shader.PropertyToID("_MainTex");
        private static readonly int SampleScale = Shader.PropertyToID("_SampleScale");
        private static readonly int Threshold = Shader.PropertyToID("_Threshold");
        private static readonly int Params = Shader.PropertyToID("_Params");
        private static readonly int BloomTex = Shader.PropertyToID("_BloomTex");
        private static readonly int BloomSettingsId = Shader.PropertyToID("_Bloom_Settings");
        private static readonly int BloomColor = Shader.PropertyToID("_Bloom_Color");
        private static readonly int UVTransform = Shader.PropertyToID("_UVTransform");
        private readonly BAOriginalUIBloomFeature owner;
        private readonly RTHandle[] down = new RTHandle[16], up = new RTHandle[16];
        private readonly MaterialPropertyBlock bloomProperties = new MaterialPropertyBlock();
        private readonly MaterialPropertyBlock finalProperties = new MaterialPropertyBlock();
        private RTHandle sourceCopy;

        public BloomPass(BAOriginalUIBloomFeature owner)
        {
            this.owner = owner;
            // Original ctor writes 1000; current URP14 FinalBlit runs at 1001.
            renderPassEvent = RenderPassEvent.AfterRendering;
            ConfigureInput(ScriptableRenderPassInput.Color);
        }

        public override void Execute(ScriptableRenderContext context, ref RenderingData renderingData)
        {
            if (!owner.CameraEnabled(renderingData.cameraData.camera) || owner.bloomMaterial == null ||
                owner.triangle == null || owner.bloom == null || !owner.bloom.enable) return;
            var descriptor = renderingData.cameraData.cameraTargetDescriptor;
            if (descriptor.width < 2 || descriptor.height < 2) return;
            var settings = owner.bloom;
            float ratio = Mathf.Clamp(settings.anamorphicRatio, -1f, 1f);
            int width = Mathf.FloorToInt(descriptor.width / (2f - Mathf.Max(0f, -ratio)));
            int height = Mathf.FloorToInt(descriptor.height / (2f - Mathf.Max(0f, ratio)));
            float logs = (float)Math.Log(Mathf.Max(width, height), 2) + Mathf.Min(settings.diffusion, 10) - 10;
            int floorLogs = Mathf.FloorToInt(logs);
            int count = Mathf.Clamp(floorLogs, 1, 16);
            float sampleScale = 0.5f + logs - floorLogs;

            descriptor.depthBufferBits = 0; descriptor.msaaSamples = 1; descriptor.bindMS = false;
            descriptor.useMipMap = false; descriptor.autoGenerateMips = false;
            descriptor.enableRandomWrite = false; descriptor.memoryless = RenderTextureMemoryless.None;
            RenderingUtils.ReAllocateIfNeeded(ref sourceCopy, descriptor, FilterMode.Bilinear,
                TextureWrapMode.Clamp, name: "_BAOriginalUIBloomInput");
            // Native sourceFormat=9 (DefaultHDR), depth=0, sRGB=(activeColorSpace!=Gamma).
            var mipDescriptor = new RenderTextureDescriptor(width, height, RenderTextureFormat.DefaultHDR, 0);
            mipDescriptor.sRGB = QualitySettings.activeColorSpace != ColorSpace.Gamma;
            for (int i = 0; i < count; i++)
            {
                mipDescriptor.width = width; mipDescriptor.height = height;
                RenderingUtils.ReAllocateIfNeeded(ref down[i], mipDescriptor, FilterMode.Bilinear,
                    TextureWrapMode.Clamp, name: "_BAOriginalUIBloomDown" + i);
                if (i < count - 1)
                    RenderingUtils.ReAllocateIfNeeded(ref up[i], mipDescriptor, FilterMode.Bilinear,
                        TextureWrapMode.Clamp, name: "_BAOriginalUIBloomUp" + i);
                else Release(ref up[i]);
                width = Mathf.Max(width / 2, 1); height = Mathf.Max(height / 2, 1);
            }
            for (int i = count; i < 16; i++) { Release(ref down[i]); Release(ref up[i]); }

            float threshold = Mathf.GammaToLinearSpace(settings.threshold);
            float knee = threshold * settings.softKnee + 0.00001f;
            owner.lastThreshold = new Vector4(threshold, threshold - knee, knee * 2f, 0.25f / knee);
            owner.lastBloomSettings = new Vector4(sampleScale, Mathf.Exp(settings.intensity / 10f * 0.6931471805599453f) - 1f, 0, 0);
            bloomProperties.Clear();
            bloomProperties.SetFloat(SampleScale, sampleScale);
            bloomProperties.SetVector(Threshold, owner.lastThreshold);
            bloomProperties.SetVector(Params, new Vector4(Mathf.GammaToLinearSpace(settings.clamp), 0, 0, 0));
            finalProperties.Clear();
            finalProperties.SetVector(BloomSettingsId, owner.lastBloomSettings);
            finalProperties.SetColor(BloomColor, new Color(Mathf.GammaToLinearSpace(settings.color.r),
                Mathf.GammaToLinearSpace(settings.color.g), Mathf.GammaToLinearSpace(settings.color.b), settings.color.a));
            finalProperties.SetVector(UVTransform, SystemInfo.graphicsUVStartsAtTop
                ? new Vector4(1, -1, 0, 1) : new Vector4(1, 1, 0, 0));

            var cameraColor = renderingData.cameraData.renderer.cameraColorTargetHandle;
            var cmd = CommandBufferPool.Get("Original UIRenderPass Bloom");
            try
            {
                // Original Execute first preblits full camera color to its UI target. This preview
                // has no additional UI draws here; copying also prevents final source/dest aliasing.
                cmd.Blit(cameraColor.nameID, sourceCopy.nameID);
                RTHandle last = sourceCopy;
                for (int i = 0; i < count; i++)
                {
                    Draw(cmd, last.nameID, down[i].nameID, i == 0 ? 1 : 2, bloomProperties);
                    last = down[i];
                }
                for (int i = count - 2; i >= 0; i--)
                {
                    // Original binds the high-resolution mip to _BloomTex and low to _MainTex.
                    cmd.SetGlobalTexture(BloomTex, down[i].nameID);
                    Draw(cmd, last.nameID, up[i].nameID, 3, bloomProperties);
                    last = up[i];
                }
                cmd.SetGlobalTexture(BloomTex, last.nameID);
                Draw(cmd, sourceCopy.nameID, cameraColor.nameID, 4, finalProperties);
                cmd.SetGlobalTexture(MainTex, Texture2D.blackTexture);
                cmd.SetGlobalTexture(BloomTex, Texture2D.blackTexture);
                context.ExecuteCommandBuffer(cmd);
                owner.lastMipCount = count;
                owner.renderedFrameCount++;
                owner.lastRenderedCamera = renderingData.cameraData.camera;
                owner.lastStatus = "Rendered original UI Bloom on explicitly registered camera";
            }
            finally { CommandBufferPool.Release(cmd); }
        }

        private void Draw(CommandBuffer cmd, RenderTargetIdentifier source, RenderTargetIdentifier destination,
            int shaderPass, MaterialPropertyBlock properties)
        {
            cmd.SetGlobalTexture(MainTex, source);
            cmd.SetRenderTarget(destination);
            cmd.DrawMesh(owner.triangle, Matrix4x4.identity, owner.bloomMaterial, 0, shaderPass, properties);
        }

        private static void Release(ref RTHandle handle)
        { if (handle != null) handle.Release(); handle = null; }
        public void Release()
        {
            for (int i = 0; i < 16; i++) { Release(ref down[i]); Release(ref up[i]); }
            Release(ref sourceCopy);
            bloomProperties.Clear(); finalProperties.Clear();
        }
    }
}
