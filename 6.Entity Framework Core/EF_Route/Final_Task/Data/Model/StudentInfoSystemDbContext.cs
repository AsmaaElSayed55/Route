using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Task.Data.Model
{
    internal class StudentInfoSystemDbContext :DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.;Database= EF_Task; Trusted_Connection=true;trustservercertificate=true");
        }
        public DbSet<Student> Students { get; set; }
        public DbSet<Department> Departments { get; set; }

    }
}
