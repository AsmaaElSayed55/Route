using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task
{
    internal class Payment
    {
        //private double amount;
        public double amount { set; get; }
        public string card_number { set; get; }
        public double Amount()
        {
            return amount;
        }
        public virtual void Process_Payment()
        {
            Console.WriteLine($"Processing Payment Of {amount}...");
        }
    }
}
