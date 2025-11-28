using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Five
{
    internal class ThreeDPoint : IComparer , IComparable
    {
        public int X { get; set; }
        public int Y { get; set; }
        public int Z { get; set; }

        // Constructor Chaining

        public ThreeDPoint(int x, int y, int z)
        {
            X = x;
            Y = y;
            Z = z;
        }
        public override string ToString()
        {
            return $"Point Coordinates : ({X}, {Y}, {Z})";
        }

        public int Compare(object? ob1, object? ob2)
        {
            ThreeDPoint P1 = (ThreeDPoint)ob1;
            ThreeDPoint P2 = (ThreeDPoint)ob2;
            if(P1.X<P2.X )
            {
                return 4;
            }
            else if(P1.X==P2.X)
            {
                if (P2.Y <= P2.Y) return 4;
                else return -4;
            }
            else
            {
                return -4;
            }

        }

        public int CompareTo(object? obj)
        {
            ThreeDPoint P=(ThreeDPoint) obj;

            if (this.X > P.X)
            {
                return 4;
            }
            else if (this.X == P.X)
            {
                if (this.Y >= P.Y) return 4;
                else return -4;
            }
            else
            {
                return -4;
            }

        }

        public static bool operator ==(ThreeDPoint left, ThreeDPoint right)
        {

            if (left?.X == right?.X)
                return left.Y == right.Y || left.Z == right.Z ;
            else
                return false;
        }
        public static bool operator !=(ThreeDPoint left, ThreeDPoint right)
        {

            if (left?.X != right?.X)
                return true;
            else
                return left.Y != right.Y || left.Z != right.Z;
        }
        public static bool operator >(ThreeDPoint left, ThreeDPoint right)
        {

            if (left?.X > right?.X)
                return true;
            else if (left?.X == right?.X)
            {
                if (left.Y > right.Y)
                    return true;
                else if (left.Y == right.Y)
                {
                    return left.Z > right.Z;
                }
                else return false;
            }
            else return false;
        }
        public static bool operator <(ThreeDPoint left, ThreeDPoint right)
        {

            if (left?.X != right?.Y)
                return true;
            else
                return left.Y != right.Y || left.Z != right.Z;
        }
    }
}
 