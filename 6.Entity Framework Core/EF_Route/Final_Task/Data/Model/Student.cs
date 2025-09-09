using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Final_Task.Data.Model
{
    internal class Student
    {
        public int Id { get; set; } 
        public string FullName { get; set; } 
        public string Email { get; set; }
        public string? Phone { get; set; }
        public DateOnly BirthDate { get; set; }
        public string? Address { get; set; }

    }
}
