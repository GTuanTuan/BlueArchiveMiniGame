using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using NUnit.Framework;
using UnityEngine.TestTools;
using YooAsset;

namespace BA.Bootstrap.Tests
{
    /// <summary>
    /// Exercises the actual YooAsset sandbox, HTTP downloader, manifest parser and disk cache.
    /// Only fixture serialization and the EditMode scheduler use reflection; no download outcome is mocked.
    /// Fixture reflection intentionally targets the project's pinned YooAsset 3.0.6 format.
    /// </summary>
    [TestFixture]
    public sealed class PackageUpdaterIntegrationTests
    {
        private string _root;
        private string _packageName;
        private string _cacheRoot;
        private string _recordsRoot;
        private LocalVersionStore _versions;
        private LoopbackPackageServer _server;
        private PackageUpdater _updater;
        private object _previousLogger;
        private bool _ownsYooAssets;
        private static readonly Assembly YooAssembly = typeof(YooAssets).Assembly;
        private static readonly MethodInfo UpdateYoo = typeof(YooAssets).GetMethod("Update", BindingFlags.Static | BindingFlags.NonPublic);

        [SetUp]
        public void SetUp()
        {
            if (YooAssets.IsInitialized)
                Assert.Ignore("Run these EditMode tests with the game stopped and no live YooAsset packages.");

            _root = Path.Combine(Path.GetTempPath(), "BA.PackageUpdater.Tests", Guid.NewGuid().ToString("N"));
            _packageName = "BootstrapTest_" + Guid.NewGuid().ToString("N");
            _cacheRoot = Path.Combine(_root, "cache");
            _recordsRoot = Path.Combine(_root, "records");
            Directory.CreateDirectory(_root);

            // A normal MonoBehaviour driver does not tick in EditMode. Initialize the same scheduler
            // without creating a scene object, then pump YooAssets.Update while waiting for coroutines.
            var loggerProperty = YooAssembly.GetType("YooAsset.YooLogger", true).GetProperty("Current");
            _previousLogger = loggerProperty.GetValue(null);
            loggerProperty.SetValue(null, new FixtureLogger());
            YooAssembly.GetType("YooAsset.AsyncOperationSystem", true).GetMethod("Initialize").Invoke(null, null);
            typeof(YooAssets).GetField("s_isInitialized", BindingFlags.NonPublic | BindingFlags.Static).SetValue(null, true);
            _ownsYooAssets = true;

            _server = new LoopbackPackageServer();
            _versions = new LocalVersionStore(_recordsRoot, "test-player/Windows");
            _updater = NewUpdater();
        }

        [UnityTearDown]
        public IEnumerator TearDown()
        {
            if (_updater != null) _updater.Dispose();
            if (_ownsYooAssets)
            {
                if (YooAssets.TryGetPackage(_packageName, out var package))
                {
                    yield return Pump(package.DestroyPackageAsync());
                    YooAssets.RemovePackage(_packageName);
                }
                YooAssets.Destroy();
                YooAssembly.GetType("YooAsset.YooLogger", true).GetProperty("Current").SetValue(null, _previousLogger);
                _ownsYooAssets = false;
            }
            if (_server != null) _server.Dispose();
            if (_root != null && Directory.Exists(_root)) Directory.Delete(_root, true);
        }

        [UnityTest]
        public IEnumerator CompleteUpdateCanRestartOfflineFromTheSameDiskCache()
        {
            Publish("v1", "first complete game");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v1" }));

            yield return RestartUpdater();
            _server.Offline = true;
            yield return Pump(_updater.UpdateOrFallback());

            AssertSucceeded("v1", true);
            Assert.That(_updater.Package.CreateResourceDownloader(new ResourceDownloaderOptions(1, 0)).TotalDownloadCount, Is.Zero);
        }

        [UnityTest]
        public IEnumerator AReachableVersionFileAndMissingManifestFallBackToTheCompleteVersion()
        {
            Publish("v1", "old game remains available");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);

            Publish("v2", "new game");
            _server.Remove(YooAssetConfiguration.GetManifestBinaryFileName(_packageName, "v2"));
            yield return Pump(_updater.UpdateOrFallback());

            AssertSucceeded("v1", true);
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v1" }));
            Assert.That(_server.RequestsFor(YooAssetConfiguration.GetPackageVersionFileName(_packageName)), Is.GreaterThanOrEqualTo(2));
        }

        [UnityTest]
        public IEnumerator InterruptedBundleDoesNotPromoteHalfDownloadedVersionOrDeleteOldCache()
        {
            Publish("v1", "complete old payload");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
            var previousCacheFiles = Directory.GetFiles(_cacheRoot, "*", SearchOption.AllDirectories);

            string[] bundleNames = Publish("v2", "new first bundle", "new second bundle intentionally interrupted");
            _server.TruncateAfterFirstBundle(bundleNames);
            yield return Pump(_updater.UpdateOrFallback());

            AssertSucceeded("v1", true);
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v1" }));
            Assert.That(previousCacheFiles.All(File.Exists), Is.True, "A failed update must keep the previous complete cache.");
            Assert.That(_server.RequestsFor(bundleNames[0]), Is.GreaterThan(0));
            Assert.That(_server.RequestsFor(bundleNames[1]), Is.GreaterThan(0));
            var candidate = _updater.Package.PrefetchManifestAsync(new PrefetchManifestOptions("v2", 2));
            yield return Pump(candidate);
            Assert.That(candidate.Status, Is.EqualTo(EOperationStatus.Succeeded));
            Assert.That(candidate.CreateResourceDownloader(new ResourceDownloaderOptions(1, 0)).TotalDownloadCount, Is.EqualTo(1),
                "The failure must occur after one new bundle is actually cached, not before any progress.");
        }

        [UnityTest]
        public IEnumerator PrefetchKeepsCurrentManifestAndActivatesNewUiOnlyOnNextLocalStart()
        {
            Publish("v1", "current update screen");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);

            Publish("v2", "next update screen");
            yield return Pump(_updater.PrefetchNext());
            Assert.That(_updater.Succeeded, Is.True, _updater.Error);
            Assert.That(_updater.Package.GetPackageVersion(), Is.EqualTo("v1"), "Prefetch must not replace a loaded UI manifest.");
            _versions = new LocalVersionStore(_recordsRoot, "test-player/Windows");
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v2", "v1" }));

            yield return RestartUpdater();
            int requestsBeforeLocalStart = _server.RequestCount;
            yield return Pump(_updater.LoadLocal());
            AssertSucceeded("v2", true);
            Assert.That(_server.RequestCount, Is.EqualTo(requestsBeforeLocalStart), "A complete local start must not contact HTTP.");
        }

        [UnityTest]
        public IEnumerator RejectedCompleteUiVersionIsSkippedLocallyAndWhileStillAdvertisedByTheServer()
        {
            Publish("v1", "known working update screen");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
            string[] candidateFiles = Publish("v2", "complete but rejected update screen");
            yield return Pump(_updater.PrefetchNext());
            Assert.That(_updater.Succeeded, Is.True, _updater.Error);

            _versions = new LocalVersionStore(_recordsRoot, "test-player/Windows");
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v2", "v1" }));
            _versions.RejectVersion(_packageName, "v2");
            yield return RestartUpdater();
            int requestsBeforeLocalStart = _server.RequestCount;
            yield return Pump(_updater.LoadLocal());
            AssertSucceeded("v1", true);
            Assert.That(_server.RequestCount, Is.EqualTo(requestsBeforeLocalStart));

            string[] candidateUrls = candidateFiles.Concat(new[] {
                YooAssetConfiguration.GetManifestBinaryFileName(_packageName, "v2"),
                YooAssetConfiguration.GetPackageHashFileName(_packageName, "v2")
            }).ToArray();
            int[] candidateRequestsBefore = candidateUrls.Select(_server.RequestsFor).ToArray();
            int versionRequestsBefore = _server.RequestsFor(YooAssetConfiguration.GetPackageVersionFileName(_packageName));
            yield return Pump(_updater.UpdateOrFallback());

            AssertSucceeded("v1", true);
            Assert.That(_versions.IsRejected(_packageName, "v2"), Is.True);
            Assert.That(_versions.GetVersions(_packageName), Is.EqualTo(new[] { "v1" }));
            Assert.That(_server.RequestsFor(YooAssetConfiguration.GetPackageVersionFileName(_packageName)), Is.GreaterThan(versionRequestsBefore),
                "The test must actually observe the server still advertising v2.");
            Assert.That(candidateUrls.Select(_server.RequestsFor).ToArray(), Is.EqualTo(candidateRequestsBefore),
                "Rejected candidates must not fetch their manifest or bundles again.");
        }

        [UnityTest]
        public IEnumerator MissingLocalManifestCannotTriggerAnImplicitNetworkDownload()
        {
            Publish("v1", "available only on the server");
            _versions.SaveComplete(_packageName, "v1");
            _updater.Dispose();
            _updater = NewUpdater();

            yield return Pump(_updater.LoadLocal());

            Assert.That(_updater.Succeeded, Is.False);
            Assert.That(_server.RequestCount, Is.Zero, "LoadLocal must not let YooAsset fetch a missing manifest from the server.");
        }

        [UnityTest]
        public IEnumerator CorruptCachedBundleIsRejectedBeforeOfflineEntry()
        {
            const string payload = "payload whose cached bytes must remain intact";
            Publish("v1", payload);
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
            yield return DestroyCurrentPackage();

            byte[] expectedBytes = Encoding.UTF8.GetBytes(payload);
            string cachedBundle = Directory.GetFiles(_cacheRoot, "*", SearchOption.AllDirectories)
                .Single(path => new FileInfo(path).Length == expectedBytes.Length && File.ReadAllBytes(path).SequenceEqual(expectedBytes));
            File.WriteAllText(cachedBundle, "broken");
            _updater = NewUpdater();
            int requestsBeforeLocalStart = _server.RequestCount;
            yield return Pump(_updater.LoadLocal());

            Assert.That(_updater.Succeeded, Is.False, "A saved version number does not prove its bundles remain intact.");
            Assert.That(_server.RequestCount, Is.EqualTo(requestsBeforeLocalStart));
        }

        [UnityTest]
        public IEnumerator InitializationFailureCanBeRetriedAfterTheStorageProblemIsRemoved()
        {
            Publish("v1", "download after repairing local storage");
            File.WriteAllText(_cacheRoot, "a file blocks the sandbox directory");
            yield return Pump(_updater.UpdateOrFallback());
            Assert.That(_updater.Succeeded, Is.False);
            Assert.That(_versions.GetVersions(_packageName), Is.Empty);

            File.Delete(_cacheRoot);
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
        }

        [UnityTest]
        public IEnumerator InterruptedUiPrefetchLeavesTheActiveAndNextStartupVersionUnchanged()
        {
            Publish("v1", "working update screen");
            yield return Pump(_updater.UpdateOrFallback());
            AssertSucceeded("v1", false);
            string[] files = Publish("v2", "first part of new screen", "second part of new screen");
            _server.TruncateAfterFirstBundle(files);

            yield return Pump(_updater.PrefetchNext());

            Assert.That(_updater.Succeeded, Is.False);
            Assert.That(_updater.Package.GetPackageVersion(), Is.EqualTo("v1"));
            Assert.That(new LocalVersionStore(_recordsRoot, "test-player/Windows").GetVersions(_packageName), Is.EqualTo(new[] { "v1" }));
        }

        private PackageUpdater NewUpdater()
        {
            return new PackageUpdater(_packageName, EPlayMode.HostPlayMode, _server,
                new LocalVersionStore(_recordsRoot, "test-player/Windows"), _cacheRoot, null, false)
            {
                RequestTimeout = 2,
                ManifestTimeout = 2,
                RetryCount = 0,
                MaxConcurrency = 1
            };
        }

        private IEnumerator RestartUpdater()
        {
            yield return DestroyCurrentPackage();
            _versions = new LocalVersionStore(_recordsRoot, "test-player/Windows");
            _updater = NewUpdater();
        }

        private IEnumerator DestroyCurrentPackage()
        {
            _updater.Dispose();
            if (YooAssets.TryGetPackage(_packageName, out var package))
            {
                yield return Pump(package.DestroyPackageAsync());
                YooAssets.RemovePackage(_packageName);
            }
        }

        private void AssertSucceeded(string version, bool usedLocal)
        {
            Assert.That(_updater.Succeeded, Is.True, _updater.Error);
            Assert.That(_updater.Version, Is.EqualTo(version));
            Assert.That(_updater.UsedLocal, Is.EqualTo(usedLocal));
            Assert.That(_updater.Package.GetPackageVersion(), Is.EqualTo(version));
            // Read a fresh persisted snapshot: each updater is deliberately a separate store instance.
            _versions = new LocalVersionStore(_recordsRoot, "test-player/Windows");
        }

        private static IEnumerator Pump(IEnumerator coroutine)
        {
            var stack = new Stack<IEnumerator>();
            stack.Push(coroutine);
            var timer = Stopwatch.StartNew();
            while (stack.Count > 0)
            {
                Assert.That(timer.Elapsed.TotalSeconds, Is.LessThan(20), "YooAsset operation exceeded the test deadline.");
                UpdateYoo.Invoke(null, null);
                var current = stack.Peek();
                if (!current.MoveNext())
                {
                    (current as IDisposable)?.Dispose();
                    stack.Pop();
                    continue;
                }
                if (current.Current is IEnumerator nested) stack.Push(nested);
                else yield return current.Current;
            }
        }

        private string[] Publish(string version, params string[] contents)
        {
            string fixtureDirectory = Path.Combine(_root, "fixture-" + version);
            Directory.CreateDirectory(fixtureDirectory);
            Type manifestType = YooAssembly.GetType("YooAsset.BuildManifest", true);
            Type assetType = YooAssembly.GetType("YooAsset.BuildAsset", true);
            Type bundleType = YooAssembly.GetType("YooAsset.BuildBundle", true);
            object manifest = Activator.CreateInstance(manifestType, true);
            Set(manifest, "FileVersion", (int)YooAssembly.GetType("YooAsset.PackageManifestConsts", true).GetField("FileVersion").GetRawConstantValue());
            Set(manifest, "EnableAddressable", true);
            Set(manifest, "OutputNameStyle", (int)EFileNameStyle.HashName);
            Set(manifest, "BuildBundleType", (int)EBundleType.RawBundle);
            Set(manifest, "BuildPipeline", "RawFileBuildPipeline");
            Set(manifest, "PackageName", _packageName);
            Set(manifest, "PackageVersion", version);
            Set(manifest, "PackageNote", "Bootstrap integration test fixture");

            var assetList = (IList)manifestType.GetField("AssetList").GetValue(manifest);
            var bundleList = (IList)manifestType.GetField("BundleList").GetValue(manifest);
            var bundleNames = new string[contents.Length];
            for (int index = 0; index < contents.Length; index++)
            {
                byte[] bytes = Encoding.UTF8.GetBytes(contents[index]);
                string hash = Md5(bytes);
                object bundle = Activator.CreateInstance(bundleType, true);
                Set(bundle, "BundleName", "fixture-" + index + ".raw");
                Set(bundle, "FileHash", hash);
                Set(bundle, "FileCrc", Crc32(bytes));
                Set(bundle, "FileSize", (long)bytes.Length);
                Set(bundle, "DependentBundleIDs", new int[0]);
                Set(bundle, "Tags", new string[0]);
                bundleList.Add(bundle);
                bundleNames[index] = (string)bundleType.GetMethod("GetFileName").Invoke(bundle, new object[] { (int)EFileNameStyle.HashName });
                _server.Put(bundleNames[index], bytes);

                object asset = Activator.CreateInstance(assetType, true);
                Set(asset, "Address", "Fixture" + index);
                Set(asset, "AssetPath", "Assets/BootstrapTests/fixture-" + index + ".txt");
                Set(asset, "BundleID", index);
                Set(asset, "DependentBundleIDs", new int[0]);
                Set(asset, "Tags", new string[0]);
                assetList.Add(asset);
            }
            manifestType.GetMethod("BuildTagTable").Invoke(manifest, null);
            manifestType.GetMethod("BuildDirectoryTable").Invoke(manifest, null);
            string manifestName = YooAssetConfiguration.GetManifestBinaryFileName(_packageName, version);
            string manifestPath = Path.Combine(fixtureDirectory, manifestName);
            YooAssembly.GetType("YooAsset.PackageManifestHelper", true).GetMethod("SerializeManifestToBinary")
                .Invoke(null, new[] { (object)manifestPath, manifest, null });
            byte[] manifestBytes = File.ReadAllBytes(manifestPath);
            _server.Put(manifestName, manifestBytes);
            _server.Put(YooAssetConfiguration.GetPackageHashFileName(_packageName, version), Encoding.UTF8.GetBytes(Md5(manifestBytes)));
            _server.Put(YooAssetConfiguration.GetPackageVersionFileName(_packageName), Encoding.UTF8.GetBytes(version));
            return bundleNames;
        }

        private static void Set(object instance, string field, object value)
        {
            instance.GetType().GetField(field).SetValue(instance, value);
        }

        private static string Md5(byte[] bytes)
        {
            using (var md5 = MD5.Create())
                return BitConverter.ToString(md5.ComputeHash(bytes)).Replace("-", string.Empty).ToLowerInvariant();
        }

        private static uint Crc32(byte[] bytes)
        {
            uint crc = uint.MaxValue;
            foreach (byte value in bytes)
            {
                crc ^= value;
                for (int bit = 0; bit < 8; bit++) crc = (crc >> 1) ^ ((crc & 1) != 0 ? 0xedb88320u : 0u);
            }
            return ~crc;
        }

        private sealed class FixtureLogger : YooAsset.ILogger
        {
            public void Log(string message) { }
            public void LogWarning(string message) { TestContext.Progress.WriteLine(message); }
            public void LogError(string message) { TestContext.Progress.WriteLine(message); }
            public void LogException(Exception exception) { TestContext.Progress.WriteLine(exception); }
        }

        private sealed class LoopbackPackageServer : IRemoteService, IDisposable
        {
            private readonly TcpListener _listener;
            private readonly Task _loop;
            private readonly Dictionary<string, byte[]> _files = new Dictionary<string, byte[]>(StringComparer.Ordinal);
            private readonly Dictionary<string, int> _requests = new Dictionary<string, int>(StringComparer.Ordinal);
            private readonly HashSet<string> _truncateAfterFirst = new HashSet<string>(StringComparer.Ordinal);
            private readonly object _gate = new object();
            private int _firstBundleResponses;
            private int _requestCount;
            private volatile bool _stopped;
            public volatile bool Offline;
            public string BaseUrl { get; }
            public int RequestCount => Volatile.Read(ref _requestCount);

            public LoopbackPackageServer()
            {
                _listener = new TcpListener(IPAddress.Loopback, 0);
                _listener.Start();
                BaseUrl = "http://127.0.0.1:" + ((IPEndPoint)_listener.LocalEndpoint).Port;
                _loop = Task.Factory.StartNew(AcceptConnections, CancellationToken.None, TaskCreationOptions.LongRunning, TaskScheduler.Default);
            }

            public IReadOnlyList<string> GetRemoteUrls(string fileName) => new[] { BaseUrl + "/" + fileName };
            public void Put(string name, byte[] bytes) { lock (_gate) _files[name] = bytes; }
            public void Remove(string name) { lock (_gate) _files.Remove(name); }
            public void TruncateAfterFirstBundle(IEnumerable<string> names)
            {
                lock (_gate)
                {
                    _truncateAfterFirst.Clear();
                    foreach (string name in names) _truncateAfterFirst.Add(name);
                    _firstBundleResponses = 0;
                }
            }
            public int RequestsFor(string name) { lock (_gate) return _requests.TryGetValue(name, out var count) ? count : 0; }

            private void AcceptConnections()
            {
                while (!_stopped)
                {
                    try
                    {
                        TcpClient client = _listener.AcceptTcpClient();
                        Task.Run(() => Respond(client));
                    }
                    catch (SocketException) { if (!_stopped) throw; }
                    catch (ObjectDisposedException) { break; }
                }
            }

            private void Respond(TcpClient client)
            {
                using (client)
                {
                    client.ReceiveTimeout = 3000;
                    client.SendTimeout = 3000;
                    try
                    {
                        using (var stream = client.GetStream())
                        using (var reader = new StreamReader(stream, Encoding.ASCII, false, 1024, true))
                        {
                            string request = reader.ReadLine();
                            if (request == null) return;
                            string header;
                            while (!string.IsNullOrEmpty(header = reader.ReadLine())) { }
                            string[] parts = request.Split(' ');
                            string name = Uri.UnescapeDataString(parts[1].Split('?')[0].TrimStart('/'));
                            Interlocked.Increment(ref _requestCount);
                            byte[] bytes;
                            bool truncate;
                            lock (_gate)
                            {
                                _requests[name] = _requests.TryGetValue(name, out var count) ? count + 1 : 1;
                                _files.TryGetValue(name, out bytes);
                                truncate = false;
                                // Tests set MaxConcurrency=1: the next bundle is requested only after
                                // the first complete response has been verified and cached. Do not
                                // assume that YooAsset downloads in manifest-array order (3.0.6 uses LIFO).
                                if (_truncateAfterFirst.Contains(name) && bytes != null && !Offline)
                                {
                                    truncate = _firstBundleResponses > 0;
                                    _firstBundleResponses++;
                                }
                            }
                            string status = Offline ? "503 Service Unavailable" : bytes == null ? "404 Not Found" : "200 OK";
                            if (Offline || bytes == null) bytes = new byte[0];
                            byte[] responseHeader = Encoding.ASCII.GetBytes("HTTP/1.1 " + status + "\r\nContent-Type: application/octet-stream\r\nContent-Length: " + bytes.Length + "\r\nConnection: close\r\n\r\n");
                            stream.Write(responseHeader, 0, responseHeader.Length);
                            stream.Write(bytes, 0, truncate ? bytes.Length / 2 : bytes.Length);
                            stream.Flush();
                        }
                    }
                    catch (IOException) { /* Client cancellation or intentional truncation. */ }
                    catch (SocketException) { /* Client cancellation or intentional truncation. */ }
                }
            }

            public void Dispose()
            {
                _stopped = true;
                _listener.Stop();
                _loop.Wait(1000);
            }
        }
    }
}
