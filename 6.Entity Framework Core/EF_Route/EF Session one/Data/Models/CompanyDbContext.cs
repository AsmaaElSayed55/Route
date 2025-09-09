using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace EF_Session_one.Data.Models
{
    internal class CompanyDbContext : DbContext
    {
        //CompanyDbContext() : base()
        //{

        //}
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=.;Database= Route; Trusted_Connection=true;trustservercertificate=true");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Fluent APIs
          //  modelBuilder.Entity<Empolyee>().HasKey(E => E.Id);
            modelBuilder.Entity<Empolyee>().Property(E => E.Id).UseIdentityColumn(1,2);
        }
        public DbSet<Empolyee> Employees { get; set; }

        public DbSet<Department> Departments { get; set; }

        public DbSet<Project> Projects { get; set; }

      //  public DbSet<Product> Products { get; set; }
    }
}
