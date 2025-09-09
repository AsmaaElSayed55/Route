namespace Assignment_Two
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employee[] employees = new Employee[3];
            try
            {
                for (int i = 0; i < employees.Length; i++)
                {
                    Console.WriteLine("Enter Employee Id : ");
                    int.TryParse(Console.ReadLine(), out int id);

                    Console.WriteLine("Enter Employee Name : ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Enter Security Privilege (Guest, Developer, Secretary, DBA, SecurityOfficer):");
                    string input = Console.ReadLine();

                    if (Enum.TryParse(input, true, out SecurityLevel secLevel))
                    {
                        Console.WriteLine("You selected: " + secLevel);
                    }
                    else
                    {
                        Console.WriteLine("Invalid security privilege entered.");
                    }

                    Console.WriteLine("Enter Employee Salary : ");
                    int.TryParse(Console.ReadLine(), out int salary);

                    Console.WriteLine("Enter Employee Hiring Date Day : ");
                    int.TryParse(Console.ReadLine(), out int day);

                    Console.WriteLine("Enter Employee Hiring Date Month : ");
                    int.TryParse(Console.ReadLine(), out int month);

                    Console.WriteLine("Enter Employee Hiring Date Year : ");
                    int.TryParse(Console.ReadLine(), out int year);

                    Console.WriteLine("Enter Gender (Male, Female, Other):");
                    string genderInput = Console.ReadLine();

                    if (Enum.TryParse(genderInput, true, out Gender gender))
                    {
                        Console.WriteLine("Gender selected: " + gender);
                    }
                    else
                    {
                        Console.WriteLine("Invalid gender entered.");
                    }
                    employees[i] = new Employee(id, name, secLevel, salary, day, month, year, gender);

                    foreach (Employee emp in employees)
                    {
                        Console.WriteLine(emp.ToString());
                        Console.WriteLine("---------------");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
