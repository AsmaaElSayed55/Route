namespace Assignment_One
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Int
            int a = 1, b = 2;
            Console.WriteLine($"a : {a}"); 
            Console.WriteLine($"b : {b}");

            Helper.Swap(ref a, ref b);

            Console.WriteLine($"a : {a}");
            Console.WriteLine($"b : {b}");
            #endregion

            #region Double
            double A = 1, B = 2;
            Console.WriteLine($"A : {A}");
            Console.WriteLine($"B : {B}");

            Helper.Swap(ref A, ref B);

            Console.WriteLine($"A : {A}");
            Console.WriteLine($"B : {B}");
            #endregion

            #region Point
            Point P1 = new Point(1, 2);
            Point P2 = new Point(3, 4);

            Console.WriteLine($"P1 --> X : {P1.X} , Y : {P1.Y} ");
            Console.WriteLine($"P2 --> X : {P2.X} , Y : {P2.Y} ");

            Helper.Swap(ref P1, ref P2);

            Console.WriteLine($"P1 --> X : {P1.X} , Y : {P1.Y} ");
            Console.WriteLine($"P2 --> X : {P2.X} , Y : {P2.Y} ");

            #endregion

            #region Linear Search
            int[] Numbers = { 1, 2, 3, 2, 5, 2, 7 };
            int Position = Helper.SearchArray(Numbers, 5);
            Console.WriteLine($"The Position Of 5 is {Position}");
            #endregion

            #region Genaric

            #region Genaric Functions
            Point p1 = new Point(1, 2);
            Point p2 = new Point(3, 4);

            Console.WriteLine($"P1 --> X : {p1.X} , Y : {p1.Y} ");
            Console.WriteLine($"P2 --> X : {p2.X} , Y : {p2.Y} ");

            Helper.Swap<Point>(ref p1, ref p2);

            Console.WriteLine($"P1 --> X : {p1.X} , Y : {p1.Y} ");
            Console.WriteLine($"P2 --> X : {p2.X} , Y : {p2.Y} ");

            #endregion
            #region Genaric Class
            Point p3 = new Point(1, 2);
            Point p4 = new Point(3, 4);

            Console.WriteLine($"P1 --> X : {p3.X} , Y : {p3.Y} ");
            Console.WriteLine($"P2 --> X : {p4.X} , Y : {p4.Y} ");

           // Helper<Point>.Swap(ref p3, ref p4);

            Console.WriteLine($"P1 --> X : {p3.X} , Y : {p3.Y} ");
            Console.WriteLine($"P2 --> X : {p4.X} , Y : {p4.Y} ");

            #endregion
            #region Linear Search T --> Int
            int[] numbers = { 1, 2, 3, 2, 5, 2, 7 };
            int position = Helper.SearchArray<int>(numbers, 5);
            Console.WriteLine($"The Position Of 5 is {position}");
            #endregion
            #region Linear Search T --> String
            string[] Names = { "Asmaa", "Ahmed" , "Amany" , "Aya" };
            int index = Helper.SearchArray<string>(Names, "Ahmed");
            Console.WriteLine($"The Position Of 5 is {index}");
            #endregion

            #endregion
        }
    }
}
