using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace BA.Bootstrap
{
    /// <summary>
    /// Stores only versions whose entire resource set has been downloaded and verified.
    /// The caller supplies a platform/player compatibility key; old PlayerPrefs are not trusted.
    /// </summary>
    public sealed class LocalVersionStore
    {
        private const string Header = "BA.LocalVersions/2";
        private const string LegacyHeader = "BA.LocalVersions/1";
        private const int MaximumFileLength = 1024 * 1024;
        private readonly string _compatibilityKey;
        private readonly string _filePath;
        private readonly object _gate = new object();
        private Dictionary<string, string[]> _versions = new Dictionary<string, string[]>(StringComparer.Ordinal);
        private Dictionary<string, string[]> _rejectedVersions = new Dictionary<string, string[]>(StringComparer.Ordinal);

        public string LastDiagnostic { get; private set; }

        public LocalVersionStore(string rootDirectory, string compatibilityKey)
        {
            if (string.IsNullOrWhiteSpace(rootDirectory)) throw new ArgumentException("A version store directory is required.", nameof(rootDirectory));
            if (string.IsNullOrWhiteSpace(compatibilityKey)) throw new ArgumentException("A player compatibility key is required.", nameof(compatibilityKey));
            _compatibilityKey = compatibilityKey;
            _filePath = Path.Combine(Path.GetFullPath(rootDirectory), "versions-" + Digest(compatibilityKey) + ".dat");
            Load();
        }

        public string[] GetVersions(string packageName)
        {
            ValidateValue(packageName, nameof(packageName));
            lock (_gate)
            {
                return GetUsableVersions(packageName);
            }
        }

        public bool IsRejected(string packageName, string version)
        {
            ValidateValue(packageName, nameof(packageName));
            ValidateValue(version, nameof(version));
            lock (_gate)
            {
                string[] rejected;
                return _rejectedVersions.TryGetValue(packageName, out rejected) && Array.IndexOf(rejected, version) >= 0;
            }
        }

        /// <summary>
        /// Quarantines a downloaded version that failed DLL/entry validation without deleting its cache.
        /// Keeps the two most recently rejected versions per package across restarts.
        /// </summary>
        public void RejectVersion(string packageName, string version)
        {
            ValidateValue(packageName, nameof(packageName));
            ValidateValue(version, nameof(version));
            lock (_gate)
            {
                string[] rejected;
                _rejectedVersions.TryGetValue(packageName, out rejected);
                if (rejected != null && rejected.Length > 0 && rejected[0] == version) return;
                var nextRejected = new Dictionary<string, string[]>(_rejectedVersions, StringComparer.Ordinal);
                nextRejected[packageName] = rejected != null && rejected.Length > 0
                    ? new[] { version, rejected[0] }
                    : new[] { version };

                var next = new Dictionary<string, string[]>(_versions, StringComparer.Ordinal);
                var usable = new List<string>(GetUsableVersions(packageName));
                usable.RemoveAll(candidate => candidate == version);
                if (usable.Count == 0) next.Remove(packageName);
                else next[packageName] = usable.ToArray();
                Persist(next, nextRejected);
            }
        }

        /// <summary>
        /// Call only after the full download has succeeded (including the zero-download case).
        /// A failed write leaves both the in-memory record and the existing file unchanged.
        /// </summary>
        public void SaveComplete(string packageName, string version)
        {
            ValidateValue(packageName, nameof(packageName));
            ValidateValue(version, nameof(version));
            lock (_gate)
            {
                if (IsRejected(packageName, version))
                    throw new InvalidOperationException("资源包 " + packageName + " 的版本 " + version + " 已被隔离，请发布新的版本号。");
                string[] previous = GetUsableVersions(packageName);
                if (previous.Length > 0 && previous[0] == version) return;

                var next = new Dictionary<string, string[]>(_versions, StringComparer.Ordinal);
                next[packageName] = previous.Length > 0
                    ? new[] { version, previous[0] }
                    : new[] { version };
                Persist(next, _rejectedVersions);
            }
        }

        // Called with _gate held. The replacement and both in-memory dictionaries commit together.
        private void Persist(Dictionary<string, string[]> next, Dictionary<string, string[]> nextRejected)
        {
            string directory = Path.GetDirectoryName(_filePath);
            Directory.CreateDirectory(directory);
            string temporaryPath = _filePath + "." + Guid.NewGuid().ToString("N") + ".tmp";
            try
            {
                byte[] bytes = new UTF8Encoding(false).GetBytes(Serialize(next, nextRejected));
                using (var stream = new FileStream(temporaryPath, FileMode.CreateNew, FileAccess.Write, FileShare.None))
                {
                    stream.Write(bytes, 0, bytes.Length);
                    stream.Flush(true);
                }
                // Both paths are in the same directory. Never delete the old file before replacement.
                // If this filesystem cannot replace atomically, report failure to the caller.
                if (File.Exists(_filePath)) File.Replace(temporaryPath, _filePath, _filePath + ".bak");
                else File.Move(temporaryPath, _filePath);
                _versions = next;
                _rejectedVersions = nextRejected;
            }
            finally
            {
                if (File.Exists(temporaryPath)) File.Delete(temporaryPath);
            }
        }

        private string[] GetUsableVersions(string packageName)
        {
            string[] versions;
            if (!_versions.TryGetValue(packageName, out versions)) return new string[0];
            var result = new List<string>(versions.Length);
            foreach (string version in versions)
                if (!IsRejected(packageName, version)) result.Add(version);
            return result.ToArray();
        }

        private void Load()
        {
            foreach (string path in new[] { _filePath, _filePath + ".bak" })
            {
                if (!File.Exists(path)) continue;
                try
                {
                    if (new FileInfo(path).Length > MaximumFileLength) throw new InvalidDataException("Version record is too large.");
                    Dictionary<string, string[]> rejected;
                    _versions = Deserialize(File.ReadAllText(path, Encoding.UTF8), out rejected);
                    _rejectedVersions = rejected;
                    if (path != _filePath) LastDiagnostic += " Recovered the previous version record.";
                    return;
                }
                catch (Exception exception) when (exception is IOException || exception is InvalidDataException || exception is UnauthorizedAccessException ||
                    exception is FormatException || exception is ArgumentException)
                {
                    LastDiagnostic = "Ignored an unreadable local version record: " + exception.Message;
                }
            }
        }

        private string Serialize(Dictionary<string, string[]> versions, Dictionary<string, string[]> rejected)
        {
            var text = new StringBuilder(Header).Append('\n').Append(Encode(_compatibilityKey)).Append('\n');
            AppendRecords(text, "C", versions);
            AppendRecords(text, "R", rejected);
            string body = text.ToString();
            return body + "SHA256:" + Digest(body);
        }

        private static void AppendRecords(StringBuilder text, string kind, Dictionary<string, string[]> versions)
        {
            var packages = new List<string>(versions.Keys);
            packages.Sort(StringComparer.Ordinal);
            foreach (string package in packages)
            {
                text.Append(kind).Append('\t').Append(Encode(package));
                foreach (string version in versions[package]) text.Append('\t').Append(Encode(version));
                text.Append('\n');
            }
        }

        private Dictionary<string, string[]> Deserialize(string text, out Dictionary<string, string[]> rejected)
        {
            int checksumOffset = text.LastIndexOf("SHA256:", StringComparison.Ordinal);
            if (checksumOffset < 0) throw new InvalidDataException("Version record checksum is missing.");
            string body = text.Substring(0, checksumOffset);
            if (!string.Equals(Digest(body), text.Substring(checksumOffset + 7), StringComparison.Ordinal))
                throw new InvalidDataException("Version record checksum does not match.");
            string[] lines = body.Split('\n');
            if (lines.Length < 3 || (lines[0] != Header && lines[0] != LegacyHeader) || Decode(lines[1]) != _compatibilityKey)
                throw new InvalidDataException("Version record belongs to another player or schema.");

            var result = new Dictionary<string, string[]>(StringComparer.Ordinal);
            rejected = new Dictionary<string, string[]>(StringComparer.Ordinal);
            bool legacy = lines[0] == LegacyHeader;
            for (int index = 2; index < lines.Length - 1; index++)
            {
                string[] fields = lines[index].Split('\t');
                int packageField = legacy ? 0 : 1;
                if (fields.Length < packageField + 2 || fields.Length > packageField + 3)
                    throw new InvalidDataException("Invalid package version record.");
                if (!legacy && fields[0] != "C" && fields[0] != "R")
                    throw new InvalidDataException("Unknown package record type.");
                string package = Decode(fields[packageField]);
                ValidateValue(package, "packageName");
                var versions = new string[fields.Length - packageField - 1];
                for (int versionIndex = 0; versionIndex < versions.Length; versionIndex++)
                {
                    versions[versionIndex] = Decode(fields[versionIndex + packageField + 1]);
                    ValidateValue(versions[versionIndex], "version");
                }
                if (versions.Length == 2 && versions[0] == versions[1]) throw new InvalidDataException("Duplicate package versions.");
                var records = !legacy && fields[0] == "R" ? rejected : result;
                records.Add(package, versions);
            }
            return result;
        }

        private static void ValidateValue(string value, string parameter)
        {
            if (string.IsNullOrWhiteSpace(value)) throw new ArgumentException("A non-empty value is required.", parameter);
        }

        private static string Encode(string value) { return Convert.ToBase64String(Encoding.UTF8.GetBytes(value)); }
        private static string Decode(string value) { return Encoding.UTF8.GetString(Convert.FromBase64String(value)); }
        private static string Digest(string value)
        {
            using (var sha = SHA256.Create())
                return BitConverter.ToString(sha.ComputeHash(Encoding.UTF8.GetBytes(value))).Replace("-", string.Empty).ToLowerInvariant();
        }
    }
}
