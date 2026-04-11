using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionOne.Data.Models
{
    // Poco Class => [Plan Old CLR Object]
    // We Have 4 Ways To Map Classes nto Table
    // 1. By Convention [Default behavior] ==> Search on [public numeric Property Named As "Id","EmployeeId" => PK identity (1,1)]

   // [Table("Hamada")]
    internal class Empolyee
    {
        // Make Primary Kay 
         [Key]
        public int Id { get; set; }

        // NUllable Reference Type [string?]
        // is mapped to string --> nvarchar(max) in SQL
        // Nullable --> Allow Null --> Col Optional
        // : .net 6 : Reference Type : Not Allow Null(Required)
        // Nullable<string> 
        [Required]
        [Column ("EmployeeName", TypeName = "nvarchar(100)")] 
        [MaxLength(100, ErrorMessage="Name must be at most 100 characters long")] // Will Be Enforced By SQL Server , Server Side Validation                        
        [MinLength(3, ErrorMessage="Name must be at least 3 characters long")] // Will Not Be Enforced By SQL Server But Will Be Enforced By EF Core , Server Side Validation
     //   [StringLength(100, MinimumLength = 3, ErrorMessage = "Name must be between 3 and 100 characters long")]
        public string? Name { get; set; } // will be mapped to nvarchar(100) in SQL Server


        // decimal(1,2) 
        // Value Type --> Decimal --> Required  --> Not Allow Null
        // Decimal --> Mapped To decimal (18,2)



        [Required]
        //[Range(25,40)]
        //[AllowedValues(25, 26)]
        //[DeniedValues(25, 26)]
        [Column(TypeName = "decimal(10,2)")]
        public decimal Salary { get; set; }


        // Value Type --> Decimal --> Required --> Not Allow Null
        // int --> Mapped To int
        [Range(25,50)] // Server Side Validation , not mapped to SQL Server
        [AllowedValues(20,30,40,50)] // Server Side Validation , not mapped to SQL Server
        [DeniedValues(25,26,27,28,29)] // Server Side Validation , not mapped to SQL Server
        public int Age { get; set; }


        [DataType(DataType.PhoneNumber)] // To Display In UI As Phone Number , Not Mapped To SQL Server
        [Phone] // Server Side Validation , Not Mapped To SQL Server
        public string PhoneNumber { get; set; }


        [DataType(DataType.EmailAddress)] // To Display In UI As Email , Not Mapped To SQL Server
        [EmailAddress] // To Ensure That Email Is Valid , Server Side Validation , Not Mapped To SQL Server
        public string Email { get; set; }



        [NotMapped] // Not Mapped To SQL Server
        public decimal NetSalary { get; set; }


    }
}
