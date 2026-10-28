using System.Collections.Generic;
using YooAsset;
namespace BA.Bootstrap
{
    public sealed class PatchRemoteService : IRemoteService
    {
        private readonly string _root;
        public PatchRemoteService(string root) { _root = root.TrimEnd('/'); }
        public IReadOnlyList<string> GetRemoteUrls(string fileName) => new[] { _root + "/" + fileName };
    }
}
