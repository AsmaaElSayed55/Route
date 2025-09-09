
using System.Net.Cache;
using System.Text;

namespace Session_4_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {

            #region Evolution Of Switch In C#

            #region C# 7
            // I Can Much Logic In One Case

            object obj1 = new object();
            obj1 = 10; // Boxing
            switch (obj1)
            {
                // This Checks If LoacalInput is of type Int
                case int LocalInput when LocalInput > 10 && LocalInput < 20:
                    Console.WriteLine("This Is Integer Input");
                    break;
                case double LocalInput:
                    Console.WriteLine("This Is Double Input");
                    break;
                case Person LocalInput:
                    Console.WriteLine("This Is Person Input");
                    break;
                default:
                    break;
            }

            #endregion

            #region C# 8
            // Improve In Switch Sentax

            Console.WriteLine("Enter Your Option");
            int.TryParse(Console.ReadLine(), out int option);
            string Message;
            #region Before
            switch (option)
            {
                case 1:
                    Console.WriteLine("Option 1");
                    break;
                case 2:
                    Console.WriteLine("Option 2");
                    break;
                case 3:
                    Console.WriteLine("Option 3");
                    break;
                default:
                    Console.WriteLine("Invalid Option");
                    break;
            }
            #endregion

            #region After
            Message = option switch
            {
                1 => "Option 1",
                2 => "Option 2",     // Options
                3 => "Option 3",
                _ => "Invalid Option"  // defualt 
            };
            #endregion

            #endregion

            #region C# 9
            // 

            Person person = new Person() { Id = 10, Name = "Asmaa El Sayed" };
            string message = string.Empty;
            message = person switch
            {
                { Id: 10, Name: "Asmaa El Sayed", Age: > 20 and < 25 } => $"Hello {person.Name}, Your Age:{person.Age} ",
                { Id: 20, Age: 30 } => $"Hello Anonymous , Your Age is {person.Age}",
                _ => "UnKnown User"
            };

            #endregion

            #endregion

            #region Loops

            #region For Loop
            int.TryParse(Console.ReadLine(), out int n);
            for (int i = 0; i < n; i++)
            {
                Console.Write(i + " ");
            }
            #endregion

            #region Foreach Loop

            int[] arr = { 1, 2, 3, 4, 5, 2, 3, 5 };
            foreach (int i in arr)
                Console.Write(i + " ");

            #endregion

            #region While Loop

            int.TryParse(Console.ReadLine(), out int N);
            while (N > 0)
            {
                Console.Write(N-- + " ");
            }
            #endregion

            #region Do While Loop

            // Inter Positive Number 

            int.TryParse(Console.ReadLine(), out int num);
            do
            {
                int.TryParse(Console.ReadLine(), out num);
            }
            while (num <= 0);

            // To Make Sure That He Enters Number not any Thing
            bool ok = false;
            do
            {
                ok = int.TryParse(Console.ReadLine(), out num);
            }
            while (num % 2 == 1 || !ok); // if num is not even (odd) or num is not integer

            #endregion

            #endregion

            #region String
            // Is Built In Class ( Reference Data Type ) :Internally Is An Array Of Chars
            // Array Is Fixed Size 
            #region Part 1
            string Name;
            /*
             * Declare For Reference 'Name' Of Type String 
             * This Reference 'Name' Is Referencing To The Default Value Of The Reference Types = null
             * CLR Will Allocate 4 Bytes For THe Reference 'Name' in Stack
             * CLR Will Allocate 0 Bytes in Heap
            */
            Name = new string("Asmaa"); // is done by default
            Name = "Asmaa";// Syntax Suger  // CLR Will Allocate 10 Bytes Initialized With 'Asmaa'

            Name = "Ahmed"; // 
            #endregion
            #region Example 1

            string Name1 = "Asmaa";
            string Name2 = "Ahmed";
            Console.WriteLine($"Name 1: {Name1}");
            Console.WriteLine($"Name 2: {Name2}");
            Console.WriteLine($"------------------");
            Console.WriteLine($"Name 1: {Name1} , GetHashCode : {Name1.GetHashCode()} ");
            Console.WriteLine($"Name 2: {Name2} , GetHashCode : {Name2.GetHashCode()} ");

            #endregion
            #region Example 2

            string Name3 = "Asmaa";
            string Name4 = "Ahmed";
            Console.WriteLine($"Name 1: {Name3}");
            Console.WriteLine($"Name 2: {Name4}");
            Console.WriteLine($"------------------");
            Console.WriteLine($"Name 1: {Name3} , GetHashCode : {Name3.GetHashCode()} ");
            Console.WriteLine($"Name 2: {Name4} , GetHashCode : {Name4.GetHashCode()} ");

            Name3 = Name4;
            /*
             * Name 3 Has 2 References Name3 & Name4
             */

            Console.WriteLine($"Name 1: {Name3}");
            Console.WriteLine($"Name 2: {Name4}");
            Console.WriteLine($"------------------");
            Console.WriteLine($"Name 1: {Name3} , GetHashCode : {Name3.GetHashCode()} ");
            Console.WriteLine($"Name 2: {Name4} , GetHashCode : {Name4.GetHashCode()} ");

            Name3 = "Ali";
            /*
             * Name3 has changed to a new Reference 
             * Name4 did not Change 
             */
            Console.WriteLine($"Name 1: {Name3}");
            Console.WriteLine($"Name 2: {Name4}");
            Console.WriteLine($"------------------");
            Console.WriteLine($"Name 1: {Name3} , GetHashCode : {Name3.GetHashCode()} ");
            Console.WriteLine($"Name 2: {Name4} , GetHashCode : {Name4.GetHashCode()} ");

            #endregion

            #endregion

            #region String Builder

            // Is A Class Internally Is Linked List
            StringBuilder sb = new StringBuilder();
            sb.Append("Hello");
            Console.WriteLine(sb.ToString());
            Console.WriteLine($"sb.GetHashCode: {sb.GetHashCode()}");
            Console.WriteLine("Enter Your Name");
            string Name5 = Console.ReadLine();
            sb.Append($"{Name5}");
            Console.WriteLine("-------------------");
            Console.WriteLine(sb.ToString());
            Console.WriteLine($"sb.GetHashCode : {sb.GetHashCode()}");

            #region String Builder Methods
            StringBuilder sb1 = new StringBuilder("Hello");
            Console.WriteLine(sb1);

            // Append
            sb1.Append("Asmaa"); // Push (add) new string in the end to sb1
            Console.WriteLine(sb1.ToString());

            // AppendLine
            sb1.AppendLine("Ahmed");
            Console.WriteLine(sb1.ToString());

            // Append by a Format
            sb1.AppendFormat("{0}+{1}={3}{3}", 5, 8, 13, true);
            Console.WriteLine(sb1.ToString());

            // Append Join
            sb1.AppendJoin("Asmaa","Nada");
            Console.WriteLine(sb1.ToString());

            // copyTo
            char[] Chars=new char[10];
            sb1.CopyTo(0, Chars, 0, 3);
            foreach(char c in Chars)
            {
                Console.WriteLine(c);
            }

            // Insert
            sb1.Insert(0, "Amany");
            Console.WriteLine(sb1.ToString());

            // Remove
            sb1.Remove(0, 3);
            Console.WriteLine(sb1.ToString());

            // Reblace
            sb1.Replace("l", ",");
            Console.WriteLine(sb1.ToString());

            #endregion

            #endregion


        }
    }
}
