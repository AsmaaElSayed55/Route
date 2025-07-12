using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task
{
    internal class Credit_Card_Payment : Payment
    {
        public string Card_Number()
        {
            return card_number;
        }
        public override void Process_Payment()
        {
            Console.WriteLine($"Processing Credit Card Payment Of {Amount()} Using Card {card_number}");
        }

    }

}
