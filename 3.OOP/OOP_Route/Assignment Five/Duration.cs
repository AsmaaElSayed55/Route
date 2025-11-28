using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Five
{
    internal class Duration
    {
        // Attributes
        public int Hours { get; set; }
        public int Minutes { get; set; }
        public int Seconds { get; set; }

        // Hour , Minute , Second
        public Duration(int hours, int minutes, int seconds)
        {
            Hours = hours;
            Minutes = minutes;
            Seconds = seconds;
        }
        
        // Seconds
        public Duration(int seconds)
        {
            Hours = seconds / 3600; seconds %= 3600;
            Minutes = seconds / 60; seconds %= 60;
            Seconds = seconds;
        }

        public Duration()
        {

        }

        public int ToSeconds()
        {
            return Hours * 3600 + Minutes * 60 + Seconds;
        }

        public static Duration operator +(Duration left, Duration right)
        {
            return new Duration()
            {
                Hours = (left?.Hours ?? 0 + right?.Hours) ?? 0,

                Minutes = left?.Minutes ?? 0 + right?.Minutes ?? 0,   

                Seconds= left?.Seconds ?? 0 + right?.Seconds ?? 0,
            };
        }
        public static Duration operator -(Duration left, Duration right)
        {
            return new Duration()
            {
                Hours = (left?.Hours ?? 0 - right?.Hours) ?? 0,

                Minutes = left?.Minutes ?? 0 - right?.Minutes ?? 0,

                Seconds = left?.Seconds ?? 0 - right?.Seconds ?? 0,
            };
        }

        public static Duration operator ++(Duration C)
        {
            if (C.Minutes == 59)
            {
                C.Hours++;
                return new Duration()
                {
                    Minutes = 1,
                };
            }
            return new Duration()
            {
                Minutes = (C?.Minutes ?? 0) + 1,
            };
        }
        public static Duration operator --(Duration C)
        {
            if (C.Minutes == 0)
            {
                if(C.Hours==0)
                    return new Duration()
                    {
                        Minutes = 0,
                    };
                C.Hours--;
                return new Duration()
                {
                    Minutes = 59,
                };
            }
            return new Duration()
            {
                Minutes = (C?.Minutes ?? 0) - 1,
            };
        }

        public static bool operator >(Duration left, Duration right)
        {
            if (left?.Hours == right?.Hours)
            {
                if(left?.Minutes == right?.Minutes)
                    return left?. Seconds > right?.Seconds;
                else return left?.Minutes > right?.Minutes;
            }
            else
                return left?.Hours > right?.Hours;
        }
        public static bool operator <(Duration left, Duration right)
        {
            if (left?.Hours == right?.Hours)
            {
                if (left?.Minutes == right?.Minutes)
                    return left?.Seconds < right?.Seconds;
                else return left?.Minutes < right?.Minutes;
            }
            else
                return left?.Hours < right?.Hours;
        }

        public static bool operator >=(Duration left, Duration right)
        {
            if (left?.Hours < right?.Hours)
            {
                if (left?.Minutes < right?.Minutes)
                    return left?.Seconds >= right?.Seconds;
                else return true;
            }
            else
                return true;
        }
        public static bool operator <=(Duration left, Duration right)
        {
            if (left?.Hours > right?.Hours)
            {
                if (left?.Minutes > right?.Minutes)
                    return left?.Seconds <= right?.Seconds;
                else return true;
            }
            else
                return true;
        }

        public static bool operator true(Duration d)
        {
            return d.ToSeconds() > 0;
        }
        public static bool operator false(Duration d)
        {
            return d.ToSeconds() == 0;
        }

        public static explicit operator DateTime(Duration d)
        {
            return new DateTime(1, 1, 1).AddSeconds(d.ToSeconds());
        }

        public override bool Equals(object? obj)
        {
            if (obj is Duration d)
                return this.ToSeconds() == d.ToSeconds();

            return false;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            if (Hours > 0)
                return $"Hours : {Hours}, Minutes : {Minutes}, Seconds : {Seconds}";
            else if (Hours == 0 && Minutes > 0)
                return $"Minutes : {Minutes}, Seconds : {Seconds}";
            else if (Hours == 0 && Minutes == 0)
                return $"Seconds : {Seconds}";
            else return "";
        }
    }
}
