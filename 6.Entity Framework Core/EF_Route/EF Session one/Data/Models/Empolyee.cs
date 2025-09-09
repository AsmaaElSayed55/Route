using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace EF_Session_one.Data.Models
{
    // Poco Class => [Plan Old CLR Object]
    // We Have 4 Ways To Map Classes nto Table
    // 1. By Convention [Default behavior] ==> Search on [public numeric Property Named As "Id","EmployeeId" => PK identity (1,1)]

    // [Table("Employees")]
    internal class Empolyee
    {
        // Make Primary Kay 
        // [Key]
        public int Id { get; set; } // public numeric Property Named As "Id","EmployeeId" => PK identity (1,1)

        //[Required]
        [Column("Employees", TypeName = "varchar")]
        [MaxLength(50, ErrorMessage = "Name Of Employee Must Be Less Than 50 Char ")] // Validation For Data
        // Will Be Mapped
        // Application Validation [Bacend Validation ]
       // [MinLength(3,ErrorMessage ="Name Muat Be More Than 3")]
       // [StringLength(50, MinimumLength=3)]
        public string Name { get; set; } // nvarchar(max) : .net 5 : Reference Type : Allow Null (Option)
        //                                                : .net 6 : Reference Type : Not Allow Null (Required)
        // Nullable<string> 

       
        public decimal Salary { get; set; } // decimal(1,2) 

        [Required]
        [Range(25,40)]
        [AllowedValues(25, 26)]
        [DeniedValues(25, 26)]
        public int Age { get; set; } // Nullable < int >

        [Phone]
        [DataType(DataType.PhoneNumber)] //To Display Value As Phone Number
        public string PhoneNumber { get; set; }
        [EmailAddress]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [NotMapped]
        public int Test {  get; set; }

    }
}
