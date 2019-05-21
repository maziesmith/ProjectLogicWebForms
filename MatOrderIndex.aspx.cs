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
                ((Label)lvMatOrders.Controls[0].Controls[0].FindControl("lblProjectID")).Text = "#####";
            }
        }

        protected void btnSearch_Command(object sender, CommandEventArgs e)
        {
            // Look for lblProjectID in EmptyDataTemplate
            Label lbl = (Label)lvMatOrders.Controls[0].Controls[0].FindControl("lblProjectID");
            if (lbl != null) { lbl.Text = (string.IsNullOrEmpty(txtProjectID.Text)) ? "#####" : txtProjectID.Text; }
        }

        protected void lvMatOrders_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((e.CommandName == "NewInsert") && Page.IsValid)
            {
                string conString = System.Configuration.ConfigurationManager.ConnectionStrings["ProjectLogicConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conString);
                connection.Open();
                SqlCommand command1 = new SqlCommand("SELECT COUNT(*) FROM tblProject WHERE ProjectID = @ProjectID", connection);
                command1.Parameters.AddWithValue("@ProjectID", txtProjectID.Text);
                int num1 = (int)command1.ExecuteScalar();

                if (num1 == 1) // ProjectID exists
                {
                    SqlCommand command2 = new SqlCommand("SELECT Scope_PM_EmployeeID FROM tblProject WHERE ProjectID = @ProjectID", connection);
                    command2.Parameters.AddWithValue("@ProjectID", txtProjectID.Text);
                    int num2 = (int)command2.ExecuteScalar();
                    String strOrderedby = num2.ToString();
                    //String strOrderDate = DateTime.Now.ToString("MM/DD/YYYY");

                    lvMatOrdersSQL.InsertParameters.Clear();
                    lvMatOrdersSQL.InsertParameters.Add("ProjectID", txtProjectID.Text);
                    lvMatOrdersSQL.InsertParameters.Add("OrderedByEmpID", strOrderedby);
                    lvMatOrdersSQL.InsertParameters.Add("ReasonID", "1");
                    //lvMatOrdersSQL.InsertParameters.Add("OrderDate", strOrderDate);
                    lvMatOrdersSQL.Insert();
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter a valid Project number.');", true);
                }
            }
        }
    }
}