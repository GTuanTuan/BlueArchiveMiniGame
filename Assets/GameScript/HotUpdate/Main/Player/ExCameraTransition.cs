using Cinemachine;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using UnityEngine.Timeline;

namespace SimpleCharacterTrial
{
    // 原版擦屏需要一张入场/退场截图。这部分只处理相机，不处理技能。
    [DefaultExecutionOrder(1100)]
    public class ExCameraTransition : MonoBehaviour
    {
        [System.Serializable]
        public struct CameraView
        {
            public LayerMask visibleLayers, volumeLayers;
            public CameraClearFlags clearFlags;
            public Color background;
            public bool postProcessing;
            public static CameraView Read(Camera camera)
            {
                var data = camera.GetComponent<UniversalAdditionalCameraData>();
                return new CameraView { visibleLayers = camera.cullingMask, volumeLayers = data.volumeLayerMask,
                    clearFlags = camera.clearFlags, background = camera.backgroundColor, postProcessing = data.renderPostProcessing };
            }
            public void Apply(Camera camera)
            {
                var data = camera.GetComponent<UniversalAdditionalCameraData>();
                camera.cullingMask = visibleLayers;
                data.volumeLayerMask = volumeLayers;
                camera.clearFlags = clearFlags;
                camera.backgroundColor = background;
                data.renderPostProcessing = postProcessing;
            }
        }
        public Camera gameplayCamera, transitionCamera;
        public Camera[] overlays;
        public CameraView gameplayView;
        public Animator settingsAnimator;
        // 由角色自己的 Timeline 曲线控制；不再让 Timeline 绑定场景对象。
        public Color background;
        public bool postProcessing, battleLightVisible;
        public Renderer transitionScreen;
        public Transform transitionScale, exStage;
        public PlayableDirector director;
        // Filled once by the editor migration. Times are seconds in ascending order.
        public CinemachineTrack[] cutinCameraTracks = System.Array.Empty<CinemachineTrack>();
        public float[] cutinCameraEndTimes = System.Array.Empty<float>();
        public float lastCutinFrame;
        public CameraView exView;
        public bool IsSampling { get; private set; }
        public bool IsInCutscene => active;
        CameraView savedView;
        Light gameplayLight;
        bool savedLight;
        RenderTexture capture;
        bool active, returning;
        double lastExTime;
        Vector3 lastExPosition;
        Quaternion lastExRotation;
        float lastExFieldOfView;
        // Staging: the feature is explicitly authored; never find or modify a renderer at runtime.
        public BAOriginalUIBloomFeature originalBloomFeature;
        public GameObject originalBloomOwnerRoot;
        public Volume[] originalBloomVolumes = System.Array.Empty<Volume>();
        public BAResourceOriginalPostProcessCamera originalBloomMarker;
        bool originalBloomPhase;
        readonly System.Collections.Generic.List<VolumeProfileSwap> originalBloomProfiles =
            new System.Collections.Generic.List<VolumeProfileSwap>();
        static readonly System.Collections.Generic.Stack<NativePointRimFrame> nativePointRimFrames =
            new System.Collections.Generic.Stack<NativePointRimFrame>();
        static readonly int nativePointRimColorId = Shader.PropertyToID("_MxOutlineRimLightColor");
        static readonly int nativePointRimPositionId = Shader.PropertyToID("_MxOutRimLightPosRange");
        static readonly int nativePointRimDirectionId = Shader.PropertyToID("_MxOutRimLightDir");
        static readonly int nativePointRimSpotId = Shader.PropertyToID("_MxOutlineRimLightSpotAngle");
        const string nativePointRimKeyword = "OUTLINE_RIM_LIGHT_POINT";
        const string nativeSpotRimKeyword = "OUTLINE_RIM_LIGHT_SPOT";
        public Light[] rimLights = new Light[0];
        // Battle camera source is explicit. The brain supplies a fresh base pose
        // before each shake; an authored independent transform can replace it.
        public Transform unshakenGameplayCameraPose;
        CinemachineBrain shakeBrain;
        Transform shakeCamera;
        readonly System.Collections.Generic.List<ShakeRun> shakes = new System.Collections.Generic.List<ShakeRun>();
        Vector3 shakeRange, angleRange;
        bool shakeApplied;

        sealed class ShakeRun
        {
            public CharacterShakeData data;
            public GameObject owner;
            public float elapsed;
            public int sampleFrame = -1;
        }

        public void PlayShake(CharacterShakeData data, GameObject effectRoot)
        {
            if (data == null || !effectRoot || !gameplayCamera) return;
            if (!shakeCamera)
            {
                shakeCamera = gameplayCamera.transform;
                shakeBrain = gameplayCamera.GetComponent<CinemachineBrain>();
            }
            if (!shakeBrain && !unshakenGameplayCameraPose)
            {
                Debug.LogError("Camera shake needs a CinemachineBrain or an authored unshaken pose.", this);
                return;
            }
            shakes.Add(new ShakeRun { data = data, owner = effectRoot, elapsed = -data.startDelay });
        }

        public void CancelShake(GameObject effectRoot)
        {
            if (effectRoot) shakes.RemoveAll(run => run.owner == effectRoot);
        }

        void Update()
        {
            foreach (var run in shakes)
            {
                if (!run.owner || !run.owner.activeInHierarchy) continue;
                run.elapsed += Time.deltaTime;
                int frame = (int)System.Math.Round((double)(run.elapsed * 60f), System.MidpointRounding.ToEven);
                if (run.elapsed < 0f || run.elapsed > run.data.duration || frame == run.sampleFrame) continue;
                run.sampleFrame = frame;
                float amount = run.data.curve.Evaluate(run.elapsed / run.data.duration);
                shakeRange = Vector3.Max(shakeRange, run.data.intensity * amount);
                angleRange = Vector3.Max(angleRange, run.data.yawPitchRoll * amount);
                shakeApplied = false;
            }
        }

        void ApplyShakes()
        {
            if (active) { shakeRange = angleRange = Vector3.zero; shakeApplied = false; return; }
            bool eligible = false;
            foreach (var run in shakes)
                if (run.owner && run.owner.activeInHierarchy && run.elapsed >= 0f && run.elapsed <= run.data.duration)
                { eligible = true; break; }
            if (eligible && shakeCamera)
            {
                if (shakeBrain && shakeBrain.isActiveAndEnabled)
                {
                    var state = shakeBrain.CurrentCameraState;
                    shakeCamera.SetPositionAndRotation(state.FinalPosition, state.FinalOrientation);
                }
                else if (unshakenGameplayCameraPose && unshakenGameplayCameraPose != shakeCamera)
                    shakeCamera.SetPositionAndRotation(unshakenGameplayCameraPose.position, unshakenGameplayCameraPose.rotation);
                else return;
                if (!shakeApplied)
                {
                    shakeCamera.localPosition += new Vector3(Random.Range(-shakeRange.x, shakeRange.x),
                        Random.Range(-shakeRange.y, shakeRange.y), Random.Range(-shakeRange.z, shakeRange.z));
                    shakeCamera.localRotation *= Quaternion.Euler(Random.Range(-angleRange.x, angleRange.x),
                        Random.Range(-angleRange.y, angleRange.y), Random.Range(-angleRange.z, angleRange.z));
                    shakeRange = angleRange = Vector3.zero;
                    shakeApplied = true;
                }
            }
            shakes.RemoveAll(run => !run.owner || run.elapsed > run.data.duration);
        }

        sealed class NativePointRimFrame
        {
            public Camera camera;
            public ExCameraTransition owner;
            public Vector4 color, position, direction, spot;
            public bool pointKeyword, spotKeyword;

            public static NativePointRimFrame Read(Camera camera) => new NativePointRimFrame {
                camera = camera,
                color = Shader.GetGlobalVector(nativePointRimColorId),
                position = Shader.GetGlobalVector(nativePointRimPositionId),
                direction = Shader.GetGlobalVector(nativePointRimDirectionId),
                spot = Shader.GetGlobalVector(nativePointRimSpotId),
                pointKeyword = Shader.IsKeywordEnabled(nativePointRimKeyword),
                spotKeyword = Shader.IsKeywordEnabled(nativeSpotRimKeyword)
            };

            public void Restore()
            {
                Shader.SetGlobalVector(nativePointRimColorId, color);
                Shader.SetGlobalVector(nativePointRimPositionId, position);
                Shader.SetGlobalVector(nativePointRimDirectionId, direction);
                Shader.SetGlobalVector(nativePointRimSpotId, spot);
                if (pointKeyword) Shader.EnableKeyword(nativePointRimKeyword);
                else Shader.DisableKeyword(nativePointRimKeyword);
                if (spotKeyword) Shader.EnableKeyword(nativeSpotRimKeyword);
                else Shader.DisableKeyword(nativeSpotRimKeyword);
            }
        }

        // 只在过场期间接管当前角色与当前主相机的全局描边状态。
        void BeginNativePointRimRendering()
        {
            RenderPipelineManager.beginCameraRendering -= BeginNativePointRimCamera;
            RenderPipelineManager.endCameraRendering -= EndNativePointRimCamera;
            RenderPipelineManager.beginCameraRendering += BeginNativePointRimCamera;
            RenderPipelineManager.endCameraRendering += EndNativePointRimCamera;
        }

        void EndNativePointRimRendering()
        {
            bool ownsFrame = false;
            foreach (var frame in nativePointRimFrames)
                if (frame.owner == this) { ownsFrame = true; break; }
            if (ownsFrame)
                while (nativePointRimFrames.Count > 0) nativePointRimFrames.Pop().Restore();

            RenderPipelineManager.beginCameraRendering -= BeginNativePointRimCamera;
            RenderPipelineManager.endCameraRendering -= EndNativePointRimCamera;
        }

        void BeginNativePointRimCamera(ScriptableRenderContext context, Camera camera)
        {
            bool scopedCamera = active && gameplayCamera == camera;
            if (!scopedCamera && nativePointRimFrames.Count == 0) return;

            var frame = NativePointRimFrame.Read(camera);
            frame.owner = scopedCamera ? this : null;
            if (nativePointRimFrames.Count > 0)
            {
                NativePointRimFrame baseline = null;
                foreach (var outer in nativePointRimFrames) baseline = outer;
                baseline.Restore();
            }
            nativePointRimFrames.Push(frame);
            try
            {
                if (!scopedCamera) return;
                Light selected = null;
                foreach (var storage in rimLights)
                {
                    if (!storage || !storage.gameObject.activeInHierarchy) continue;
                    selected = storage;
                    break;
                }
                if (!selected)
                {
                    Shader.DisableKeyword(nativePointRimKeyword);
                    Shader.DisableKeyword(nativeSpotRimKeyword);
                    Shader.SetGlobalColor(nativePointRimColorId, Color.black);
                    Shader.SetGlobalVector(nativePointRimPositionId, Vector4.zero);
                    Shader.SetGlobalVector(nativePointRimDirectionId, Vector4.zero);
                    Shader.SetGlobalVector(nativePointRimSpotId, Vector4.zero);
                    return;
                }

                // 原版先将颜色乘强度，再写入全局值；这里不额外转换色彩空间。
                Color color = selected.color;
                float intensity = selected.intensity;
                Shader.EnableKeyword(nativePointRimKeyword);
                Shader.DisableKeyword(nativeSpotRimKeyword);
                Shader.SetGlobalColor(nativePointRimColorId,
                    new Color(color.r * intensity, color.g * intensity, color.b * intensity, color.a));
                Vector3 position = selected.transform.position;
                Shader.SetGlobalVector(nativePointRimPositionId,
                    new Vector4(position.x, position.y, position.z, selected.range));
                // 原版点光写入不修改未使用的方向和聚光角全局值。
            }
            catch
            {
                nativePointRimFrames.Pop().Restore();
                throw;
            }
        }

        void EndNativePointRimCamera(ScriptableRenderContext context, Camera camera)
        {
            if (nativePointRimFrames.Count == 0) return;
            if (nativePointRimFrames.Peek().camera != camera)
            {
                while (nativePointRimFrames.Count > 0) nativePointRimFrames.Pop().Restore();
                return;
            }
            nativePointRimFrames.Pop().Restore();
        }

        struct VolumeProfileSwap
        {
            public Volume volume;
            public VolumeProfile authored, temporary;
            public bool hadInstantiatedProfile;
        }

        void BeginOriginalBloom()
        {
            if (!originalBloomFeature || originalBloomPhase) return;
            if (!originalBloomOwnerRoot)
                throw new System.InvalidOperationException("Original EX Bloom requires an explicit character prefab root.");
            originalBloomPhase = true;
            try
            {
                // Only this character's native Bloom is replaced. Preserve chromatic aberration,
                // camera post-processing curves, all shared assets, and other characters' profiles.
                foreach (var volume in originalBloomVolumes)
                {
                    bool hadInstance = volume.HasInstantiatedProfile();
                    var authored = hadInstance ? volume.profile : volume.sharedProfile;
                    if (!authored || !authored.TryGet<Bloom>(out var bloom)) continue;
                    var temporary = ScriptableObject.CreateInstance<VolumeProfile>();
                    temporary.hideFlags = HideFlags.HideAndDontSave;
                    foreach (var component in authored.components)
                    {
                        var copy = Instantiate(component);
                        copy.hideFlags = HideFlags.HideAndDontSave;
                        if (copy is Bloom) copy.active = false;
                        temporary.components.Add(copy);
                    }
                    originalBloomProfiles.Add(new VolumeProfileSwap {
                        volume = volume, authored = authored, temporary = temporary,
                        hadInstantiatedProfile = hadInstance });
                    volume.profile = temporary;
                }
                originalBloomMarker.feature = originalBloomFeature;
                originalBloomMarker.ownerCharacterRoot = originalBloomOwnerRoot;
                originalBloomMarker.enableEffect = true;
                UpdateOriginalBloomCamera();
            }
            catch
            {
                EndOriginalBloom();
                throw;
            }
        }

        void UpdateOriginalBloomCamera()
        {
            if (!originalBloomPhase || !originalBloomMarker || !originalBloomMarker.isActiveAndEnabled || !gameplayCamera) return;
            // The last enabled overlay receives the fully composed color, including the wipe.
            // Exactly one marker belongs to the character; shared MainCamera gets no component.
            var finalCamera = gameplayCamera;
            var data = gameplayCamera.GetComponent<UniversalAdditionalCameraData>();
            foreach (var overlay in data.cameraStack)
                if (overlay && overlay.isActiveAndEnabled) finalCamera = overlay;
            if (originalBloomMarker.targetCamera == finalCamera && originalBloomMarker.registered) return;
            originalBloomMarker.ReleaseRegistration();
            originalBloomMarker.targetCamera = finalCamera;
            originalBloomMarker.RefreshRegistration();
            if (!originalBloomMarker.registered)
                Debug.LogError("Original EX Bloom camera already has another owner: " + finalCamera.name, this);
        }

        void EndOriginalBloom()
        {
            if (originalBloomMarker)
            {
                // 回到战场仍使用原版辉光；角色卸载时由 Marker 自己解除绑定。
                originalBloomMarker.enableEffect = true;
                originalBloomMarker.targetCamera = gameplayCamera;
                originalBloomMarker.RefreshRegistration();
            }
            foreach (var item in originalBloomProfiles)
            {
                if (item.volume && item.volume.HasInstantiatedProfile() && item.volume.profile == item.temporary)
                    item.volume.profile = item.hadInstantiatedProfile ? item.authored : null;
                if (item.temporary)
                {
                    foreach (var component in item.temporary.components)
                        if (component) Destroy(component);
                    item.temporary.components.Clear();
                    Destroy(item.temporary);
                }
            }
            originalBloomProfiles.Clear();
            originalBloomPhase = false;
        }


        public void Bind(Camera camera, Light light, GameObject ownerRoot = null)
        {
            if (ownerRoot) originalBloomOwnerRoot = ownerRoot;
            gameplayCamera = camera;
            gameplayLight = light;
            shakeCamera = camera.transform;
            shakeBrain = camera.GetComponent<CinemachineBrain>();
            gameplayView.Apply(camera);
            var stack = camera.GetComponent<UniversalAdditionalCameraData>().cameraStack;
            foreach (var overlay in overlays)
                if (overlay && !stack.Contains(overlay)) stack.Add(overlay);
            // Cinemachine 官方轨道唯一需要连接的是场景的 Brain。
            foreach (var track in cutinCameraTracks)
                director.SetGenericBinding(track, shakeBrain);
        }

        public void Begin()
        {
            savedView = CameraView.Read(gameplayCamera);
            savedLight = gameplayLight && gameplayLight.gameObject.activeSelf;
            exStage.SetPositionAndRotation(Vector3.zero, Quaternion.identity);
            Capture();
            exView.Apply(gameplayCamera);
            background = exView.background;
            postProcessing = exView.postProcessing;
            battleLightVisible = false;
            active = true;
            returning = false;
            lastExTime = 0;
            BeginOriginalBloom();
            BeginNativePointRimRendering();
            ApplySettings();
        }
        public void ReturnToBattle() => returning = active;
        void LateUpdate()
        {
            if (!active) { if (returning) UpdateOriginalBloomCamera(); ApplyShakes(); return; }
            if (!returning)
            {
                ApplySettings();
                lastExTime = director.time;
                lastExPosition = gameplayCamera.transform.position;
                lastExRotation = gameplayCamera.transform.rotation;
                lastExFieldOfView = gameplayCamera.fieldOfView;
                ApplyShakes();
                return;
            }
            SampleExitFrame(); ApplyShakes();
        }
        void ApplySettings()
        {
            UpdateOriginalBloomCamera();
            gameplayCamera.backgroundColor = background;
            gameplayCamera.GetComponent<UniversalAdditionalCameraData>().renderPostProcessing = postProcessing;
            if (gameplayLight) gameplayLight.gameObject.SetActive(savedLight && battleLightVisible);
        }
        public void SampleExitFrame()
        {
            if (!active) return;
            // 恢复最后有效过场帧截图，避免截到已经关灯的画面。
            double time = director.time;
            var brain = shakeBrain;
            // 尚在过场内时直接截当前画面；回采 Timeline 会重置粒子背景。
            bool samplePreviousFrame = lastCutinFrame <= 0 || time >= lastCutinFrame;
            IsSampling = true;
            try
            {
                if (samplePreviousFrame)
                {
                    // 过场相机激活区间结束后角色可能已隐藏；截图要取区间内最后一帧。
                    double captureTime = lastExTime, cameraEnd = -1;
                    foreach (float end in cutinCameraEndTimes)
                        if (end <= lastExTime && end > cameraEnd) cameraEnd = end;
                    if (cameraEnd < 0 && lastCutinFrame > 0 && lastCutinFrame <= lastExTime)
                        cameraEnd = lastCutinFrame;
                    if (cameraEnd >= 0) captureTime = cameraEnd - 0.0001;
                    director.time = captureTime;
                    director.Evaluate();
                    director.Evaluate();
                    ApplySettings();
                    // 复用最后有效镜头，避免回采时原生约束尚未更新。
                    gameplayCamera.transform.SetPositionAndRotation(lastExPosition, lastExRotation);
                    gameplayCamera.fieldOfView = lastExFieldOfView;
                }
                Capture();
            }
            finally
            {
                if (samplePreviousFrame)
                {
                    director.time = time;
                    director.Evaluate();
                    director.Evaluate();
                }
                IsSampling = false;
            }
            savedView.Apply(gameplayCamera);
            if (gameplayLight) gameplayLight.gameObject.SetActive(savedLight);
            gameplayCamera.GetComponent<UniversalAdditionalCameraData>().renderPostProcessing = false;
            brain.ManualUpdate();
            active = false;
            EndNativePointRimRendering();
        }
        public void Restore()
        {
            if (active || returning) savedView.Apply(gameplayCamera);
            if ((active || returning) && gameplayLight) gameplayLight.gameObject.SetActive(savedLight);
            active = returning = false;
            EndOriginalBloom();
            EndNativePointRimRendering();
        }
        void Capture()
        {
            int width = Mathf.Max(1, gameplayCamera.pixelWidth), height = Mathf.Max(1, gameplayCamera.pixelHeight);
            if (!capture || capture.width != width || capture.height != height)
            {
                if (capture) { capture.Release(); Destroy(capture); }
                capture = new RenderTexture(width, height, 0, RenderTextureFormat.DefaultHDR);
                capture.Create();
            }
            var data = gameplayCamera.GetComponent<UniversalAdditionalCameraData>();
            bool post = data.renderPostProcessing, overlay = transitionCamera.enabled;
            // Original capture excludes Bloom. Stock Bloom is already disabled by profile scope.
            bool resumeOriginalBloom = originalBloomPhase && originalBloomMarker && originalBloomMarker.registered;
            if (resumeOriginalBloom) originalBloomMarker.ReleaseRegistration();
            try
            {
                data.renderPostProcessing = false;
                transitionCamera.enabled = false;
                RenderPipeline.SubmitRenderRequest(gameplayCamera,
                    new RenderPipeline.StandardRequest { destination = capture });
            }
            finally
            {
                data.renderPostProcessing = post;
                transitionCamera.enabled = overlay;
                if (resumeOriginalBloom) UpdateOriginalBloomCamera();
            }
            var block = new MaterialPropertyBlock();
            transitionScreen.GetPropertyBlock(block);
            block.SetTexture("_MainTex", capture);
            transitionScreen.SetPropertyBlock(block);
            transitionCamera.nearClipPlane = .00001f;
            transitionCamera.aspect = (float)width / height;
            float h = 2 * transitionScale.localPosition.magnitude * Mathf.Tan(transitionCamera.fieldOfView * .5f * Mathf.Deg2Rad);
            transitionScale.localScale = new Vector3(h * transitionCamera.aspect, h, 1);
        }
        public void Unbind()
        {
            Restore();
            if (gameplayCamera)
                foreach (var overlay in overlays)
                    gameplayCamera.GetComponent<UniversalAdditionalCameraData>().cameraStack.Remove(overlay);
        }
        void OnDisable()
        {
            shakes.Clear();
            shakeRange = angleRange = Vector3.zero;
            shakeApplied = false;
            Unbind();
            if (capture) { capture.Release(); Destroy(capture); capture = null; }
        }
    }
}
