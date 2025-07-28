using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_One
{
    internal class Point
    {
        public int X { set; get; }
        public int Y { set; get; }
        public Point(int x, int y)
        {
            X = x;
            Y = y;
        }
        public override string ToString()
        {
            return $"X : {X} , Y : {Y}";
        }

    }
}
