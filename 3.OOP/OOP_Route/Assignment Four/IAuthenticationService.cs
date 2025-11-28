using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_Four
{
    internal interface IAuthenticationService
    {
        string UserName { get; set; }
        string Password { get; set; }
        string Role {  get; set; }
        bool AuthenticateUser(string username,string password);
        bool AuthorizeUser(string username , string role );
    }
}
