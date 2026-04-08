namespace Assignment_Two
{
    internal class Program
    {
        static int Qu_1(List<int> list,int value)
        {
            int num=list.BinarySearch(value);
            if (num < -1) return 0;
            else if (num == -1) return list.Count;
            else return list.Count() - num+1;  
        }

        static bool Palindrome(List<int> list)
        {
            int i = 0,j = list.Count();
            for(;i<list.Count()/2;i++)
            {
                if (list[i] != list[--j])
                    return false;
            }
            return true;
        }
        static void Main(string[] args)
        {
            #region Question 1

            //int.TryParse(Console.ReadLine(), out var n);
            //int.TryParse(Console.ReadLine(), out var q);
            //List<int> list=new List<int>(n);
            //for (int i = 0; i < n; i++)
            //{
            //    int.TryParse(Console.ReadLine(), out var x);
            //    list.Add(x);
            //}
            //list.Sort();
            //while(q>0)
            //{
            //    int.TryParse(Console.ReadLine(), out var value);
            //    Console.WriteLine(Qu_1(list, value));
            //}

            #endregion

            #region Question 2

            int.TryParse(Console.ReadLine(), out int N);
            List<int> Numbers= new List<int>(N);
            for(int i=0;i<N;i++)
            {
                int.TryParse(Console.ReadLine(), out int x);
                Numbers.Add(x);
            }

            if (Palindrome(Numbers))
                Console.WriteLine("This List Is Palinrome");
            else Console.WriteLine("This List Is Not Palindrome");

            #endregion
        }
    }
}
