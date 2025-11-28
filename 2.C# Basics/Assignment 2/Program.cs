
using System.Collections.Specialized;
using System.Drawing;

namespace Assignment_2
{
    internal class Program
    {
        class Point
        {
            public string name;
        }
        static void Main(string[] args)
        {
            #region Qu_1
            int n;
            n = int.Parse(Console.ReadLine());
            Console.WriteLine(n);
            #endregion

            #region Qu_2
            string number = "123asd";
            number = Console.ReadLine();
            number = int.Parse(number).ToString();

            /* 
             * if the string contain non-numeric characters.
             --> it will crash with an exception.
             * else it will work well
            */
            #endregion

            #region Qu_3
            double num1, num2;
            num1 = double.Parse(Console.ReadLine());
            num2 = double.Parse(Console.ReadLine());
            // Add
            Console.WriteLine($"Sum :  {num1 + num2}");

            // Subtract
            Console.WriteLine($"subtraction : {num1 - num2}");

            // divide
            Console.WriteLine($"Division : {num1 / num2}");

            // multiplication
            Console.WriteLine($"multiplication : {num1 * num2}");
            #endregion

            #region Qu_4
            string s;
            s = Console.ReadLine();
            Console.WriteLine(s.Substring(1, 4));
            #endregion

            #region Qu_5
            int orignal = 7;
            int copy = orignal;
            orignal += 10;
            Console.WriteLine(orignal);
            Console.WriteLine(copy);
            /*
             * orignal will be changed  
             * copy will not be changed 
              --> because its data type is valued not reference
             * the change in the orignal will not effect the copy
            */
            #endregion

            #region Qu_6
            Point s1 = new Point();
            Point s2 = new Point();
            s1.name = "Asmaa"; s2.name = "El Sayed";
            s2 = s1;
            s1.name = "Ahmed";
            Console.WriteLine(s1.name);
            Console.WriteLine(s2.name);
            /*
             * orignal will be changed  
             * copy will be changed 
              --> because its data type is reference type
             * the change in the orignal will effect the copy
            */
            #endregion

            #region Qu_7
            string str1, str2;
            str1 = Console.ReadLine();
            str2 = Console.ReadLine();
            Console.WriteLine(str1 + str2);
            #endregion

            #region Qu_8
            // b ) A value 1 will be assigned to d.
            #endregion

            #region Qu_9
            // d)  6 1
            #endregion

            #region Qu_10
            // d) 7 7
            #endregion

        }
    }
}
