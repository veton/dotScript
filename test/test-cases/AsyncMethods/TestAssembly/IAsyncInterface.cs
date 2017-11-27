using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TestSolution.TestAssembly
{
    public interface IAsyncInterface
    {
        Task VoidMethodAsync();
        Task<string> MethodAsync();
        void MethodWithAsyncParams(Task<string> param1);
    }
}