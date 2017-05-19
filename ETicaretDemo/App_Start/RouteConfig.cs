using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace ETicaretDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            /*
            routes.MapRoute(
                     name: "RegisterMapRoute",
                     url: "{Register}/{RegisterPage}",
                     defaults: new
                     {
                         controller = "Register",
                         action = "RegisterPage",
                         id = UrlParameter.Optional
                     });
            */
            /*
             routes.MapRoute(
             name: "ProductMapRoute",
             url: "{Product}/{Datails}/{id}",
             defaults: new
             {
                 controller = "Product",
                 action = "Datails",
                 id = UrlParameter.Optional
             });
            */
            routes.MapRoute(
                 name: "Default",
                    url: "{controller}/{action}/{id}",
                    defaults: new
                    {
                        controller = "Home",
                        action = "Index",
                        id = UrlParameter.Optional
                    }
                );

            /*
            routes.MapRoute(
               name: "ProductMapRoute",
               url: "{Product}/{Datails}/{id}",
               defaults: new
               {
                   controller = "Product",
                   action = "Datails",
                   id = UrlParameter.Optional
               });
            */

            /*
            routes.MapRoute(
                     name: "LoginMapRoute",
                     url: "{Login}/{LoginPage}/{id}",
                     defaults: new
                     {
                         controller = "Login",
                         action = "LoginPage",
                         id = UrlParameter.Optional
                     });
            */
         
            
            


        }
    }
}