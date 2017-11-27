#pragma warning disable CS0169, CS0649
namespace TestSolution.TestAssembly
{
    public interface ITestInterface
    {
        string ReadOnlyProperty { get; }
        string ReadWriteProperty { get; set; }
        string Method();
    }
}
