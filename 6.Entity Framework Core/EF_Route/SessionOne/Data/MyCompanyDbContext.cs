using Microsoft.EntityFrameworkCore;
using SessionOne.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionOne.Data
{
    internal class MyCompanyDbContext : DbContext
    {
        //CompanyDbContext() : base()
        //{

        //}

        // Connection String
        #region OnConfiguring
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // UseSqlServer => method to connect to SQL Server
            _ = optionsBuilder.UseSqlServer("Server=.;Database= Route; Trusted_Connection=true;trustservercertificate=true");
        }
        #endregion

        public DbSet<Empolyee> Employees { get; set; }
        // public DbSet<Department> Departments { get; set; }
        //  public DbSet<Project> Projects { get; set; }
        //  public DbSet<Product> Products { get; set; }

        #region Miration Commands

        // Add-Migration -Name "InitialCreate" -OutputDir "Data/Migrations"  // create migration
        // Update-Database  // update database with migration
        // Update-Database 0 // remove all migrations from database
        // Remove-Migration // remove last migration that is not applied to database
        // Drop-Database // drop database

        #endregion

    }
}
