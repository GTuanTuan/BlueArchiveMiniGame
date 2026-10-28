using UnityEngine;
using YooAsset;
namespace BA.Bootstrap
{
    public sealed class StartupAssetOwner : MonoBehaviour
    {
        private AssetHandle _handle;
        public void Own(AssetHandle handle) { _handle = handle; }
        private void OnDestroy() { _handle?.Release(); _handle = null; }
    }
}
