namespace Assignment_4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Q1
            /*
             Create a program that asks the user to input three points 
            (x1, y1), (x2, y2), and (x3, y3), and determines whether 
            these points lie on a single straight line.
            */
            int x1 = int.Parse(Console.ReadLine()), y1 = int.Parse(Console.ReadLine()),
            x2 = int.Parse(Console.ReadLine()), y2 = int.Parse(Console.ReadLine()),
            x3 = int.Parse(Console.ReadLine()), y3 = int.Parse(Console.ReadLine());

            if ((y2 - y1) * (x3 - x2) == (y3 - y2) * (x2 - x1))
                Console.WriteLine("These points lie on a single straight line.\r\n");
            else Console.WriteLine("These points dose not lie on a single straight line.\r\n");
            #endregion

            #region Q2
            /*
             2- Within a company, the efficiency of workers is evaluated 
             based on the duration required to complete a specific task. 
             A worker's efficiency level is determined as follows: 
             - If the worker completes the job within 2 to 3 hours, 
             they are considered highly efficient. 
             - If the worker takes 3 to 4 hours, they are instructed to 
             increase their speed. 
             - If the worker takes 4 to 5 hours, they are provided with 
             training to enhance their speed. 
             - If the worker takes more than 5 hours, they are required 
             to leave the company. 
             To calculate the efficiency of a worker, the time taken for 
             the task is obtained via user input from the keyboard.
            */
            Console.Write("Enter time taken to complete the task (in hours): ");
            double time = Convert.ToDouble(Console.ReadLine());

            if (time >= 2 && time <= 3)
            {
                Console.WriteLine("Highly efficient.");
            }
            else if (time > 3 && time <= 4)
            {
                Console.WriteLine("Increase your speed.");
            }
            else if (time > 4 && time <= 5)
            {
                Console.WriteLine("Training required to improve speed.");
            }
            else if (time > 5)
            {
                Console.WriteLine("You are to leave the company.");
            }
            else
            {
                Console.WriteLine("Invalid input. Time must be at least 2 hours.");
            }
            #endregion

            #region Q3
            /*
             26- Given a list of space separated words, reverse the order of the words.
             Input: this is a test		Output: test a is this
             Input: all your base		Output: base your all
             Input: Word			Output: Word
             Note : 
             Check the Split Function (Member in String Class) Output will be a Single Console.WriteLine Statement
            */
            string s;
            s = Console.ReadLine();
            Console.WriteLine(string.Join(" ", s.Split(' ', StringSplitOptions.RemoveEmptyEntries).Reverse()));
            #endregion
        }
    }
}
