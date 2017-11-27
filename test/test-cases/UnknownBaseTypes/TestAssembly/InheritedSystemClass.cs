using System;
using System.Text;

namespace TestSolution.TestAssembly
{
    public class InheritedSystemClass : UTF8Encoding, IInternalInterface, IDisposable
    {
        public void Dispose() { }
    }
}