// Adapted from YooAsset 2.3.17 AssetArt editor tools (MIT); no YooAsset 2 runtime dependency.
using YooAsset.Editor;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BA.AssetArt
{
    public abstract class ScannerSchema : ScriptableObject
    {
        /// <summary>
        /// 获取用户指南信息
        /// </summary>
        public abstract string GetUserGuide();

        /// <summary>
        /// 运行生成扫描报告
        /// </summary>
        public abstract ScanReport RunScanner(AssetArtScanner scanner);

        /// <summary>
        /// 修复扫描结果
        /// </summary>
        public abstract void FixResult(List<ReportElement> fixList);

        /// <summary>
        /// 创建检视面板
        /// </summary>
        public virtual SchemaInspector CreateInspector()
        {
            return null;
        }
    }
}