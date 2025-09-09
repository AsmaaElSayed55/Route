using EF_Session_one.Data.Models;
using Microsoft.EntityFrameworkCore;
using System.Net.NetworkInformation;

namespace EF_Session_one
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using CompanyDbContext dbContext = new CompanyDbContext();
            var employee = dbContext.Employees.Where(E => E.Age > 10);

            //    dbContext.Database.Migrate();

                //{

                //}
            //    CompanyDbContext dbContext = new CompanyDbContext();
            //try
            //{

            //}
            //finally
            //{
            //    dbContext.Dispose();
            //}
        }
    }
}
