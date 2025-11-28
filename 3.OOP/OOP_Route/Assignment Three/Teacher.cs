using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Three
{
    internal class Teacher : Person
    {
        public Teacher(string? fName, string? lName, int age, string? subject)
        {
            FirstName = fName;
            LastName = lName;
            Age = age;
            Subject = subject;
        }

        public string Subject {  get; set; }
        override public string GetDetails()
        {
            return $"Full Name : {FirstName} {LastName}\nAge : {Age}\nSubject : {Subject}";

        }
    }
}
