using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Versioning;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Three
{
    internal class Student : Person
    {
        public Student(string? fName, string? lName, int age, string? gradeLevel)
        {
            FirstName = fName;
            LastName = lName;
            Age = age;
            GradeLevel = gradeLevel;
        }

        public string GradeLevel { get; set; }
        override public string  GetDetails()
        {
            return $"Full Name : {FirstName} {LastName}\nAge : {Age}\nGrade Level : {GradeLevel}";

        }

    }
}
