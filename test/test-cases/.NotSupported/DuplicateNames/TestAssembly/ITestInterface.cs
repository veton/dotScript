namespace TestSolution.TestAssembly
{
    public interface ITestInterface :
        TestSolution.ReferencedAssembly.ITestInterface,
        TestSolution.ReferencedAssembly.ChildScope.ITestInterface,
        TestSolution.TestAssembly.ChildScope.ITestInterface
    {
    }
}