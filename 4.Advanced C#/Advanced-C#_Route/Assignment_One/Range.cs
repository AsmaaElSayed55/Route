using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_One
{
    internal class Range<T> where T : IComparable<T>
    {
        public T MN { get; set; }
        public T MX { get; set; }

        public Range(T MN, T MX)
        {
            this.MN = MN;
            this.MX = MX;
        }
        public bool IsInRange(T Value)
        {
            return Value.CompareTo(MN) >= 0 && Value.CompareTo(MX) <= 0;
        }
        public void PresentRange(T min, T max)
        {
            if (min is not null && max is not null)
            {
                if (min.CompareTo(MX) < 0)
                {
                    //for (T i = min; i <= max; i++)
                    //{

                    //}
                }
            }
            
        }
        
        public int CompareTo(T? other)
        {
            if(other is not null)
            {

                if (IsInRange(other))
                    return 0;
                else if (other.CompareTo(MN) < 0)
                    return -1;
                else return 1;
            }
            return 1;
        }
    }
}
