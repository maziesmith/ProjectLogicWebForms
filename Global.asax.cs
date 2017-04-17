using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

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