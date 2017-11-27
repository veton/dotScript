using System;

namespace TestSolution.TestAssembly
{
    public class TestClass
    {
        public void Method() { }

        public EventHandler Delegate { get; set; }

        public event EventHandler Event;
    }
}