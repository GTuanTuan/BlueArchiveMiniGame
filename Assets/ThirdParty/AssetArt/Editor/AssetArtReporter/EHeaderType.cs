// Adapted from YooAsset 2.3.17 AssetArt editor tools (MIT); no YooAsset 2 runtime dependency.
using YooAsset.Editor;

namespace BA.AssetArt
{
    public enum EHeaderType
    {
        /// <summary>
        /// 资源路径
        /// </summary>
        AssetPath,

        /// <summary>
        /// 资源对象
        /// </summary>
        AssetObject,

        /// <summary>
        /// 字符串
        /// </summary>
        StringValue,

        /// <summary>
        /// 整数数值
        /// </summary>
        LongValue,

        /// <summary>
        /// 浮点数数值
        /// </summary>
        DoubleValue,
    }
}