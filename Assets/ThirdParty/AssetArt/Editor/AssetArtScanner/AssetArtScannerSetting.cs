// Adapted from YooAsset 2.3.17 AssetArt editor tools (MIT); no YooAsset 2 runtime dependency.
using YooAsset.Editor;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using UnityEngine;


namespace BA.AssetArt
{
    public class AssetArtScannerSetting : ScriptableObject
    {
        /// <summary>
        /// 扫描器列表
        /// </summary>
        public List<AssetArtScanner> Scanners = new List<AssetArtScanner>();

        /// <summary>
        /// 开始扫描
        /// </summary>
        public ScannerResult BeginScan(string scannerGUID)
        {
            try
            {
                // 获取扫描器配置
                var scanner = GetScanner(scannerGUID);
                if (scanner == null)
                    throw new Exception($"Invalid scanner GUID : {scannerGUID}");

                // 检测配置合法性
                scanner.CheckConfigError();

                // 开始扫描工作
                ScanReport report = scanner.RunScanner();
                report.CheckError();

                // 返回扫描结果
                return new ScannerResult(report);
            }
            catch (Exception e)
            {
                return new ScannerResult(e.Message, e.StackTrace);
            }
        }

        /// <summary>
        /// 获取指定的扫描器
        /// </summary>
        public AssetArtScanner GetScanner(string scannerGUID)
        {
            foreach (var scanner in Scanners)
            {
                if (scanner.ScannerGUID == scannerGUID)
                    return scanner;
            }

            Debug.LogWarning($"Not found scanner : {scannerGUID}");
            return null;
        }
    }
}