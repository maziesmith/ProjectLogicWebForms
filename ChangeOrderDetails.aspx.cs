using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectLogic
{
    public partial class ChangeOrderDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control navbar = Master.FindControl("navbar");
            Control footer = Master.FindControl("footer");
            navbar.Visible = false;
            footer.Visible = false;

            if (!IsPostBack)
            {

            }
        }

        protected void FvChangeOrder_OnItemCommand(object sender, FormViewCommandEventArgs e)
        {
            
        }

        protected void FvChangeOrder_OnDataBound(object sender, EventArgs e)
        {
            
        }

    }
}