using System;

namespace TestSolution.TestAssembly
{
    public interface ITestInterface
    {
        EventHandler Delegate { get; set; }

        event EventHandler Event;
    }
}