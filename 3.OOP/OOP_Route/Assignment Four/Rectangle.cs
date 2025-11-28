using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Four
{
    internal class Rectangle : IRectangle
    {
        public double Area { get; set; }
        public double Width { get; set; }
        public double Height { get; set; }
        public Rectangle(double width, double height)
        {
            Width = width;
            Height = height;
            Area = Width*Height;
        }
        public string DisplayShapeInfo()
        {
            return $" This Shape is Rectangle \nIt's Width is {Width} \nIt's Height is {Height} \nIt's Area is {Area} \n";
        }
    }
}
