using System;
using System.IO;
using System.Linq;
using NUnit.Framework;

namespace BA.Bootstrap.Tests
{
    [TestFixture]
    public sealed class LocalVersionStoreTests
    {
        private string _directory;
        private const string PlayerKey = "Windows/player-1/content-v1";

        [SetUp]
        public void SetUp()
        {
            _directory = Path.Combine(Path.GetTempPath(), "BA.Bootstrap.Tests", Guid.NewGuid().ToString("N"));
            Directory.CreateDirectory(_directory);
        }

        [TearDown]
        public void TearDown()
        {
            if (Directory.Exists(_directory)) Directory.Delete(_directory, true);
        }

        [Test]
        public void MissingRecordDoesNotInventAnOfflineVersion()
        {
            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.Empty);
        }

        [Test]
        public void ANewStoreRestoresLatestAndPreviousCompleteVersions()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            store.SaveComplete("Main", "2");
            store.SaveComplete("Main", "3");

            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "3", "2" }));
        }

        [Test]
        public void SavingTheSameVersionDoesNotDiscardTheRollbackVersion()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            store.SaveComplete("Main", "2");
            store.SaveComplete("Main", "2");

            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "2", "1" }));
        }

        [Test]
        public void RejectedVersionStaysExcludedAfterRestartAndCannotBePromotedAgain()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Preload", "v1");
            store.SaveComplete("Preload", "v2");
            store.RejectVersion("Preload", "v2");

            var restored = new LocalVersionStore(_directory, PlayerKey);
            Assert.That(restored.GetVersions("Preload"), Is.EqualTo(new[] { "v1" }));
            Assert.That(restored.IsRejected("Preload", "v2"), Is.True);
            Assert.That(restored.IsRejected("Preload", "v1"), Is.False);
            Assert.Throws<InvalidOperationException>(() => restored.SaveComplete("Preload", "v2"));

            var afterFailedPromotion = new LocalVersionStore(_directory, PlayerKey);
            Assert.That(afterFailedPromotion.GetVersions("Preload"), Is.EqualTo(new[] { "v1" }));
            Assert.That(afterFailedPromotion.IsRejected("Preload", "v2"), Is.True);
        }

        [Test]
        public void UpdatingPreloadDoesNotReplaceTheMainVersion()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "game-1");
            store.SaveComplete("Preload", "ui-1");
            store.SaveComplete("Preload", "ui-2");

            var restored = new LocalVersionStore(_directory, PlayerKey);
            Assert.That(restored.GetVersions("Main"), Is.EqualTo(new[] { "game-1" }));
            Assert.That(restored.GetVersions("Preload"), Is.EqualTo(new[] { "ui-2", "ui-1" }));
        }

        [Test]
        public void AnotherPlayerCompatibilityKeyCannotSelectTheseVersions()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "windows-version");
            var other = new LocalVersionStore(_directory, "Android/player-1/content-v1");
            Assert.That(other.GetVersions("Main"), Is.Empty);
            other.SaveComplete("Main", "android-version");

            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "windows-version" }));
        }

        [Test]
        public void ChangingReturnedVersionsCannotChangeTheSavedState()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            var selected = store.GetVersions("Main");
            selected[0] = "incomplete-download";

            Assert.That(store.GetVersions("Main"), Is.EqualTo(new[] { "1" }));
        }

        [Test]
        public void AnInterruptedTemporaryWriteDoesNotReplaceTheCompleteRecord()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            File.WriteAllText(RecordPath() + ".interrupted.tmp", "partial next version");

            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "1" }));
        }

        [Test]
        public void CorruptCurrentRecordRecoversTheLastDurableBackup()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            store.SaveComplete("Main", "2");
            File.WriteAllText(RecordPath(), "truncated record");

            var restored = new LocalVersionStore(_directory, PlayerKey);
            Assert.That(restored.GetVersions("Main"), Is.EqualTo(new[] { "1" }));
            Assert.That(restored.LastDiagnostic, Is.Not.Null.And.Not.Empty);
        }

        [Test]
        public void CorruptCurrentAndBackupRecordsRequireResourceRecovery()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            store.SaveComplete("Main", "2");
            File.WriteAllText(RecordPath(), "bad primary");
            File.WriteAllText(RecordPath() + ".bak", "bad backup");

            var restored = new LocalVersionStore(_directory, PlayerKey);
            Assert.That(restored.GetVersions("Main"), Is.Empty);
            Assert.That(restored.LastDiagnostic, Is.Not.Null.And.Not.Empty);
        }

        [Test]
        public void FailedPersistenceDoesNotPromoteTheCandidateInMemoryOrOnDisk()
        {
            var root = Path.Combine(_directory, "records");
            var movedRoot = Path.Combine(_directory, "preserved-records");
            var store = new LocalVersionStore(root, PlayerKey);
            store.SaveComplete("Main", "1");

            // Simulates an unavailable record directory without platform-specific file locks.
            Directory.Move(root, movedRoot);
            File.WriteAllText(root, "a file now occupies the record directory");
            try
            {
                Assert.Catch<IOException>(() => store.SaveComplete("Main", "2"));
                Assert.That(store.GetVersions("Main"), Is.EqualTo(new[] { "1" }));
                Assert.That(new LocalVersionStore(movedRoot, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "1" }));
            }
            finally
            {
                File.Delete(root);
                Directory.Move(movedRoot, root);
            }

            store.SaveComplete("Main", "2");
            Assert.That(new LocalVersionStore(root, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "2", "1" }));
        }

        [Test]
        public void UnicodePackageAndVersionNamesSurviveRestart()
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("更新界面", "版本二\t候选\n完整");
            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("更新界面"), Is.EqualTo(new[] { "版本二\t候选\n完整" }));
        }

        [TestCase(null)]
        [TestCase("")]
        [TestCase(" ")]
        public void InvalidCandidateCannotOverwriteThePreviousVersion(string invalidVersion)
        {
            var store = new LocalVersionStore(_directory, PlayerKey);
            store.SaveComplete("Main", "1");
            Assert.Throws<ArgumentException>(() => store.SaveComplete("Main", invalidVersion));
            Assert.That(new LocalVersionStore(_directory, PlayerKey).GetVersions("Main"), Is.EqualTo(new[] { "1" }));
        }

        private string RecordPath()
        {
            return Directory.GetFiles(_directory, "versions-*.dat").Single();
        }
    }
}
