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
                ((Label)LvBFList.Controls[0].Controls[0].FindControl("LblProjectID")).Text = "#####";
            }

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // Look for LblProjectID in EmptyDataTemplate
            Label lbl = (Label)LvBFList.Controls[0].Controls[0].FindControl("LblProjectID");
            if (lbl != null) { lbl.Text = (string.IsNullOrEmpty(TxtProjectID.Text)) ? "#####" : TxtProjectID.Text; }
        }


        protected void LvBFList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if ((e.CommandName != "NewInsert") || !Page.IsValid) return;
            String conString = System.Configuration.ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command1 = new SqlCommand("SELECT COUNT(*) FROM tblProject WHERE ProjectID = @ProjectID", connection);
            command1.Parameters.AddWithValue("@ProjectID", TxtProjectID.Text);
            int num1 = (int)command1.ExecuteScalar();

            if (num1 != 1) return;
            
            LvBFListSQL.InsertParameters["ProjectID"].DefaultValue= TxtProjectID.Text;
            LvBFListSQL.Insert();
        }

        protected void LvBFListSQL_OnInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            String strOrderId = e.Command.Parameters["@NewBFID"].Value.ToString();
            Response.Redirect("~/BookingForm/" + strOrderId);
        }
    }
}