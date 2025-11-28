using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Four
{
    internal class AuthenticationService : IAuthenticationService
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }

        public bool AuthenticateUser(string username, string password)
        {
            return username == UserName && Password==password; 
        }

        public bool AuthorizeUser(string username, string role)
        {
            return username==UserName && role == Role;
        }
    }
}
