// Editor-only compatibility helpers for the MIT-licensed YooAsset 2.3 AssetArt scanner.
using System;
using System.IO;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace BA.AssetArt
{
    public enum EAssetSearchType { All, Texture }
    public static class EditorTools
    {
        public static string[] FindAssets(EAssetSearchType type, string[] directories)
        {
            return AssetDatabase.FindAssets(type == EAssetSearchType.All ? string.Empty : "t:" + type,
                directories.Select(p => p.TrimEnd('/')).ToArray()).Select(AssetDatabase.GUIDToAssetPath).Distinct().ToArray();
        }
        public static void DisplayProgressBar(string title, int current, int total)
        { EditorUtility.DisplayProgressBar(title, current + "/" + total, total == 0 ? 1 : (float)current / total); }
        public static void ClearProgressBar() { EditorUtility.ClearProgressBar(); }
        public static string GetProjectPath() { return Directory.GetParent(Application.dataPath).FullName.Replace('\\', '/'); }
        public static string OpenFilePath(string title, string path, string extension = "")
        { return ValidateAssetPath(EditorUtility.OpenFilePanel(title, path, extension)); }
        public static string OpenFolderPanel(string title, string path, string name = "")
        { return ValidateAssetPath(EditorUtility.OpenFolderPanel(title, path, name)); }
        private static string ValidateAssetPath(string path)
        {
            if (string.IsNullOrEmpty(path)) return null;
            string assetRoot = Application.dataPath.Replace('\\', '/');
            path = path.Replace('\\', '/');
            if (path == assetRoot || path.StartsWith(assetRoot + "/", StringComparison.OrdinalIgnoreCase)) return path;
            Debug.LogWarning("Please select a path inside this project's Assets folder.");
            return null;
        }
        public static void CopyFile(string source, string destination, bool overwrite)
        { Directory.CreateDirectory(Path.GetDirectoryName(destination)); File.Copy(source, destination, overwrite); }
        public static object InvokePublicStaticMethod(Type type, string name, params object[] args)
        { return type.InvokeMember(name, BindingFlags.Public | BindingFlags.Static | BindingFlags.InvokeMethod, null, null, args); }
    }
    internal static class FileUtility
    {
        public static string ReadAllText(string path) { return File.ReadAllText(path); }
        public static void WriteAllText(string path, string text)
        { Directory.CreateDirectory(Path.GetDirectoryName(Path.GetFullPath(path))); File.WriteAllText(path, text); }
    }
    internal static class WindowsDefine
    {
        public static readonly Type[] DockedWindowTypes = { typeof(AssetArtScannerWindow), typeof(AssetArtReporterWindow) };
    }
}
