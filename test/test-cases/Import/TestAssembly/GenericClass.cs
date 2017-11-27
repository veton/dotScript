using TestSolution.ReferencedAssembly;

namespace TestSolution.TestAssembly
{
    public class GenericClass<T1> : GenericBaseClass<string, IGenericInterface<T1>>, IGenericInterface<T1>
    {
        public GenericBaseClass<string, IGenericInterface<T1>> Property1 { get; set; }
        public IGenericInterface<T1> Property2 { get; set; }
    }
}