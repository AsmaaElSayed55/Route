using Microsoft.AspNetCore.Mvc;
using Test.Models;

namespace Test.Controllers
{
    public class MoviesController:Controller
    {
        public string Index()
        {
            return "Hello From Index";
        }

        // BaseUrl/Movies/GetMovie/10
        [HttpGet] // I Return Data From Database
        public IActionResult GetMovie(int? id)
        {
            //ContentResult result=new ContentResult();
            //result.Content = $"Movie With Id : {id} Is Avatar";
            //return result;
            // return $"Movie With Id : {id} Is Avatar";

            if (id == 0)
            {
                return BadRequest();
            }
            else if (id > 100)
            {
                return NotFound();
            }
            else if (id > 0 && id < 100)
            {
                return Content($"Movie With Id : {id} Is Avatar");
            }
            else 
                return Content("An Error");
        }

        public IActionResult TestRedirectAction()
        {
            return Redirect("https://localhost:44302/Movies/GetMovie/25");
        }

        [HttpPost] // I Take Input To Put It In Database
        public IActionResult TestModelBinding([FromBody]Movie movie)
        {
            return Content($"Movie With Id : {movie.Id} The Film is :: {movie.Title}");
        }

    }
}
