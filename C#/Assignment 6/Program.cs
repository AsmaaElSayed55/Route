namespace Assignment_6
{
    internal class Program
    {
        public static void change_number1(int number)
        {
            number += 10;
        }
        public static void change_number2(ref int number)
        {
            number += 10;
        }
        public static void change_name1(string name)
        {
            name = "Ahmed";
        }
        public static void change_name2(ref string name)
        {
            name = "Ali";
        }
        public static void Change_Array1(int[] Array) // passing by value
        {
            if (Array?.Length > 0) // check if it not null
            {
                for (int i = 0; i < Array.Length; i++)
                {
                    Array[i]+=8;
                }
            }
        }
        public static void Change_Array2(ref int[] Array) // passing by Reference
        {
            if (Array?.Length > 0) // check if it not null
            {
                for (int i = 0; i < Array.Length; i++)
                {
                    Array[i] += 8;
                }
            }
        }
        
        static KeyValuePair<int,int> Sum(int x,int y , int z , int s)
        {
            return new KeyValuePair<int, int>(x + y, z - s);
        }

        public static int Sum_Digits(int num)
        {
            int res = 0;
            while (num > 0)
            {
                res += num % 10;
                num /= 10;
            }
            return res;
        }
        public static bool Is_Prime(int num)
        {
            bool ok = true;
            if(num<2)ok=false;
            for(int i = 2;i*i<=num;i++)
            {
                if(num%i==0)ok=false;
            }
            return ok;
        }
        static KeyValuePair<int, int> MinMaxArray(ref int[] arr)
        {
            int mn = 0,mx=0;
            if (arr?.Length > 0) // check if it not null
            {
                mn = arr.Min(); 
                mx = arr.Max();
            }
            return new KeyValuePair<int, int>(mn,mx);
        }
        public static long Factorial(long num)
        {
            long res = num;
            for (long i = 1; i < num; i++)
                res =res * i;
            return res;
        }
        public static void String_Modefy(ref string s,int index,string replace)
        {
            s.Insert(index,replace);
            Console.WriteLine(s);
        }
        static void Main(string[] args)
        {
            #region Qu 1
            /*
             1- Explain the difference between passing (Value type
             parameters) by value and by reference then write a suitable c#
             example.
             */

            // Passing Value Type By Value --> I Send a Copy from the Required Parameters
            // Passing Value Type By Reference --> I Send The Address Of the Required Parametars
            int num = 6;
            change_number1(num);
            Console.WriteLine(num); // Print 6 --> not Changed
            change_number2(ref num);
            Console.WriteLine(num); // Print 16 --> Has Changed
            #endregion

            #region Qu 2 // Why Sring Dosen't Have Changed When I Call By Value As Array
            /*
             2- Explain the difference between passing (Reference type
             parameters) by value and by reference then write a suitable c#
             example.
             */
            // Passing Value Type By Value --> I Send a Copy from this Reference Type Parameters --> I Send Copy Of Its Address
            // Passing Value Type By Reference --> I Send The Address Of the Required Parameters
            String Name;
            Name = "Asmaa";
            int[] arr = new int[] { 2, 4, 1, 5, 7, 3 };

            change_name1(Name); // 
            Change_Array1(arr);
            Console.WriteLine(Name); // Print Asmaa --> not Changed
            Console.WriteLine(arr[0]); // Print 10 ((Last Version in Memory)+8)
                                       // --> Has Changed  -> Because i Call By Reference and it is reference type
                                       // --> Changing Has done in its Address in Memory

            ///////////////////////////////////////
            change_name2(ref Name);
            Change_Array2(ref arr);
            Console.WriteLine(Name); // Print Ali  --> Has Changed
                                     // -> Because i Call By Reference and it is reference type
                                     // --> Changing Has done in its Address in Memory

            Console.WriteLine(arr[0]); // Print 18 ((Last Version in Memory)+8)
                                       // --> Has Changed  -> Because i Call By Reference and it is reference type
                                       // --> Changing Has done in its Address in Memory

            #endregion

            #region Qu 3
            /*
             * 3- Write a c# Function that accept 4 parameters from user and
             return result of summation and subtracting of two numbers
             */
            int.TryParse(Console.ReadLine(), out int num1);
            int.TryParse(Console.ReadLine(), out int num2);
            int.TryParse(Console.ReadLine(), out int num3);
            int.TryParse(Console.ReadLine(), out int num4);
            Console.WriteLine(Sum(num1, num2, num3, num4));

            #endregion

            #region Qu 4
            /*
             * 4- Write a program in C# Sharp to create a function to calculate the sum of
             the individual digits of a given number.
             Output should be like
             Enter a number: 25
             The sum of the digits of the number 25 is: 7
             */
            int.TryParse(Console.ReadLine(), out int Number);
            Console.WriteLine(Sum_Digits(Number));
            #endregion

            #region Qu 5
            /*
             * 5- Create a function named "IsPrime", which receives an integer number
             and retuns true if it is prime, or false if it is not:
             */
            int.TryParse(Console.ReadLine(), out int number);
            Console.WriteLine(Is_Prime(number));
            #endregion

            #region Qu 6
            /*
             * 6- Create a function named MinMaxArray, to return the minimum and
             maximum values stored in an array, using reference parameters
             */
            int.TryParse(Console.ReadLine(), out int n);
            int[] array = new int[n];
            for (int i = 0; i < n; i++)
            {
                array[i] = int.Parse(Console.ReadLine());
            }
            Console.WriteLine(MinMaxArray(ref array));
            #endregion

            #region Qu 7
            /*
             * 7- Create an iterative (non-recursive) function to calculate the factorial
             of the number specified as parameter
             */
            long.TryParse(Console.ReadLine(), out long Fact);
            Console.WriteLine(Factorial(Fact));

            #endregion

            #region Qu 8      // I Can't Solve Why It Dosen't Return True Value  
            /*
             * 8- Create a function named "ChangeChar" to modify a letter in a certain
             position (0 based) of a string, replacing it with a different letter
             */
            string s = Console.ReadLine();
            char replace;
            int.TryParse( Console.ReadLine(),out int index);
            replace = Char.Parse(Console.ReadLine());
            string Replace=replace.ToString();
            String_Modefy(ref s,index,Replace);
            Console.WriteLine(s);
            #endregion

        }
    }
}
