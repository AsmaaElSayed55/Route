using System.Drawing;
namespace Assignment_Five
{
    internal class Program
    {
       
        static void CompareTwoObjects(ThreeDPoint P1,ThreeDPoint P2)
        {

            if (P1 == P2)
            {
                Console.WriteLine("Yes The Two Objects Are Equal");
            }
            else
            {
                if(P1>P2)
                    Console.WriteLine("Object One Is Greater Than Object Two");
                else Console.WriteLine("Object Two Is Greater Than Object One");
            }
        }
        static void PointsArray(ThreeDPoint[] P)
        {

            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine($"Enter P{i} Coordinates ");
                int.TryParse(Console.ReadLine(), out int x);
                int.TryParse(Console.ReadLine(), out int y);
                int.TryParse(Console.ReadLine(), out int z);
                P[i] = new ThreeDPoint(x, y, z);
            }
            Array.Sort(P);
        }
        static void First_Project()
        {

            ThreeDPoint P = new ThreeDPoint(10, 10, 10);
            Console.WriteLine(P.ToString());

            Console.WriteLine("Enter P1 Coordinates ");
            int.TryParse(Console.ReadLine(), out int x1);
            int.TryParse(Console.ReadLine(), out int y1);
            int.TryParse(Console.ReadLine(), out int z1);

            Console.WriteLine("Enter P2 Coordinates ");
            int.TryParse(Console.ReadLine(), out int x2);
            int.TryParse(Console.ReadLine(), out int y2);
            int.TryParse(Console.ReadLine(), out int z2);

            ThreeDPoint P1 = new ThreeDPoint(x1, y1, z1);
            ThreeDPoint P2 = new ThreeDPoint(x2, y2, z2);

            CompareTwoObjects(P1, P2);

            ThreeDPoint[] Points = new ThreeDPoint[5];
            PointsArray(Points);

            foreach(ThreeDPoint Point in Points )
                Console.WriteLine(Point+" ");
        }
        static void Second_Project()
        {
            int.TryParse(Console.ReadLine(), out int x);
            int.TryParse(Console.ReadLine(), out int y);

            Console.WriteLine("Addition");
            Console.WriteLine(Maths.Add(x, y));

            Console.WriteLine("Subtraction");
            Console.WriteLine(Maths.Subtract(x, y));

            Console.WriteLine("Multiplication");
            Console.WriteLine(Maths.Multiply(x, y));

            Console.WriteLine("Divition");
            Console.WriteLine(Maths.Divide(x, y));
        }
        static void Third_Project()
        {
            Duration D = new Duration();
            Console.WriteLine("Enter the time as Hours : Minutes : Seconds ");

            int.TryParse(Console.ReadLine(), out int hours);
            int.TryParse(Console.ReadLine(), out int minutes);
            int.TryParse(Console.ReadLine(), out int seconds);

            Console.WriteLine(D.ToString());

            Console.WriteLine("Enter the time as Seconds ");

            int.TryParse(Console.ReadLine(), out int Seconds);

            Console.WriteLine(D.ToString());


            Duration D1 = new Duration();
            Duration D2 = new Duration();
            Duration D3 = new Duration();

            D3 = D1 + D2;
            Console.WriteLine(D1.ToString());
            Console.WriteLine(D2.ToString());
            Console.WriteLine(D3.ToString());

            D3 = D1 + new Duration(Seconds);
            Console.WriteLine(D1.ToString());
            Console.WriteLine(D3.ToString());

            D3 = new Duration(Seconds) + D3;
            Console.WriteLine(D3.ToString());

            D3 = ++D1;
            Console.WriteLine(D1.ToString());
            Console.WriteLine(D3.ToString());

            D3 = --D2;
            Console.WriteLine(D2.ToString());
            Console.WriteLine(D3.ToString());

            D1 = D1 - D2;
            Console.WriteLine(D1.ToString());
            Console.WriteLine(D2.ToString());

            if (D1>D2)
                Console.WriteLine("D1 Is Greater Than D2");

            if(D1<=D2)
                Console.WriteLine("D1 Is Less Than Or Equal to D2");

            if(D1)
                Console.WriteLine("Yes");
            else Console.WriteLine("No");

                DateTime Obj = (DateTime)D1;
            Console.WriteLine(Obj.ToString());
        }
        static void Main(string[] args)
        {

          //  First_Project();

          //  Second_Project();

            Third_Project();
        }
    }
}
