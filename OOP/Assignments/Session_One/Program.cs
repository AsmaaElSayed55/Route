using Common;
using Session_One.UserDefinedDataTypes;
using System.Net.Http.Headers;
namespace Session_One
{
    
    internal class Program
    {
        static void Main(string[] args)
        {

            #region Class Library
            Product product = new Product();
            product.ID = 10;
            product.Name = "Test";
            product.Price = 1000;
            product.Quantity = 1;
            #endregion

            #region User Defined Data Types

            #endregion

            #region Enum
            // In Stack
            //WeekDays day = WeekDays.Saturday;
            //Console.WriteLine(day);
            foreach (WeekDays day in Enum.GetValues(typeof(WeekDays)))
            {
                Console.WriteLine(day);
            }
            // CLR --> Represent Enum As nteger Value n Memory

            #endregion
        }
    }
}
