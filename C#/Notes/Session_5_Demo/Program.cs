using System.Collections.Immutable;

namespace Session_5_Demo
{
    internal class Program
    {
        static void Main(string[] args)
        {

            #region Array
            // Array is Zero Base
            // Array in C# is Reference Type
            // object from Array Class
            // 

            #region 1D Array
            // Declare Array

            #region Declared by Programmer
            int[] arr; // Call Built in Class is Called Array
            // Is Declared in Stack And Point to Reference in Heap

            arr = new int[3]; // is turn from as Reference to be Object
                              // arr is sized to 3 Placed in Heap by 12 byte ( 3 (Places) * 4 byte (size of each place) )
                              // is declared by default 0
            int[] arr1 = { 1, 2, 4 };
            int[] arr2 = [1, 2, 4, 5];
            int[] arr3 = new int[] { 1, 2, 4 };
            int[] arr4 = new int[4] { 1, 2, 4, 9 };

            #endregion

            #region Intered By User
            int.TryParse(Console.ReadLine(), out int size);

            for (int i = 0; i < size; i++)
            {
                arr[i] = int.Parse(Console.ReadLine());
            }
            #endregion

            #region Output Its Elements
            // To print its elements
            Console.WriteLine(arr[0]);
            Console.WriteLine(arr[1]);
            Console.WriteLine(arr[2]);

            // By Foreach Loop
            foreach (int i in arr)
                Console.WriteLine(i);

            // By For Loop
            for (int i = 0; i < arr.Length; i++)
            {
                Console.WriteLine(arr[i]);
            }
            // By While Loop
            int temp = 0;
            while (temp < arr.Length)
            {
                Console.WriteLine(arr[temp]);
                temp++;
            }
            #endregion

            #endregion

            #region 2D Array

            #region Array Declareation

            #region Intered By User
            int row = int.Parse(Console.ReadLine()), col = int.Parse(Console.ReadLine());
            int[,] Grades = new int[row, col];
            // CLR --> Will Allocate 60 Bytes At Heap
            // Initialized With The Default Value =0  

            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < col; j++)
                {
                    Grades[i, j] = int.Parse(Console.ReadLine());
                }
            }
            #endregion

            #endregion

            #region Output Its Elements
            for (int i = 0; i < row; i++)
            {
                for (int j = 0; j < col; j++)
                {
                    Console.Write(Grades[i, j] + " ");
                }
                Console.WriteLine();
            }
            #endregion

            #endregion

            #region Jugged Array
            // Multi Demintion Array
            // is like to vector of vector in C++

            #region اجتهاد شخصي

            //int.TryParse(Console.ReadLine(), out int rows);
            //object[] Marks = new object[rows];
            //for (int i = 0; i < rows; i++)
            //{
            //    int.TryParse(Console.ReadLine(), out int cols);
            //    int[] temp = new int[cols];
            //    for (int j = 0; j < cols; j++)
            //    {
            //        temp[j] = int.Parse(Console.ReadLine());
            //    }
            //    Marks[i] = temp;
            //}
            //foreach (int[] i in Marks)
            //{
            //    for (int j = 0; j < i.Length; j++)
            //        Console.Write(i[j] + " ");
            //    Console.WriteLine();
            //}

            #endregion

            #region Base Way
            int.TryParse(Console.ReadLine(), out int rows);
            int[][] Marks = new int[rows][];
            for (int i = 0; i < rows; i++)
            {
                int.TryParse(Console.ReadLine(), out int cols);
                Marks[i] = new int[cols];
                for (int j = 0; j < cols; j++)
                {
                    Marks[i][j] = int.Parse(Console.ReadLine());
                }
            }
            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < Marks[i].Length; j++)
                    Console.Write(Marks[i][j] + " ");
                Console.WriteLine();
            }
            #endregion

            #endregion

            #region Array Methods

            int[] Arr1 = [1, 2, 3, 4, 5, 6];
            int.TryParse(Console.ReadLine(), out int Size);
            int[] Arr2 = new int[Size];
            for (int i = 0; i < Arr2.Length; i++)
                int.TryParse(Console.ReadLine(), out Arr2[i]);

            #region Class Mamber Methods

            // Sort
            Array.Sort(Arr2);
            foreach (int i in Arr2)
                Console.Write(i + " ");
            Console.WriteLine();

            // Copy
            int[] temp1 = new int[Arr1.Length];
            Array.Copy(Arr1, temp1, 3); // what i copy , where i copy , number of numbers i want copy
            foreach (int i in temp1)
                Console.Write(i + " ");
            Console.WriteLine();

            // Index Of
            Console.WriteLine(Array.IndexOf(Arr1, 4)); // return First index of value 4 from Left // Index 0 Base

            //Last Index 
            Console.WriteLine(Array.LastIndexOf(Arr2, 4)); // return First index of value 4 from Right // Index 0 Base

            #endregion

            #region Object Member Method

            // Copy To
            Arr2.CopyTo(Arr1, 0); // Copt Arr2 To Arr1 From Index 0

            // Size of Array
            Console.WriteLine(Arr1.Length);

            // Dimension of Array
            Console.WriteLine(Arr2.Rank);

            #endregion

            #endregion

            #endregion

            #region Boxing & UnBoxing

            object ob = new object();
            ob = new string("Asmaa");

            #region Boxing
            // Casting From Value Type Data Type TO Reference Type Data Type
            ob = (object)5; // Boxing
            ob = (object)10.478;
            ob = (object)'A';

            #endregion

            #region UnBoxing
            // Casting From Reference Type Data Type TO Value Type Data Type
            int Number = (int)ob; // UnBoxing
            // Casting From Object (Reference Type) Data Type TO int (Value Type) Data Type
            #endregion

            // if ok To Turn it into int , do it 
            // else put it 0
            Number = (ob.GetType() == typeof(int)) ? (int)ob : 0;
            Number = (ob is int) ? (int)ob : 0;

            #endregion

            #region Is & Has Relationship

            object X = "Asmaa"; // Inheritance : Is A

            #endregion

            #region Nullable Value Type
           // int age = null; // Wrong 
            Nullable<int> Age; // Base Syntax
            int? age = null; // Syntax Suger // ? --> Nullable Operator
            Console.WriteLine((age is not null) ? age : 0);
            Console.WriteLine((age.HasValue) ? age : 0);

            double? Salary; // Allow double values + Null

            int x = 10;
            int? y = x; // Okay // It Allow int Values + Null

            // x = y; // Wrong --> x is int Data Type --> Not Allow Null

            x = (int)y;  // Casting --> Y Turned into int Value 
                         // UnSafe Casting

            if (y is not null)
                x = (int)y;
            else y = 0;

            if (y.HasValue)
                x = (int)y;
            else
                x = 0;
            x = y.HasValue ? y.Value : 0;
            // Coalesing Operator 
            x = y ?? 0; // تحفة

            #endregion

            #region Nullable Reference Type

            string s = null;
            string? s1 = null; // C# 8 // string nullable
            // Just For Compiler Enhancements
            string s2 = null!; // Null Forgiveness Operators
                               // is equal to string? s1 = null;

            #endregion

            #region Null Propagation Operator
            int[]? numbers = [1, 2, 3];

            #region Example 1

            numbers = null;
            if (numbers != null)
            {
                for (int i = 0; i < numbers.Length; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
            }
            //--------------------------
            for (int i = 0; numbers is not null && i < numbers.Length; i++)
            {
                Console.WriteLine(numbers[i]);
            }
            //--------------------------
            for (int i = 0; i < numbers?.Length; i++)
            {
                Console.WriteLine(numbers[i]);
            }

            #endregion
            #region Example 2

            int? Length;
            if (numbers is not null)
            {
                Length = numbers.Length;
                for (int i = 0; i < Length; i++)
                {
                    Console.WriteLine(numbers[i]);
                }
            }
            else
                Console.WriteLine("No Data");
            //---------------------------------
            // (Numbers is not null) ? Numbers.Length : null;
            // Numbers?.Length;
            Length = numbers?.Length ?? 0;

            #endregion
            #region Example 3

            Employee employee = new Employee()
            {
                Id = 101,
                Name = "Asmaa El Sayed",
                Age = 20,
                Salary = 10_000,
                Department = new Department()
                {
                    Id=20,
                    Name="Dot Net"
                }
            };
            // employee = null;
            Console.WriteLine(employee?.Department?.Name ?? "No Data");
            Console.WriteLine(employee);
            #endregion

            #endregion
        }
    }
}
