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

            Label lblProjectId = (Label)FvChangeOrder.FindControl("LblProjectID");
            String strProjectId = lblProjectId.Text;
            DdlShipmentSQL.SelectParameters["ProjectID"].DefaultValue = strProjectId;
            DataBind();


            String strChangeOrderId = FvChangeOrder.DataKey["ProjectChangeOrderID"].ToString();
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COALESCE(pco.ProjectShipmentID,0) FROM tblProjectChangeOrder pco " +
            "LEFT JOIN tblProjectShipment ps ON pco.ProjectShipmentID = ps.ProjectShipmentID " +
            "WHERE pco.ProjectChangeOrderID = " + strChangeOrderId, connection);
            int scalar = (int)command.ExecuteScalar();
            connection.Close();
            DropDownList ddlShipment = (DropDownList)FvChangeOrder.FindControl("DdlShipment");
            ddlShipment.SelectedValue = scalar == 0 ? "" : scalar.ToString();
        }

        protected void FvChangeOrder_OnItemCommand(object sender, FormViewCommandEventArgs e)
        {
            
        }

        protected void FvChangeOrder_OnDataBound(object sender, EventArgs e)
        {
            
        }

    }
}