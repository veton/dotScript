using System;
using System.Collections.Generic;
using System.Threading.Tasks;

#pragma warning disable CS0108
namespace TestSolution.TestAssembly
{
    public interface ITestInterface : IDisposable, IDictionary<string, int>, IEnumerable<bool>
    {
        #region Properties

        string ReadOnlyProperty { get; }
        string ReadWriteProperty { get; set; }

        #endregion


        #region Indexers

        int this[string i] { get; }
        string this[int i] { get; set; }
        string this[object i] { get; }
        string this[string i1, string i2] { get; set; }

        #endregion


        #region Methods

        void VoidMethod();
        string ParametrizedMethod(int arg1, string arg2, object arg3);

        #endregion
    }
}
