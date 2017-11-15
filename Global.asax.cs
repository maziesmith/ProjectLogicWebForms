using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace ProjectLogic
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Add Routes.
            RegisterCustomRoutes(RouteTable.Routes);

            // jquery UnobtrusiveValidationMode fix
            string JQueryVer = "3.2.1";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-" + JQueryVer + ".min.js",
                DebugPath = "~/Scripts/jquery-" + JQueryVer + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });
        }

        void RegisterCustomRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "Project",
                "Project/{ProjectID}",
                "~/ProjectDetails.aspx");
            routes.MapPageRoute(
                "BookingForm",
                "BookingForm/{BFID}",
                "~/BFDetails.aspx");
            routes.MapPageRoute(
                "MatOrder",
                "MatOrder/{OrderID}",
                "~/MatOrderDetails.aspx");
        }
    }
}