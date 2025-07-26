using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session_One.UserDefinedDataTypes
{
    internal interface I_MyInterface
    {
        // access modifiers  (6)
        // 1] internal   2] public  --> By Default   3] private --> Only used in Default Imp Method
        // 4] protected   5] private protected    6] internal protected
        // By default access modifier inside struct --> private 


        // inside interface 
        // 1] Signature For Method  --> C# 7
        void MyFun(int x,int y);
        // 2] Signature For Prop   --> C# 7
        public int Id { get; set; }
        // 3] Default Implemented Method --> start in .net core 3.1 ( C# 8 ) --> 2019
        private void Helper()
        {
            Console.WriteLine("Hello From Default Imp Method");
        }
        void Print()
        {
            Helper();
            Console.WriteLine("Hello");
        }
    }
}
