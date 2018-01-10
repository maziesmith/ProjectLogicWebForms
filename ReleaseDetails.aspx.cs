using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ProjectLogic
{
    public partial class ReleaseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void MnuReleases_OnMenuItemClick_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = int.Parse(MnuReleases.SelectedValue);
            for (int i = 0; i <= MnuReleases.Items.Count - 1; i++)
            {
                MnuReleases.Items[i].Text = i == Convert.ToInt32(e.Item.Value) ? MnuReleases.Items[i].Text : MnuReleases.Items[i].Text;
            }
        }

        protected void FvGeneral_OnItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Delete":
                    break;
                case "Insert":
                    break;
                case "Update":
                    break;
            }
        }

        private static decimal GetTotalEstHours(string releaseId)
        {
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COALESCE(SUM(TotalEstHours),0) FROM vueProjectReleaseOpsSummary WHERE ProjectReleaseID = '" + releaseId + "'", connection);
            decimal scalar = (decimal)command.ExecuteScalar();
            connection.Close();
            return scalar;
        }

        private static decimal GetTotalActHours(string releaseId)
        {
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COALESCE(SUM(TotalActHours),0) FROM vueProjectReleaseOpsSummary WHERE ProjectReleaseID = '" + releaseId + "'", connection);
            decimal scalar = (decimal)command.ExecuteScalar();
            connection.Close();
            return scalar;
        }

        private static int GetPanelQty(string releaseId)
        {
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COALESCE(SUM(Qty),0) FROM tblProjectReleaseWork WHERE ProjectReleaseID = '" + releaseId + "'", connection);
            int scalar = (int)command.ExecuteScalar();
            connection.Close();
            return scalar;
        }

        private static double GetTotalSqFt(string releaseId)
        {
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT COALESCE(SUM(Qty*SqFt),0) FROM tblProjectReleaseWork WHERE ProjectReleaseID = '" + releaseId + "'", connection);
            double scalar = (double)command.ExecuteScalar();
            connection.Close();
            return scalar;
        }

        protected void FvGeneral_OnDataBound(object sender, EventArgs e)
        {
            if (FvGeneral.FindControl("LblTotalEstHours") == null)
            {
                return;
            }
            string releaseId = Request.QueryString["PRID"];
            Label lblTotalEstHours = (Label)FvGeneral.FindControl("LblTotalEstHours");
            Label lblTotalActHours = (Label)FvGeneral.FindControl("LblTotalActHours");
            Label lblPanelQty = (Label) FvGeneral.FindControl("LblPanelQty");
            Label lblSqFt = (Label) FvGeneral.FindControl("LblSqFt");

            lblTotalEstHours.Text = $"{GetTotalEstHours(releaseId):n2}";
            lblTotalActHours.Text = $"{GetTotalActHours(releaseId):n2}";
            lblPanelQty.Text = $"{GetPanelQty(releaseId):D}";
            lblSqFt.Text = $"{GetTotalSqFt(releaseId):n2}";
        }
    }
}