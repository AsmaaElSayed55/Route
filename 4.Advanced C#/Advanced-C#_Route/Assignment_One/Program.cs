using System.Collections;

namespace Assignment_One
{
    internal class Program
    {
        public static void Swap(ref ArrayList list, int i,int j)
        {
            var temp = list[i];
            list[i] = list[j];
            list[j] = temp;
        }
        public static void Reverse<T>(ref ArrayList list)
        {
            int j = list.Count - 1;
            for(int i=0; i<list.Count/2; i++)
            {
                Swap(ref list,i,j--);
            }
        }

        public static ArrayList EvenNumber(ArrayList list)
        {
            ArrayList Even = new ArrayList();
            for (int j = 0; j < list.Count; j++)
            {
                int num=(int) list[j];
                if (list[j] is not null && num%2==0)
                    Even.Add(list[j]);
            }
            return Even;
        }
        static void Main(string[] args)
        {
            #region Q1

            int.TryParse(Console.ReadLine(), out int num1);
            int.TryParse(Console.ReadLine(), out int num2);

            Range<int> range = new Range<int>(num1, num2);
            Console.WriteLine(range.IsInRange(20));

            #endregion

            #region Q2

            int.TryParse(Console.ReadLine(), out int n);
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < n; i++)
            {
                int.TryParse(Console.ReadLine(), out int num);
                arrayList.Add(num);
            }

            Console.WriteLine("Before Reversing");
            foreach(int i in arrayList)
                Console.Write(i+" ");

            Reverse<ArrayList>(ref arrayList);

            Console.WriteLine();
            Console.WriteLine("After Reversing");

            foreach (int i in arrayList)
                Console.Write(i + " ");

            #endregion

            #region Q3

            int.TryParse(Console.ReadLine(), out int N);
            ArrayList Numbers = new ArrayList();
            for (int i = 0; i < N; i++)
            {
                int.TryParse(Console.ReadLine(), out int num);
                Numbers.Add(num);
            }
            ArrayList Even=new ArrayList();
            Even=EvenNumber(Numbers);

            Console.WriteLine("Even Numbers");
            foreach (int i in Even)
                Console.Write(i + " ");

            #endregion

            #region Q4

            List<int> FixedSizeList = new List<int>();


            #endregion

        }
    }
}
