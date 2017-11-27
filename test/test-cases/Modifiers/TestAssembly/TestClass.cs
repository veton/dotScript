#pragma warning disable CS0169, CS0649
namespace TestSolution.TestAssembly
{
    public abstract class TestClass
    {
        #region Fields

        private string PrivateField;
        internal string InternalField;
        public static string StaticField;
        public readonly string ReadOnlyField;
        public string ReadWriteField;

        #endregion


        #region Properties

        private string PrivateProperty { get; }
        internal string InternalProperty { get; }
        public static string StaticProperty { get; }
        public string ReadOnlyProperty { get; }
        public string WriteOnlyProperty { set { } }
        public string ReadWriteProperty { get; set; }
        public abstract string AbstractProperty { get; set; }

        #endregion


        #region Indexers

        public string this[object i] => null;
        public string this[string i1, string i2] => null;
        public string this[string i] => null;
        public string this[int i]
        {
            get => throw new System.NotImplementedException();
            set => throw new System.NotImplementedException();
        }

        #endregion
    }
}
