using Microsoft.AspNetCore.Mvc;

namespace Test.Controllers
{
    public class MoviesController:Controller
    {
        public string Index()
        {
            return "Hello From Index";
        }

        // BaseUrl/Movies/GetMovie/10
        public void GetMovie(int? id)
        {

        }
    }
}
