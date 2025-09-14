using Microsoft.AspNetCore.Mvc;
using Test.Models;

namespace Test.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View(); // Return View with Same Name Of Action
                           // return View("Asmaa"); // Return View With Specific Name 
                           // return View(new Movie()); // Return View With Same Name Of Action + Take Model To Bind View With Model Data
                           // return View("Asmaa",new Movie());

        }
        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult AboutUs()
        {
            return View();
        }

        public IActionResult ContactUs()
        {
            return View();
        }
    }
}
