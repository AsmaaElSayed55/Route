using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Three
{
    internal class Person
    {
        private string firstName;
        private string lastName;
        private int age;

        public string FirstName { get; set; }
        public string LastName { get; set; }

        public int Age { get; set; }
        public Person()
        {
            firstName = "";
            lastName = "";
            age = 0;
        }
        public virtual string GetDetails()
        {
            return $"Name : {firstName} {lastName} \nAge : {age} ";
        }
    }
}
