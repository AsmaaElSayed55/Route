using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session_One.UserDefinedDataTypes
{
    internal struct MyStruct // Not allow Inhiretance
    {
        // access modifiers  (3)
        // 1] internal   2] public   3] private
        // By default access modifier inside struct --> private 

        // I Can Write in struct
        // 1] attributes [field] 
        int x;
        // 2] properties [ Automatic prop , full prop , indexer ]  
        public int Id { get; set; }
        // 3] events
        // 4] functions [ methods]
        internal void MyFun()
        {
            Console.WriteLine("Hello");
        }

    }
}
