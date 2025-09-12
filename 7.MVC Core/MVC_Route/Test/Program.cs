using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Test
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var WebApplicationBuilder = WebApplication.CreateBuilder();

            #region Configure Services
            WebApplicationBuilder.Services.AddControllersWithViews();

            #endregion

            #region Configure MiddleWare

            var app = WebApplicationBuilder.Build();


            if (app.Environment.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            //app.UseEndpoints(endpoints =>
            //{
            //    endpoints.MapGet("/", async context =>
            //    {
            //        await context.Response.WriteAsync("Hello World!");
            //    });
            //});

            //app.MapGet("/Route", () => "Hello World");
            //app.MapGet("/X{name}", async context=>
            //{
            //    var Name = context.GetRouteValue("name");
            //    await context.Response.WriteAsync($"Hello:{context.Request.RouteValues["name"]}");
            //});

            app.MapControllerRoute(name: "Default", pattern: "{controller=Movies}/{action=Index}/{Id:regex(^\\d{{2}}$)?}"
                //,defaults:new { action = "Index", controller = "Movies" }
                );

            #endregion



            app.Run();


        }  
    }
}
