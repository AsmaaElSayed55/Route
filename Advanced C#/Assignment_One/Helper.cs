using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_One
{
    internal class Helper
    {
        #region Before Genarics
        public static void Swap(ref int x, ref int y)
        {
            Console.WriteLine("-------------- Swap --------------");
            int temp = x;
            x = y; y = temp;
        }

        public static void Swap(ref double x, ref double y)
        {
            Console.WriteLine("-------------- Swap --------------");
            double temp = x;
            x = y; y = temp;
        }

        public static void Swap(ref Point x, ref Point y)
        {
            Console.WriteLine("-------------- Swap --------------");
            Point temp = x;
            x = y; y = temp;
        }

        public static int SearchArray(int[] Numbers, int Value)
        {
            if (Numbers is not null)
            {
                for (int i = 0; i < Numbers.Length; i++)
                {
                    if(Numbers[i] == Value)
                        return i;
                }
            }
            return -1;
        }
        #endregion

        #region After Genarics
        // T
        public static void Swap<T>(ref T x, ref T y)
        {
            Console.WriteLine("-------------- Swap --------------");
            T temp = x;
            x = y; y = temp;
        }
        public static int SearchArray<T>(T[] Numbers, T Value)
        {
            if (Numbers is not null)
            {
                for (int i = 0; i < Numbers.Length; i++)
                {
                    if (Numbers[i].Equals(Value))
                        return i;
                }
            }
            return -1;
        }
        #endregion
    }
}
