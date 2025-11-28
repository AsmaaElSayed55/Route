using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Four
{
    internal class Circle : ICircle
    {
        public double Area { get; set; }
        public double Radius { get; set; }

        public Circle(double radius) 
        { 
            Radius = radius;
            Area = Radius*Radius*Math.PI;
        }
        public string DisplayShapeInfo()
        {
            return $"This Shape is Circle \nIt's Radius is {Radius} \nIt's Area is {Area}\n";
        }
    }
}
