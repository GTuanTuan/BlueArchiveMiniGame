using System;
namespace BA.Bootstrap
{
    // Stable AOT contract. Implementation and visuals live in Preload.
    public interface IPatchView
    {
        void Render(PackageUpdateProgress progress);
        void ShowFailure(string message, Action retry);
    }
}
