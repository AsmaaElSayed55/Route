using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Two
{
    internal class Employee
    {
        private int Id { get; set; }
        public int ID 
        { 
            get => Id;
            set => Id = value > 0 ? value : throw new ArgumentException("ID must be a positive number.");
        }
        private string name { get; set; }
        public string Name
        {
            get => name;
            set => name = !string.IsNullOrWhiteSpace(value) ? value : throw new ArgumentException("Name cannot be empty.");
        }
        public SecurityLevel securitylevel {  get; set; }
        public double salary { get; set; }
        public double Salary
        {
            get => salary;
            set => salary = value >= 0 ? value : throw new ArgumentException("Salary must be non-negative.");
        }
        public Gender gender { get; set; }
        public HiringDate hiringdate { get; set; }
        public Employee(int id, string name, SecurityLevel secLevel, double salary, int day , int month , int year , Gender gen)
        {
            ID = id;
            Name = name;
            securitylevel=secLevel;
            Salary = salary;
            hiringdate= new HiringDate { Day=day,Month=month,Year=year };
            gender = gen;
        }
        public override string ToString()
        {
            return $"Employee Id : {Id} \n Employee Name : {name} \n Employee Security Level : {securitylevel} \n Employee Salary : {Salary} \n Employee Gender {gender} \n Employee Hiring Date : {hiringdate.Day}/{hiringdate.Month}/{hiringdate.Year}";
        }
    }
}
