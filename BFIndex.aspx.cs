using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using System.Data.SqlClient;

namespace ProjectLogic
{
    public partial class BFList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ((Label)lvBFList.Controls[0].Controls[0].FindControl("lblProjectID")).Text = "#####";
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Look for lblProjectID in EmptyDataTemplate
            Label lbl = (Label)lvBFList.Controls[0].Controls[0].FindControl("lblProjectID");
            if (lbl != null) { lbl.Text = (string.IsNullOrEmpty(txtProjectID.Text)) ? "#####" : txtProjectID.Text; }
        }


        protected void lvBFList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((e.CommandName == "NewInsert") && Page.IsValid)
            {
                String conString = System.Configuration.ConfigurationManager.ConnectionStrings["ProjectLogicConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conString);
                connection.Open();
                SqlCommand command1 = new SqlCommand("SELECT COUNT(*) FROM tblProject WHERE ProjectID = @ProjectID", connection);
                command1.Parameters.AddWithValue("@ProjectID", txtProjectID.Text);
                int num1 = (int)command1.ExecuteScalar();

                if (num1 == 1) // Project ID exists
                {
                    lvBFListSQL.InsertParameters.Clear();
                    lvBFListSQL.InsertParameters.Add("ProjectID", txtProjectID.Text);
                    lvBFListSQL.Insert();
                }
            }
        }
    }
}