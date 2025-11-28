using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Three
{
    internal class Admin:Person
    {
        private string? fName;
        private string? lName;

        public Admin(string? fName, string? lName, int age, string? role)
        {
            FirstName = fName;
            LastName = lName;
            Age = age;
            Role = role;
        }

        public string Role {  get; set; }
        override public string GetDetails()
        {
            return $"Full Name : {FirstName} {LastName}\nAge : {Age}\nRole : {Role}";

        }
    }
}
