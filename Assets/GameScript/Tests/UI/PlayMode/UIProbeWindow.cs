namespace BA.UI.Tests
{
    // Counters are properties, so a clone does not inherit the template's lifecycle counts.
    public sealed class UIProbeWindow : UIBaseWindow
    {
        public int EnableCount { get; private set; }
        public int InitializeCount { get; private set; }
        public int ShowCount { get; private set; }
        public int HideCount { get; private set; }

        private void OnEnable() => EnableCount++;
        protected override void OnInitialize() => InitializeCount++;
        protected override void OnShow() => ShowCount++;
        protected override void OnHide() => HideCount++;
    }
}
