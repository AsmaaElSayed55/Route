using System;
using System.Text;
using System.Threading.Tasks;

namespace Session_2_Demo
{
    class point
    {
        public
        int x, y;
       
    }
    class My_Class <T>
    {
        // based on Class or Based on Function
        public void print<T>(T item)
        {
            // T --> Genaric Type 
            Console.WriteLine(item);
        }
        public void Test_print()
        {
            print<int>(100);
            print<string>("Route");
            print<Char>('A');
            print<bool>(true);
            print<double>(2.3);
        }

        public void print_with_object(object item)
        {
            Console.WriteLine(item);
        }

        public void Test_print_with_object()
        {
            print_with_object(100);
            print_with_object('A');
            print_with_object("Route");
            print_with_object(true);
            print_with_object(2.3);

            object x = "Route";
            int result = (int)x + 100; // wrong because casting will give error
        }

    }
    struct My_Struct
    {

    }
    enum My_Enum
    {

    }
    interface My_Interface
    {

    }
    internal class Program
    {
        static void Main(string[] args)
        {

            #region Variable Declaration
            int number,n;
            string name;
            #endregion

            #region Input
            name = Console.ReadLine();
            number = int.Parse(Console.ReadLine());
            n = int.Parse(Console.ReadLine());
            #endregion

            #region Output
            Console.WriteLine(n);
            Console.WriteLine(name);
            Console.WriteLine("Please Enter Your Name");
            Console.WriteLine(name);
            Console.WriteLine(number);

            #endregion

            #region CTS
            // Common Type System

            /* CLR ( Common Language Runtime )  --> CLR stands for Common Language Runtime,
             and it's the powerhouse behind the execution of .NET applications—including 
             those written in C#. Think of it as the virtual engine that makes your code 
             run smoothly across different platforms and languages
           */

            // User Defined Data Types
            // Struct
            // Enum 
            // class
            // Interface

            // Built in Classes 
            // object 
            // string 
            // array
            // delegate

            #endregion

            #region CLS
            // Common Language Specification
            // Data Types is common in all .net Programming Language
            #endregion

            #region Value Type Data Types
            // Sorted in Stack 
            int x = 4; // CLR Will Allocate 4 Uninitialized Bytes in Stack
            Int32 y = 10;
            Console.WriteLine(x);
            Console.WriteLine(y);
            x = y;
            Console.WriteLine(x);
            Console.WriteLine(y);

            // Built in Data Types

            // integer numbers
            byte num1 = 3; // 1 byte    // only positive 
            short num2 = 4;// 2 byte    // positive & negative
            int num3 = -6; // 4 byte    // positive & negative
            long num4 = 7; // 8 byte    // positive & negative

            // Floating Data Types 
            float num5 = 4; // 4 byte 
            double num6 = 3.45; // 8 byte 
            decimal num7 = 3;  // 16 byte 

            // char
            char c = 'A'; // 2 byte
            bool b = true; // 1 byte
            DateTime date = new DateTime(); // 8 byte
            #endregion

            #region Reference Type Data Types
            // its reference is sorted in Heap
            // its Value is sorted in Stack

            point p1; // Declare for Reference of Type Point P1 Referencing to null
                      // 4 Bytes Allocated in Stack for Pointer | Reference 
                      // 0 Bytes Allocated in Heap

            p1 = new point(); // Allocate Required Bytes at Heap
                              // Initialize Allocated Bytes Of Object with Default Value
                              // Call User Defined Constructor (If Exist)
                              // Assign Reference P1 To Allocated Object
            point p2 = new point();
            p2 = p1; // take copy of p1 address and assign it to p2
                     // so p1 and p2 point to the same address (object)

            p1.x = 9;
            Console.WriteLine(p2.x); // 9
                                     // because they point to the same address

            #endregion

            #region Object
            // Built in Class in Reference Type
            // Any Built in Data Type inherit from Object ( Directly or not Directly ) 
            /*
             * Set Of Behaviours 
             1- ToString()
             2- Equals()
             3- GetHashCode()
             4- 
             */

            #region To_String()
            point p3 = new point() { x = 10, y = 20 };
            Console.WriteLine(p3.ToString()); // Calling ToString() Of Object

            int z = 500;
            Console.WriteLine(z.ToString()); // Calling ToString() Of Int32

            object num = 12345;
            Console.WriteLine(num.ToString()); // System.Object
                                               // Calling ToString() Of Object
                                               // Calling Back ToString() int32 

            object Name = "Asmaa";
            Console.WriteLine(Name.ToString());// Asmaa
                                               // Calling ToString() Of Object
                                               // Calling Back ToString() string

            #endregion

            #region Equals()
            // by default it compares references 
            point P1 = new point() { x = 10, y = 20 };
            point P2 = new point() { x = 10, y = 20 };
            Console.WriteLine(P1.Equals(P2)); // False 
                                              // because they don't point to the same address
            P1 = P2;
            Console.WriteLine(P1.Equals(P2)); // True
                                              // because they don't point to the same address
            int a = 500;
            int d = 500;
            Console.WriteLine(a.Equals(d)); // True
                                            // compare values not references

            object number1 = 1234;
            object number2 = 1234;
            Console.WriteLine(number1.Equals(number2)); // True
                                                        // I call Equals() Of Object
                                                        // It Call Equals() Of Int32

            object number01 = "1234";
            object number02 = "1234";
            Console.WriteLine(number01.Equals(number02)); // True;
            // I Call Equals() Of Object
            // It Call Equals() Of Object
            // But String is Stored once Time not More than That

            #endregion

            #region Get_Hash_Code()

            point P01 = new point() { x = 10, y = 20 };
            point P02 = new point() { x = 10, y = 20 };
            Console.WriteLine(P01.GetHashCode()); // 54267293
            Console.WriteLine(P02.GetHashCode()); // 18643596
                                                  // Calling GetHashCode() Of Object 
                                                  // they don't have the same address 
            P02 = P01;
            Console.WriteLine(P01.GetHashCode()); // 54267293
            Console.WriteLine(P02.GetHashCode()); // 54267293
                                                  // Now they point to the same address

            int j = 500;
            int k = -500;
            Console.WriteLine(j.GetHashCode()); // 500 
                                                // return the value in int variable
            Console.WriteLine(k.GetHashCode()); // -500

            object Number1 = 1234;
            object Number2 = 1234;
            Console.WriteLine(Number1.GetHashCode()); // 1234 
                                                      // return value because it in int data type 
            Console.WriteLine(Number2.GetHashCode()); // 1234

            object Number01 = "1234";
            object Number02 = "1234";
            Console.WriteLine(Number01.GetHashCode()); // -2101483930
                                                       // return reference for this value 
            Console.WriteLine(Number02.GetHashCode()); // -2101483930 // because they point to the same reference

            #endregion

            #region Get_Type()

            // Can't override on it 

            point PP1 = new point() { x = 10, y = 20 };
            Console.WriteLine(PP1.GetType()); // Session_2_Demo.point

            int l = 500;
            Console.WriteLine(l.GetType()); //  System.Int32

            object Num1 = 1234;
            Console.WriteLine(Num1.GetType()); // System.Int32

            object number001 = "1234";
            Console.WriteLine(number001.GetType()); // System.String

            #endregion

            #endregion

            #region Object Example

            object obj;
            obj = new object(); // if System is 32 bits --> will allocate 8 bytes
                                // if System is 64 bits --> will allocate 16 bytes

            obj = new string("Route");
            obj = "Route";
            obj = 1; // Boxing
            obj = true; // Boxing
            obj = 'A'; // Boxing
            obj = new DateTime(); // Boxing
            obj = new point();

            int num = (int) obj; // UnBoxing // UnSafe
            Console.WriteLine(num);

            #endregion

            #region Task
            int num_of_day;
            double daily_salary;
            string Name_;
            Console.WriteLine("please Enter Your Name :");
            Name_ = Console.ReadLine();
            Console.WriteLine("Enter Number Of Days");
            num_of_day = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter The Daily Salary");
            daily_salary = double.Parse(Console.ReadLine());
            // output more than one otput
            Console.WriteLine($"Name: {Name_}, Total Salary: {num_of_day * daily_salary} EGP");

            #endregion


        }
    }
}
