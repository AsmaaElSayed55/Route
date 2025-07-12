using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task
{
    internal class Cash_Payment:Payment
    {
        public override void Process_Payment()
        {
            Console.WriteLine($"Processing Cash Payment Of {Amount()}");
        }
    }
}
