using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using Object = UnityEngine.Object;

namespace BA.UI.Tests
{
    public sealed class UIManagerLifecycleTests
    {
        private UIManager _manager;
        private FakeLoader _loader;
        private GameObject _container;
        private GameObject _prefab;

        [SetUp]
        public void SetUp()
        {
            // An independent manager does not touch the game's singleton or its canvas.
            _manager = new UIManager();
            _loader = new FakeLoader();
            _container = new GameObject("UI test container", typeof(RectTransform));
            _prefab = new GameObject("UI test template", typeof(RectTransform));
            _prefab.AddComponent<UIProbeWindow>();
            _manager.Init(_container.transform, _loader);
        }

        [UnityTearDown]
        public IEnumerator TearDown()
        {
            _manager.Shutdown();
            Object.Destroy(_container);
            Object.Destroy(_prefab);
            // Destroy runs after Update; the observer releases leases in a later LateUpdate.
            yield return null;
            yield return null;
        }

        [Test]
        public void RepeatedShowSharesOneRequestAndOneWindow()
        {
            UIProbeWindow first = null;
            UIProbeWindow second = null;
            _manager.ShowWindow<UIProbeWindow>("Repeated", window => first = window);
            _manager.ShowWindow<UIProbeWindow>("Repeated", window => second = window);
            Assert.That(_loader.Requests.Count, Is.EqualTo(1));

            _loader.Requests[0].Succeed(_prefab);

            Assert.That(first, Is.Not.Null);
            Assert.That(second, Is.SameAs(first));
            Assert.That(first.InitializeCount, Is.EqualTo(1));
            Assert.That(first.ShowCount, Is.EqualTo(1));
            int laterCallbackCount = 0;
            _manager.ShowWindow<UIProbeWindow>("Repeated", _ => laterCallbackCount++);
            Assert.That(laterCallbackCount, Is.EqualTo(1));
            Assert.That(first.ShowCount, Is.EqualTo(1), "Showing a visible window must not reenter OnShow.");
            Assert.That(_loader.Requests[0].ReleaseCount, Is.Zero);
        }

        [Test]
        public void HideBeforeCompletionDoesNotActivateOrInvokeObsoleteCallbacks()
        {
            int obsoleteCallbacks = 0;
            _manager.ShowWindow<UIProbeWindow>("Hidden", _ => obsoleteCallbacks++);
            _manager.HideWindow("Hidden");
            _loader.Requests[0].Succeed(_prefab);

            var hidden = _container.GetComponentInChildren<UIProbeWindow>(true);
            Assert.That(hidden, Is.Not.Null);
            Assert.That(hidden.gameObject.activeInHierarchy, Is.False);
            Assert.That(hidden.EnableCount, Is.Zero, "The active prefab must not briefly enable during instantiation.");
            Assert.That(hidden.ShowCount, Is.Zero);
            Assert.That(obsoleteCallbacks, Is.Zero);
            Assert.That(_manager.GetState("Hidden"), Is.EqualTo(UIWindowState.Hidden));

            UIProbeWindow reopened = null;
            _manager.ShowWindow<UIProbeWindow>("Hidden", window => reopened = window);
            Assert.That(reopened, Is.SameAs(hidden));
            Assert.That(_loader.Requests.Count, Is.EqualTo(1));
            Assert.That(hidden.EnableCount, Is.EqualTo(1));
            Assert.That(hidden.ShowCount, Is.EqualTo(1));
        }

        [Test]
        public void ClearedRequestCannotRemoveTheNewRequestForTheSameAddress()
        {
            int oldCallbacks = 0;
            _manager.ShowWindow<UIProbeWindow>("Replaced", _ => oldCallbacks++);
            var old = _loader.Requests[0];
            var queuedCompletion = old.CaptureCompletion();
            _manager.Clear();
            Assert.That(old.ReleaseCount, Is.EqualTo(1));

            UIProbeWindow replacement = null;
            _manager.ShowWindow<UIProbeWindow>("Replaced", window => replacement = window);
            var current = _loader.Requests[1];
            // Models a completion already queued before unsubscription/cancellation.
            old.DeliverCapturedCompletion(_prefab, queuedCompletion);

            Assert.That(oldCallbacks, Is.Zero);
            Assert.That(_manager.GetState("Replaced"), Is.EqualTo(UIWindowState.Loading));
            Assert.That(current.ReleaseCount, Is.Zero);
            current.Succeed(_prefab);
            Assert.That(replacement, Is.Not.Null);
            Assert.That(_manager.CheckShow("Replaced"), Is.True);
            Assert.That(old.ReleaseCount, Is.EqualTo(1), "Repeated cleanup must release a request only once.");
        }

        [Test]
        public void FailedLoadIsReleasedAndCanBeRetried()
        {
            int failures = 0;
            _manager.WindowLoadFailed += (address, error) =>
            {
                Assert.That(address, Is.EqualTo("Retry"));
                StringAssert.Contains("fixture unavailable", error);
                failures++;
            };
            _manager.ShowWindow<UIProbeWindow>("Retry");
            LogAssert.Expect(LogType.Error, new Regex("UI 'Retry':.*fixture unavailable"));
            _loader.Requests[0].Fail("fixture unavailable");

            Assert.That(failures, Is.EqualTo(1));
            Assert.That(_loader.Requests[0].ReleaseCount, Is.EqualTo(1));
            Assert.That(_manager.GetState("Retry"), Is.EqualTo(UIWindowState.None));
            UIProbeWindow recovered = null;
            _manager.ShowWindow<UIProbeWindow>("Retry", window => recovered = window);
            _loader.Requests[1].Succeed(_prefab);
            Assert.That(recovered, Is.Not.Null);
            Assert.That(_manager.CheckShow("Retry"), Is.True);
        }

        [UnityTest]
        public IEnumerator DestroyKeepsPrefabLeaseUntilTheInstanceIsActuallyDestroyed()
        {
            UIProbeWindow window = null;
            _manager.ShowWindow<UIProbeWindow>("Lifetime", loaded => window = loaded);
            var request = _loader.Requests[0];
            request.Succeed(_prefab);
            _manager.DestroyWindow("Lifetime");

            Assert.That(_manager.GetState("Lifetime"), Is.EqualTo(UIWindowState.None));
            Assert.That(window != null, Is.True, "Destroy is deferred to the end of the frame.");
            Assert.That(request.ReleaseCount, Is.Zero, "A live instance still needs its prefab resources.");

            for (int frame = 0; frame < 3 && request.ReleaseCount == 0; frame++)
                yield return null;
            Assert.That(window == null, Is.True);
            Assert.That(request.ReleaseCount, Is.EqualTo(1));
        }

        [TestCase(false)]
        [TestCase(true)]
        public void CallbackMayHideOrClearWithoutRunningStaleCallbacks(bool clear)
        {
            int obsoleteCallbacks = 0;
            UIProbeWindow shown = null;
            _manager.ShowWindow<UIProbeWindow>("Reentrant", window =>
            {
                shown = window;
                if (clear) _manager.Clear();
                else _manager.HideWindow("Reentrant");
            });
            _manager.ShowWindow<UIProbeWindow>("Reentrant", _ => obsoleteCallbacks++);
            _loader.Requests[0].Succeed(_prefab);

            Assert.That(shown, Is.Not.Null);
            Assert.That(shown.HideCount, Is.EqualTo(1));
            Assert.That(obsoleteCallbacks, Is.Zero);
            Assert.That(_manager.GetState("Reentrant"), Is.EqualTo(clear ? UIWindowState.None : UIWindowState.Hidden));
        }

        [Test]
        public void AlreadyCompletedRequestDeliversExactlyOnce()
        {
            _loader.ImmediatePrefab = _prefab;
            int callbacks = 0;
            _manager.ShowWindow<UIProbeWindow>("Cached", _ => callbacks++);
            Assert.That(callbacks, Is.EqualTo(1));
            Assert.That(_manager.GetState("Cached"), Is.EqualTo(UIWindowState.Visible));
            Assert.That(_loader.Requests.Count, Is.EqualTo(1));
        }

        private sealed class FakeLoader : IUIAssetLoader
        {
            public readonly List<FakeRequest> Requests = new List<FakeRequest>();
            public GameObject ImmediatePrefab;

            public IUIAssetRequest LoadPrefab(string address)
            {
                var request = new FakeRequest();
                Requests.Add(request);
                if (ImmediatePrefab != null) request.Succeed(ImmediatePrefab);
                return request;
            }
        }

        private sealed class FakeRequest : IUIAssetRequest
        {
            private bool _released;
            public bool IsDone { get; private set; }
            public GameObject Prefab { get; private set; }
            public string Error { get; private set; }
            public int ReleaseCount { get; private set; }
            public event Action<IUIAssetRequest> Completed;

            public Action<IUIAssetRequest> CaptureCompletion() => Completed;

            public void Succeed(GameObject prefab)
            {
                Prefab = prefab;
                IsDone = true;
                Completed?.Invoke(this);
            }

            public void Fail(string error)
            {
                Error = error;
                IsDone = true;
                Completed?.Invoke(this);
            }

            public void DeliverCapturedCompletion(GameObject prefab, Action<IUIAssetRequest> callback)
            {
                Prefab = prefab;
                IsDone = true;
                callback?.Invoke(this);
            }

            public void Dispose()
            {
                if (_released) return;
                _released = true;
                ReleaseCount++;
                Completed = null;
            }
        }
    }
}
