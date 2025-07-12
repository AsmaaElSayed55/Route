namespace Task
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Payment ob;
            Console.WriteLine($"Enter Number Of Payment");
            int.TryParse(Console.ReadLine(), out int n);
            Payment[] arr = new Payment[n];

            for (int i = 0; i < n; i++)
            {
                arr[i] = new Payment();
                Console.WriteLine($"Enter Card Number For Payment {i + 1}");
                arr[i].card_number = Console.ReadLine();
                //double.TryParse(Console.ReadLine(), out arr[i].amount);
                double tempAmount;
                Console.WriteLine($"Enter Amount For Payment {i + 1}");
                if (double.TryParse(Console.ReadLine(), out tempAmount))
                {
                    arr[i].amount = tempAmount;
                }
            }
            for (int i = 0; i < n; i++)
            {
                Console.WriteLine($"Card Number Is {arr[i].card_number}");
                Console.WriteLine($"Amount Is {arr[i].amount}");
            }

        }
    }
}
