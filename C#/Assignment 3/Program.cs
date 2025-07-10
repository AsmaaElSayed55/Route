namespace Assignment_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Q1
            /*
             Write a program that takes a number from the user then print yes if that number can be divided by 3 and 4 otherwise print no.
            */
            int.TryParse(Console.ReadLine(), out int num);
            if (num % 3 == 0 && num % 4 == 0)
                Console.WriteLine("yes");
            else Console.WriteLine("no");
            #endregion
            #region Q2
            /*
            Write a program that allows the user to insert an integer then print negative if it is negative number otherwise print positive.
            */
           // int.TryParse(Console.ReadLine(), out int num);
            if (num < 0)
                Console.WriteLine("Negative");
            else Console.WriteLine("Positive");
            #endregion
            #region Q3
            /*
             Write a program that takes 3 integers from the user then prints the max element and the min element.
 
            */
            int.TryParse(Console.ReadLine(), out int num1);
            int.TryParse(Console.ReadLine(), out int num2);
            int.TryParse(Console.ReadLine(), out int num3);
            if (num1 >= num2 && num1 >= num3)
                Console.WriteLine($"max element : {num1}");
            else if (num2 >= num1 && num2 >= num3)
                Console.WriteLine($"max element : {num2} ");
            else if (num3 >= num1 && num3 >= num2)
                Console.WriteLine($"max element : {num3}");


            if (num1 <= num2 && num1 <= num3)
                Console.WriteLine($"min element : {num1}");
            else if (num2 <= num1 && num2 <= num3)
                Console.WriteLine($"min element : {num2}");
            else if (num3 <= num1 && num3 <= num2)
                Console.WriteLine($"min element : {num3}");

            #endregion
            #region Q4
            /*
             * 4- Write a program that allows the user to insert an integer number then check If a number is even or odd.

             * */
           // int.TryParse(Console.ReadLine(), out int num);
            if (num % 2 == 0)
                Console.WriteLine("Even Number");
            else Console.WriteLine("Odd Number");
            #endregion
            #region Q5
            /*
             * 5- Write a program that takes character from the user then if it is a vowel chars (a,e,I,o,u) then print (vowel) otherwise print (consonant).

             * */
            char c = Console.ReadKey().KeyChar;
            switch (c)
            {
                case 'i':
                    Console.WriteLine("vowel");
                    break;
                case 'o':
                    Console.WriteLine("vowel");
                    break;
                case 'u':
                    Console.WriteLine("vowel");
                    break;
                case 'e':
                    Console.WriteLine("vowel");
                    break;
                case 'a':
                    Console.WriteLine("vowel");
                    break;
                default:
                    Console.WriteLine("consonant");
                    break;
            }
            #endregion
            #region Q10
            /*
             * 10- Write a program to enter marks of five subjects and calculate total, average and percentage.

             * */
            double mark1, mark2, mark3, mark4, mark5, sum = 0;
            mark1 = double.Parse(Console.ReadLine());
            mark2 = double.Parse(Console.ReadLine());
            mark3 = double.Parse(Console.ReadLine());
            mark4 = double.Parse(Console.ReadLine());
            mark5 = double.Parse(Console.ReadLine());
            sum = mark1 + mark2 + mark3 + mark4 + mark5;
            Console.WriteLine($"Total marks : {sum}");
            Console.WriteLine($"Average Marks : {sum / 5.0}");
            Console.WriteLine($"Percentage : {sum / 500 * 100}");

            #endregion
            #region Q11
            /*
              Write a program to input the month number and print the number of days in that month.

             */
            int.TryParse(Console.ReadLine(), out int n);
            switch (n)
            {
                case 1:
                    Console.WriteLine(31);
                    break;
                case 2:
                    Console.WriteLine(28);
                    break;
                case 3:
                    Console.WriteLine(31);
                    break;
                case 4:
                    Console.WriteLine(30);
                    break;
                case 5:
                    Console.WriteLine(31);
                    break;
                case 6:
                    Console.WriteLine(30);
                    break;
                case 7:
                    Console.WriteLine(31);
                    break;
                case 8:
                    Console.WriteLine(31);
                    break;
                case 9:
                    Console.WriteLine(30);
                    break;
                case 10:
                    Console.WriteLine(31);
                    break;
                case 11:
                    Console.WriteLine(30);
                    break;
                case 12:
                    Console.WriteLine(31);
                    break;
                default:
                    Console.WriteLine("Invalid Month Number ");
                    break;
            }
            #endregion
            #region Q12
            /*
              Write a program to create a Simple Calculator.

             * */
            int.TryParse(Console.ReadLine(), out int n1);
            int.TryParse(Console.ReadLine(), out int n2);
            
            Console.WriteLine($"Sumation : {n1+n2}");
            Console.WriteLine($"Subtraction : {n1 - n2}");
            Console.WriteLine($"Multiplcation : {n1 * n2}");
            Console.WriteLine($"Divition : {n1 / n2}");

            #endregion
        }
    }
}
