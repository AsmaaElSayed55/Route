using System.Numerics;

namespace Assignment_5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Q1
            /* 
                1- Write a program that allows the user to insert an integer then
                print all numbers between 1 to that number.
            */
            //int n = int.Parse(Console.ReadLine());
            //for (int i = 1; i <= n; i++)
            //{
            //    Console.Write(i + " ");
            //}
            #endregion

            #region Q2
            /* 
                2- Write a program that allows the user to insert an integer then 
                print a multiplication table up to 12.
            */
            //int num = int.Parse(Console.ReadLine());
            //for (int i = 1; i <= 12; i++)
            //{
            //    Console.Write(num * i + " ");
            //}
            #endregion

            #region Q3
            /* 
                3- Write a program that allows to user to insert number then
                print all even numbers between 1 to this number
            */
            //int number = int.Parse(Console.ReadLine());
            //for (int i = 1; i <= number; i++)
            //{
            //    if (i % 2 == 0)
            //        Console.Write(i + " ");
            //}
            #endregion

            #region Q4
            /*                
                6- Write a program to allow the user to enter a string and print the REVERSE of it.
            */
            //string s;
            //s = Console.ReadLine();
            //for (int i = s.Length - 1; i >= 0; i--)
            //{
            //    Console.Write(s[i]);
            //}
            #endregion

            #region Q5
            /* 
                - Write a program to allow the user to enter int and print the REVERSED of it.
            */

            //int.TryParse(Console.ReadLine(), out int Number);
            //while (Number != 0)
            //{
            //    if (Number % 10 >= 1) // to handle zero in the end
            //        Console.Write(Number % 10);
            //    Number /= 10;
            //}
            #endregion

            #region Q6
            /* 
               8- Write a program in C# Sharp to find prime numbers within a range of numbers.
               Test Data :
               Input starting number of ranges: 1
               Input ending number of range : 50
               Expected Output :
               The prime number between 1 and 50 are :
               2 3 5 7 11 13 17 19 23 29 31 37 41 43 47
            */
            //int.TryParse(Console.ReadLine(), out int start);
            //int.TryParse(Console.ReadLine(), out int end);
            //for (int i = start; i <= end; i++)
            //{
            //    bool ok = true;
            //    for (int j = 2; j * j <= i; j++)
            //    {
            //        if (i % j == 0)
            //            ok = false;
            //    }
            //    if (i != 1 && ok)
            //        Console.Write(i + " ");
            //}
            #endregion

            #region Q7
            /* 
             9- Write a program in C# Sharp to convert a decimal number into binary without using an array.
             Test Data :
             Enter a number to convert :25
             Expected Output :
             The Binary of 25 is 11001.
            */
            //int.TryParse(Console.ReadLine(), out int dec_number);
            //string res = "";
            //while (dec_number > 0)
            //{
            //    if (dec_number % 2 == 0)
            //        res = "0" + res;
            //    else res = "1" + res;
            //    dec_number /= 2;
            //}
            //Console.WriteLine(res);
            #endregion

            #region Q8
            /* 
                11- . Write a program that prints an identity matrix using for loop, 
                in other words takes a value n from the user and shows the identity 
                table of size n * n.
            */
            //Console.Write("Enter number of rows: ");
            //int rows = int.Parse(Console.ReadLine());

            //Console.Write("Enter number of columns: ");
            //int cols = int.Parse(Console.ReadLine());

            //int[,] matrix = new int[rows, cols];
            //for (int i = 0; i < rows; i++)
            //{
            //    for (int j = 0; j < cols; j++)
            //    {
            //        matrix[i, j] = i * j;
            //    }
            //}
            //for (int i = 0; i < rows; i++)
            //{
            //    for (int j = 0; j < cols; j++)
            //    {
            //        Console.Write(matrix[i, j] + " ");
            //    }
            //    Console.WriteLine();
            //}
            #endregion

            #region Q9
            /* 
               12- Write a program in C# Sharp to find the sum of all elements of the array.
            */
            //int Size = int.Parse(Console.ReadLine());
            //int[] arr = new int[Size];
            //int sum = 0;
            //for (int i = 0; i < Size; i++)
            //{
            //    arr[i] = int.Parse(Console.ReadLine());
            //    sum += arr[i];
            //}
            //Console.WriteLine(sum);
            #endregion

            #region Q10
            /* 
                13- Write a program in C# Sharp to merge two arrays of the same size sorted in ascending order.
            */
            //Console.WriteLine("Enter Arrays Size : ");
            //int size1 = int.Parse(Console.ReadLine());
            //int size2 = size1;
            //int[] arr1 = new int[size1], arr2 = new int[size2], res = new int[size1 + size2];
            //Console.WriteLine("Enter First Array : ");
            //for (int i = 0; i < size1; i++)
            //    arr1[i] = int.Parse(Console.ReadLine());
            //Console.WriteLine("Enter Second Array : ");
            //for (int i = 0; i < size2; i++)
            //    arr2[i] = int.Parse(Console.ReadLine());
            //int i1 = 0, i2 = 0, i_res = 0;
            //while (i1 < size1 || i2 < size2)
            //{
            //    if (i1 == size1)
            //    {
            //        res[i_res] = arr2[i2]; i2++;
            //    }
            //    else if (i2 == size2)
            //    {
            //        res[i_res] = arr1[i1]; i1++;
            //    }
            //    else
            //    {
            //        if (arr1[i1] <= arr2[i2])
            //        {
            //            res[i_res] = arr1[i1]; i1++;
            //        }
            //        else
            //        {
            //            res[i_res] = arr2[i2]; i2++;
            //        }
            //    }
            //    i_res++;
            //}
            //foreach (int i in res)
            //{
            //    Console.Write(i);
            //    Console.Write(' ');
            //}

            #endregion

            #region Q11
            /* 
                14- Write a program in C# Sharp to count the frequency of each element of an array.
            */
            //Console.WriteLine("Enter Arrays Size : ");
            //int arr_size = int.Parse(Console.ReadLine());
            //int mx = 0;
            //int[] Arr = new int[arr_size];
            //Console.WriteLine("Enter Array : ");
            //for (int i = 0; i < arr_size; i++)
            //{
            //    Arr[i] = int.Parse(Console.ReadLine());
            //    mx = int.Max(mx, Arr[i]);
            //}
            //int[] ans = new int[mx + 5];
            //for (int i = 0; i < Arr.Length; i++)
            //    ans[Arr[i]]++;
            //foreach (int i in ans)
            //{
            //    Console.Write(i + " ");
            //}
            #endregion

            #region Q12
            /* 
                15- Write a program in C# Sharp to find maximum and minimum element in an array
            */
            //Console.WriteLine("Enter Array Size : ");
            //int Arr_size = int.Parse(Console.ReadLine());
            //int Mx = 0, Mn = 1000000000;
            //int[] Array = new int[Arr_size];
            //Console.WriteLine("Enter Array : ");
            //for (int i = 0; i < Arr_size; i++)
            //{
            //    Array[i] = int.Parse(Console.ReadLine());
            //    Mx = int.Max(Mx, Array[i]);
            //    Mn = int.Min(Mn, Array[i]);
            //}
            //Console.WriteLine("Max Element is : " + Mx);
            //Console.WriteLine("Min Element is : " + Mn);
            #endregion

            #region Q13
            /* 
                16- Write a program in C# Sharp to find the second largest element in an array.
            */
            //Console.WriteLine("Enter Array Size : ");
            //int Arr_size = int.Parse(Console.ReadLine());
            //int _Max_ = 0, Sec_Max = 0;
            //int[] Array = new int[Arr_size];
            //Console.WriteLine("Enter Array : ");
            //for (int i = 0; i < Arr_size; i++)
            //{
            //    Array[i] = int.Parse(Console.ReadLine());
            //    Sec_Max = _Max_;
            //    _Max_ = int.Max(_Max_, Array[i]);
            //}
            //Console.WriteLine("Second Max Element is : " + Sec_Max);
            #endregion

            #region Q14
            /* 
                17-. Consider an Array of Integer values with size N, having values as    
                in this Example 

                write a program find the longest distance between Two equal cells. 
                In this example. The distance is measured by the number Of cells- 
                for example, the distance between the first and the fourth cell is 2 (cell 2 and cell 3).

                In the example above, the longest distance is between the first 7 and the
                10th 7, with a distance of 8 cells, i.e. the number of cells between the 1st
                And the 10th 7s.

                Note:
                - Array values will be taken from the user
                - If you have input like 1111111 then the distance is the number of
                Cells between the first and the last cell.
            */

            #endregion

            #region Q15
            /* 
                18- Given a list of space separated words, reverse the order of the words.

                Input: this is a test		Output: test a is this
                Input: all your base		Output: base your all
                Input: Word			Output: Word
                Note : 
                Check the Split Function (Member in String Class) Output will be a Single Console.WriteLine Statement
            */
            //string s;
            //s = Console.ReadLine();
            //Console.WriteLine(string.Join(" ", s.Split(' ', StringSplitOptions.RemoveEmptyEntries).Reverse()));
            #endregion

            #region Q16
            /* 
                19- Write a program to create two multidimensional arrays of same size.
                Accept value from user and store them in first array. Now copy all 
                the elements of first array on second array and print second array.
            */

            //Console.Write("Enter number of rows: ");
            //int rows = int.Parse(Console.ReadLine());

            //Console.Write("Enter number of columns: ");
            //int cols = int.Parse(Console.ReadLine());

            //int[,] matrix1 = new int[rows, cols], matrix2 = new int[rows, cols];

            //Console.WriteLine("Enter the elements of the 2D array:");

            //for (int i = 0; i < rows; i++)
            //{
            //    for (int j = 0; j < cols; j++)
            //    {
            //        Console.Write($"Element [{i},{j}]: ");
            //        matrix1[i, j] = int.Parse(Console.ReadLine());
            //        matrix2[i, j] = matrix1[i, j];
            //    }
            //}
            //for (int i = 0; i < rows; i++)
            //{
            //    for (int j = 0; j < cols; j++)
            //    {
            //        Console.Write(matrix2[i, j] + " ");
            //    }
            //    Console.WriteLine();
            //}
            #endregion

            #region Q17
            /* 
                20- Write a Program to Print One Dimensional Array in Reverse Order
            */
            //int size = int.Parse(Console.ReadLine());
            //int[] arra = new int[size];
            //for (int i = 0; i < size; i++)
            //{
            //    arra[i] = int.Parse(Console.ReadLine());
            //}
            //for (int i = size - 1; i >= 0; i--)
            //    Console.Write(arra[i] + " ");

            #endregion
        }
    }
}
