using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Assignment_One
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region QU 1
            foreach (WeekDays day in Enum.GetValues(typeof(WeekDays)))
            {
                Console.WriteLine(day);
            }
            #endregion

            #region QU 2
            Person[] persons = new Person[3];
            for (int i = 0; i < persons.Length; i++)
            {
                string name = Console.ReadLine();
                int.TryParse(Console.ReadLine(), out int age);
                persons[i] = new Person
                { name = name, age = age };
            }
            for (int i = 0; i < persons.Length; i++)
            {
                Console.WriteLine($"Name = {persons[i].name}");
                Console.WriteLine($"Age = {persons[i].age}");
            }

            #endregion

            #region QU 3
            Console.Write("Enter a season name (Spring, Summer, Autumn, Winter): ");
            string season = Console.ReadLine();

            if (Enum.TryParse(season, true, out Season selectedSeason))
            {
                switch (selectedSeason)
                {
                    case Season.Spring:
                        Console.WriteLine("Spring: March to May");
                        break;
                    case Season.Summer:
                        Console.WriteLine("Summer: June to August");
                        break;
                    case Season.Autumn:
                        Console.WriteLine("Autumn: September to November");
                        break;
                    case Season.Winter:
                        Console.WriteLine("Winter: December to February");
                        break;
                }
            }
            else
            {
                Console.WriteLine("Invalid season name. Please enter: Spring, Summer, Autumn, or Winter.");
            }
            #endregion

            #region QU 4
            // 1. Create variable with initial permissions
            Permissions perm = Permissions.Read | Permissions.Write;
            Console.WriteLine("Initial: " + perm);

            // 2. Add Permission (Execute)
            perm |= Permissions.Execute;
            Console.WriteLine("After Add Execute: " + perm);

            // 3. Remove Permission (Write)
            perm &= ~Permissions.Write;
            Console.WriteLine("After Remove Write: " + perm);

            // 4. Check if a specific permission exists (Delete)
            bool hasDelete = perm.HasFlag(Permissions.Delete);
            Console.WriteLine("Has Delete? " + hasDelete);

            // 5. Check if has Read
            if ((perm & Permissions.Read) == Permissions.Read)
                Console.WriteLine("Read permission exists.");
            #endregion

            #region QU 5
            string color = Console.ReadLine();
            if (Enum.TryParse(color, true, out Colors selectedColor))
            {
                Console.WriteLine("the input color is a primary color ");
            }
            else
            {
                Console.WriteLine("the input color is not a primary color");
            }
            #endregion

            #region QU 6
            int.TryParse(Console.ReadLine(), out int x1);
            int.TryParse(Console.ReadLine(), out int y1);
            int.TryParse(Console.ReadLine(), out int x2);
            int.TryParse(Console.ReadLine(), out int y2);
            Point point1 = new Point { X = x1, Y = y1 };
            Point point2 = new Point { X = x2, Y = y2 };
            Console.WriteLine($"The Distance is {Math.Sqrt(Math.Pow(x2 - x1, 2) + Math.Pow(y2 - y1, 2))}");
            #endregion
        }
    }
}
