using TestSolution.ReferencedAssembly;

namespace TestSolution.TestAssembly
{
    public class GenericClass<T1> : GenericBaseClass<T1, string>, IGenericInterface<T1>
    {
        public IGenericInterface<T1> Property3 { get; set; }
        public GenericBaseClass<IGenericInterface<string>, IGenericInterface<decimal>> Property4 { get; set; }
    }
}