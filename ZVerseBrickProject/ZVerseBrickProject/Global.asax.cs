using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using ZVerseBrickProject.Models;
using System.Web.Http;
using ZVerseBrickProject.UserRoles;


namespace ZVerseBrickProject
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Initialize the product database.
            Database.SetInitializer(new ProductDatabaseInitializer());

            //Add routing information
            RouteTable.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new {id= System.Web.Http.RouteParameter.Optional });

            // Create the custom role and user
            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();
        }
    }
}