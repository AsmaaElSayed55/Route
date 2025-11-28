using System.Threading.Channels;

namespace Assignment_Three
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<Person> list = new List<Person>();
            string FName, LName, role, subject,gradeLevel;
            int age;
            for (int i = 0; i < 1; i++)
            {
                FName = Console.ReadLine();
                LName= Console.ReadLine();
                int.TryParse(Console.ReadLine(),out age);
                gradeLevel= Console.ReadLine();
                list.Add(new Student(FName,LName,age,gradeLevel));
            }
            for (int i = 0; i < 1; i++)
            {
                FName = Console.ReadLine();
                LName = Console.ReadLine();
                int.TryParse(Console.ReadLine(), out age);
                subject= Console.ReadLine();
                list.Add(new Teacher(FName,LName,age,subject));
            }
            for (int i = 0; i < 1; i++)
            {
                FName = Console.ReadLine();
                LName = Console.ReadLine();
                int.TryParse(Console.ReadLine(), out age);
                role= Console.ReadLine();
                list.Add(new Admin(FName,LName,age,role));
            }

            foreach(var obj in list)
                Console.WriteLine(obj.GetDetails());

        }
    }
}
