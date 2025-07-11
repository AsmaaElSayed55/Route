namespace Session_3_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {

            #region Fractions and Discard

            float f = 3.5f; // f to make it float 
            decimal d = 15.34M; // M to make it decimal
            double D = 234.567;
            long l = 1000_000_000_000_000; // put _ to be readable
                                           // Just for Defeloper
            #endregion

            #region Implicict Casting & Explicict Casting

            #region Implicict 

            int a = 10;
            long g = (long)a; // Implicict 

            double h = (double)g; // Implicict
            #endregion

            #region Explicict
            long A = 1000_000_000_000_000_000;
            int B = (int)A; // Explicict
                            // if A is small as int size ( int can take it) , it will take the same value of it 
                            // if A is bigger than int size ( int can not take it) , it will give rondam value

            checked
            {

                B = A.GetType() == typeof(int) ? (int)A : 0; // if it is possible to make explicict , do it 
                                                             // else make it 0;
                B = (int)A;

                unchecked
                {
                    Console.WriteLine(B);
                }
            }

            A = (int)h; // Explicict Casting
            Console.WriteLine(A);

            #endregion

            #endregion

            #region Casting

            #region Convert

            // Convert --> Class Contain A Ser Of Function/Methods Used For Casting From Data Type To Another
            Console.WriteLine("Enter Your Name");
            string? Name = Console.ReadLine();
            Console.WriteLine("Enter Your Age");
            int age = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Your Salary");
            double salary = Convert.ToDouble(Console.ReadLine());

            Console.Clear(); // Clear The Console Screen
            Console.WriteLine($"Name Is {Name}");
            Console.WriteLine($"Age = {age}");
            Console.WriteLine($"Salary Is {salary}");

            #endregion

            #region Parse
            // Parse -- > Method Used To Convert String Representation Of A Number Into A Numeric Type
            Console.WriteLine("Enter Your Name");
            string? Name = Console.ReadLine();
            Console.WriteLine("Enter Your Age");
            int age = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter Your Salary");
            double salary = double.Parse(Console.ReadLine());

            Console.Clear(); // Clear The Console Screen
            Console.WriteLine($"Name Is {Name}");
            Console.WriteLine($"Age = {age}");
            Console.WriteLine($"Salary Is {salary}");

            #endregion

            #region Try Parse

            int.TryParse(Console.ReadLine(), out int input); // return default value of this data type if it impossible to cast this data type
            Console.WriteLine(input);

            // Example
            string Num = "hello";
            int Y;
            Y = Convert.ToInt32(Num);
            Console.WriteLine(Y);
            Y = int.Parse(Num);
            Console.WriteLine(Y);
            int.TryParse(Num, out Y); // return default value of this data type if it impossible to cast this data type
            Console.WriteLine(Y);

            #endregion

            #endregion

            #region Operators
            int num1 = 20, num2 = 30;
            #region Unary 
            // Prefex

            Console.WriteLine(++num1); // plus First then Print
            Console.WriteLine(--num2); // Minus First then Print

            // Postfix
            Console.WriteLine(num2++); // Print First then Plus 
            Console.WriteLine(num1--); // Print First then Minus

            #endregion

            #region Binary

            Console.WriteLine(num1 + num2);
            Console.WriteLine(num1 - num2);
            Console.WriteLine(num1 * num2);
            Console.WriteLine(num1 / num2);
            Console.WriteLine(num1 % num2);

            #endregion

            #region Assignment

            num1 += 2;
            num2 -= 1;
            num2 = 40;
            num1 *= num2;
            num2 /= num1;
            num1 %= 2;

            #endregion

            #region Relational

            if (num1 > num2)
                Console.WriteLine("num1 is bigger than num2 ");
            if (num1 < num2)
                Console.WriteLine("num1 is smaller than num2 ");
            if (num1 >= num2)
                Console.WriteLine("num1 is bigger than or equal num2 ");
            if (num1 <= num2)
                Console.WriteLine("num1 is smaller than or equal num2 ");
            if (num1 == num2)
                Console.WriteLine("num1 is equal to num2 ");

            #endregion

            #region Logical

            if (num1 > num2 && num1 > 10) // Should before and after of ( && ) be true
                Console.WriteLine("num1 is bigger than num2 and num1 bigger than 10");
            if (num1 < num2 || num2 > 20) // Should before or after of ( && ) be true
                Console.WriteLine("num1 is smaller than num2 ");
            if (!(num1 >= num2)) // // Should Condition is false
                Console.WriteLine("num1 is bigger than or equal num2 ");

            #endregion

            #region Bitwise

           // work on the bits of number
            Console.WriteLine(num1 & 2);
            Console.WriteLine(num2 | 10);
            Console.WriteLine(num2 ^ 40);
            Console.WriteLine(num2 << 2);
            Console.WriteLine(num1 >> 2);
            Console.WriteLine(~num1);

            #endregion

            #region Ternary
            // 
               Console.WriteLine((num1 > num1) ? "num1 is bigger thannum2" : "num2 is bigger than num1");
            #endregion

            #endregion

            #region String Formating 
            /*
             * byte --> By default Unsigned data type
             * short --> By default signed data type
             * 
            */

            int i = 1000000;
            i = 0x_00_00_FA_12; // hexadecimal
            byte b = 0b_0101_1100; // Binary
            int x, y;
            int.TryParse(Console.ReadLine(), out x);
            int.TryParse(Console.ReadLine(), out y);

            // using +
            Console.WriteLine("Equation : " + x + " + " + y + " = " + (x + y));

            // 
            string msg = string.Format("Equation : {0} + {1} = {2} ", x, y, x + y); // until C#5
            Console.WriteLine(msg);

            // $ --> String Manipulation Operator
            string Msg = string.Format($"Equation : {x} + {y} = {x + y}"); // 
            Console.WriteLine(Msg);

            #endregion

            #region if else

            if (x >= 0)
                Console.WriteLine("Natural Number");
            else
                Console.WriteLine("Integer Number");

            if (x == 3)
                Console.WriteLine("x= ", 3);
            else if (y == 4)
                Console.WriteLine("x= ", 4);
            else if (y == 5)
                Console.WriteLine("x= ", 5);
            else if (y == 46)
                Console.WriteLine("x= ", 6);
            else
                Console.WriteLine("it is ", x);

            int.TryParse(Console.ReadLine(), out int Age);
            if (Age > 20)
                Console.WriteLine("Your Age Is Greater Than 20");
            else if (Age < 20)
                Console.WriteLine("Your Age Is Less Than 20");
            else
                Console.WriteLine("Your Age Equal 20");

            #endregion

            #region Switch

            #region Normal Switch
            switch (x)
            {
                case 0:
                    Console.WriteLine("X= ", false);
                    break;
                case 1:
                    Console.WriteLine("X= ", true);
                    break;
                case 2:
                    Console.WriteLine("X= ", x);
                    break;
                default:
                    break;
            }
            #endregion

            #region Switch With Many Cases
            switch (x)
            {
                case 0:
                    Console.WriteLine("X= ", false);
                    break;
                case 1:
                case 2:
                    Console.WriteLine("X= ", true);
                    break;
                case 3:
                case 4:  // I Can Collect many cases in one step if they have the same result in action 
                case 5:
                    Console.WriteLine("X= ", x);
                    break;
                default:
                    break;
            }
            #endregion

            #region Switch With GoTo
            string str = Console.ReadLine();
            switch (str)
            {
                case "Asmaa":
                    Console.WriteLine("The Str is ", str);
                    break;
                case "Amany":
                    Console.WriteLine("Your name is ", str);
                    goto case "Ahmed"; // if this case has the same action of another case + another action only for it  
                case "Ahmed":
                    Console.WriteLine("Your name is nice");
                    Console.WriteLine(str);
                    break;
                default:
                    Console.WriteLine("Not This ");
                    break;
            }
            #endregion

            #endregion

            #region Block Statment 

           // int j; --> this give error in declaration in next Scope
             Block Statment
            {
                int j = 0; // Block Scope
                j += 5;
                Console.WriteLine(j);
            } // End Of i Scope

            #endregion

            #region Task
            string s;
            s = Console.ReadLine();
            switch (s)
            {
                case "admin":
                    Console.WriteLine("Full Acces granted");
                    break;
                case "user":
                    Console.WriteLine("Limited Acces granted");
                    break;
                case "guest":
                    Console.WriteLine("View Only Acces");
                    break;
                default:
                    Console.WriteLine("Invalid role");
                    break;
            }
            if (s == "admin")
                Console.WriteLine("Full Acces granted");
            else if (s == "user")
                Console.WriteLine("Limited Acces granted");
            else if (s == "guest")
                Console.WriteLine("View Only Acces");
            else
                Console.WriteLine("Invalid role");

            //int number;
            int sum = 0, num = 0, amount = 0;
            int.TryParse(Console.ReadLine(), out int Number1);
            int.TryParse(Console.ReadLine(), out int Number2);
            int.TryParse(Console.ReadLine(), out int Number3);
            int[] arr = { Number1, Number2, Number3 };
            foreach (var item in arr)
            {
                Console.WriteLine(item);
            }
            while (num < 3)
            {
                int.TryParse(Console.ReadLine(), out int Number);
                sum += Number;
                num++;
                if (Number % 2 == 1) amount++;
            }

            #endregion

        }
    }
}
