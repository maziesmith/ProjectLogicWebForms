using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace ProjectLogic
{
    public partial class MatOrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((Label)LvMatOrders.Controls[0].Controls[0].FindControl("LblProjectID")).Text = "#####";
            }
        }

        protected void BtnSearch_Command(object sender, CommandEventArgs e)
        {
            // Look for LblProjectID in EmptyDataTemplate
            Label lbl = (Label)LvMatOrders.Controls[0].Controls[0].FindControl("LblProjectID");
            if (lbl != null) { lbl.Text = string.IsNullOrEmpty(TxtProjectID.Text) ? "#####" : TxtProjectID.Text; }
        }

        protected void LvMatOrders_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((e.CommandName == "NewInsert") && Page.IsValid)
            {
                string conString = System.Configuration.ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conString);
                connection.Open();
                SqlCommand command1 = new SqlCommand("SELECT COUNT(*) FROM tblProject WHERE ProjectID = @ProjectID", connection);
                command1.Parameters.AddWithValue("@ProjectID", TxtProjectID.Text);
                int num1 = (int)command1.ExecuteScalar();

                if (num1 == 1) // ProjectID exists
                {
                    SqlCommand command2 = new SqlCommand("SELECT Scope_PM_EmployeeID FROM tblProject WHERE ProjectID = @ProjectID", connection);
                    command2.Parameters.AddWithValue("@ProjectID", TxtProjectID.Text);
                    int num2 = (int)command2.ExecuteScalar();
                    String strOrderedby = num2.ToString();
                    String strOrderDate = DateTime.Now.ToShortDateString();

                    
                    LvMatOrdersSQL.InsertParameters["ProjectID"].DefaultValue= TxtProjectID.Text;
                    LvMatOrdersSQL.InsertParameters["OrderedByEmpID"].DefaultValue= strOrderedby;
                    LvMatOrdersSQL.InsertParameters["ReasonID"].DefaultValue= "1";
                    LvMatOrdersSQL.InsertParameters["OrderDate"].DefaultValue= strOrderDate;
                    LvMatOrdersSQL.Insert();
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a valid Project number.');", true);
                }
            }
        }

        protected void LvMatOrdersSQL_OnInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String strOrderId = e.Command.Parameters["@NewOrderID"].Value.ToString();
            Response.Redirect("~/MatOrder/" + strOrderId);
        }
    }
}