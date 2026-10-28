// Adapted from YooAsset 2.3.17 AssetArt editor tools (MIT); no YooAsset 2 runtime dependency.
using YooAsset.Editor;
using System;
using System.Collections;
using System.Collections.Generic;

namespace BA.AssetArt
{
    [Serializable]
    public class ReportScanInfo
    {
        /// <summary>
        /// 标题
        /// </summary>
        public string HeaderTitle;

        /// <summary>
        /// 扫描反馈的信息
        /// </summary>
        public string ScanInfo;

        public ReportScanInfo(string headerTitle, string scanInfo)
        {
            HeaderTitle = headerTitle;
            ScanInfo = scanInfo;
        }
    }
}