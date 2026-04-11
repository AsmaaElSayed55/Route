using SessionOne.Data;

namespace SessionOne
{
    internal class Program
    {
        static void Main(string[] args)
        {

            using MyCompanyDbContext dbContext = new MyCompanyDbContext();

            // Can Arrive to Your Table in Database 
            //dbContext.Employees.Add(new Empolyee
            //{
            //    Id= 1,
            //    Name="Ahmed",
            //    Salary=654.23M,
            //    Age=24
            //});


            //   var employee = dbContext.Employees.Where(E => E.Age > 10);

            //  CompanyDbContext dbContext = new CompanyDbContext();
            // Connection with Database ==> UnManaged Resource
            // CLR will open a connection with database but it will not close it, so we have to close it by our self, and the best way to do that is to use "using" statement, because it will automatically call the Dispose method of the dbContext class, and the Dispose method will close the connection with database.





        }
    }
}
