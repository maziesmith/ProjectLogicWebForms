using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectLogic
{
    public partial class ProjectDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MnuProject.Items[0].Selected = true;

                
            }
        }


        protected void MnuProject_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = int.Parse(MnuProject.SelectedValue);
            for (int i = 0; i <= MnuProject.Items.Count - 1; i++)
            {
                MnuProject.Items[i].Text = i == Convert.ToInt32(e.Item.Value) ? MnuProject.Items[i].Text : MnuProject.Items[i].Text;
            }
        }

        protected void FvGeneral_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void FvScope_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void FvCAD_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void FvPM_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void FvPM_DataBound(object sender, EventArgs e)
        {
            int bidPanels = 0;
            int relToDate = 0;
            int panelsRemain = 0;

            TextBox txtBidPanels = (TextBox)FvPM.FindControl("TxtBidPanels");
            TextBox txtRelToDate = (TextBox)FvPM.FindControl("TxtRelToDate");
            TextBox txtPanelsRemain = (TextBox)FvPM.FindControl("TxtPanelsRemain");
            Label lblProjectId = (Label)FvHeader.FindControl("LblProjectID");

            String strProjectId = lblProjectId.Text;
            if (strProjectId != null)
            {
                String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conString);
                connection.Open();
                SqlCommand command1 = new SqlCommand("SELECT NumPanels FROM tblBid WHERE BidID = '" + strProjectId + "'", connection);
                bidPanels = (int)command1.ExecuteScalar();
                SqlCommand command2 = new SqlCommand("SELECT SUM(NumPanels) FROM vueProjectRelease WHERE ProjectID = '" + strProjectId + "'", connection);
                var cmd2 = command2.ExecuteScalar();
                if (cmd2 != DBNull.Value)
                {
                    relToDate = (int) cmd2;
                }
                else relToDate = 0;


                panelsRemain = bidPanels - relToDate;
                connection.Close();
            }
            if (txtBidPanels != null)
            { txtBidPanels.Text = $"{bidPanels:n0}"; }
            if (txtRelToDate != null)
            { txtRelToDate.Text = $"{relToDate:n0}"; }
            if (txtPanelsRemain != null)
            { txtPanelsRemain.Text = $"{panelsRemain:n0}"; }
        }
        protected void GvPMShipment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ProjectShipmentID"));
                SqlDataSource source = new SqlDataSource
                {
                    ConnectionString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString,
                    SelectCommand = "SELECT [ShippingID], [Date], [PaidBy], [TrackingNo], [Cost] FROM [tblShipping] WHERE ([ProjectShipmentID] = '" + str + "')"
                };
                GridView view1 = (GridView)e.Row.FindControl("GvPMShipmentSub");
                view1.DataSource = source;
                view1.DataBind();
            }

        }

        protected void GvPMShipment_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvPMShipment.BottomPagerRow;
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("LblPages");
            LinkButton lbFirst = (LinkButton)pagerRow.Cells[0].FindControl("LbFirst");
            LinkButton lbPrev = (LinkButton)pagerRow.Cells[0].FindControl("LbPrev");
            LinkButton lbNext = (LinkButton)pagerRow.Cells[0].FindControl("LbNext");
            LinkButton lbLast = (LinkButton)pagerRow.Cells[0].FindControl("LbLast");

            if (pagelist != null)
            {
                for (int i=0; i<GvPMShipment.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if(i==GvPMShipment.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if(pageLabel != null)
            {
                int currentPage = GvPMShipment.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage + " of " + GvPMShipment.PageCount;
            }
            if (GvPMShipment.PageIndex == 0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
            }
            else if (GvPMShipment.PageIndex == GvPMShipment.PageCount - 1)
            {
                lbNext.Visible = false;
                lbLast.Visible = false;
            }
            else
            {
                lbFirst.Visible = true;
                lbPrev.Visible = true;
                lbNext.Visible = true;
                lbLast.Visible = true;
            }
        }

        protected void ShipmentPagerDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvPMShipment.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            GvPMShipment.PageIndex = pageList.SelectedIndex;
        }
        protected void GvPMRelease_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvPMRelease.BottomPagerRow;
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("LblPages");
            LinkButton lbFirst = (LinkButton)pagerRow.Cells[0].FindControl("LbFirst");
            LinkButton lbPrev = (LinkButton)pagerRow.Cells[0].FindControl("LbPrev");
            LinkButton lbNext = (LinkButton)pagerRow.Cells[0].FindControl("LbNext");
            LinkButton lbLast = (LinkButton)pagerRow.Cells[0].FindControl("LbLast");

            if (pagelist != null)
            {
                for (int i = 0; i < GvPMRelease.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if (i == GvPMRelease.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = GvPMRelease.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage + " of " + GvPMRelease.PageCount;
            }

            if (GvPMRelease.PageIndex ==0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
            }
            else if (GvPMRelease.PageIndex == GvPMRelease.PageCount - 1)
            {
                lbNext.Visible = false;
                lbLast.Visible = false;
            }
            else
            {
                lbFirst.Visible = true;
                lbPrev.Visible = true;
                lbNext.Visible = true;
                lbLast.Visible = true;
            }
        }

        protected void ReleasePagerDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvPMRelease.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            GvPMRelease.PageIndex = pageList.SelectedIndex;
        }

        protected void GvProjectTask_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = GvProjectTask.Rows[e.RowIndex];
            DropDownList list = (DropDownList)gvrow.FindControl("DdlEditTaskStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)gvrow.FindControl("TxtCompDate")).Text) && list.SelectedItem.Text == "Complete")
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Complete Date if Status is Complete.');", true);
                e.Cancel = true;
            }
            else
            {
                GvProjectTaskSQL.Update();
            }
        }


        protected void GvProjectTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            switch (e.CommandName)
            {
                case "FooterInsert" when Page.IsValid:
                    GridViewRow footerRow = ((GridView)MultiView1.Views[10].FindControl("GvProjectTask")).FooterRow;
                    GvProjectTaskRowInsert(footerRow);
                    break;
                case "EmptyInsert" when Page.IsValid:
                    GridViewRow emptyRow = (GridViewRow)GvProjectTask.Controls[0].Controls[0];
                    GvProjectTaskRowInsert(emptyRow);
                    break;
            }
        }

        private void GvProjectTaskRowInsert(GridViewRow gvRow)
        {
            
            string strProjectId = Request.QueryString["PID"];
            if (gvRow == null)
            {
                return;
            }
            DropDownList ddlEmployee = (DropDownList)gvRow.FindControl("DdlEmployee");
            TextBox txtReleaseId = (TextBox)gvRow.FindControl("TxtReleaseID");
            DropDownList ddlTaskCode = (DropDownList)gvRow.FindControl("DdlTaskCode");
            DropDownList ddlTaskStatus = (DropDownList)gvRow.FindControl("DdlTaskStatus");
            DropDownList ddlPriority = (DropDownList)gvRow.FindControl("DdlPriority");
            TextBox txtDueDate = (TextBox)gvRow.FindControl("TxtDueDate");
            TextBox txtNotes = (TextBox)gvRow.FindControl("TxtNotes");
            TextBox txtCompDate = (TextBox)gvRow.FindControl("TxtCompDate");
            if (string.IsNullOrWhiteSpace(txtDueDate.Text))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Due Date.');", true);
            }
            else
            {
                GvProjectTaskSQL.InsertParameters.Clear();
                GvProjectTaskSQL.InsertParameters.Add("EmployeeID", ddlEmployee.SelectedValue);
                GvProjectTaskSQL.InsertParameters.Add("ProjectID", strProjectId);
                GvProjectTaskSQL.InsertParameters.Add("ReleaseID", txtReleaseId.Text);
                GvProjectTaskSQL.InsertParameters.Add("TaskCodeID", ddlTaskCode.SelectedValue);
                GvProjectTaskSQL.InsertParameters.Add("TaskStatusID", ddlTaskStatus.SelectedValue);
                GvProjectTaskSQL.InsertParameters.Add("TaskPriorityID", ddlPriority.SelectedValue);
                GvProjectTaskSQL.InsertParameters.Add("DueDate", txtDueDate.Text);
                GvProjectTaskSQL.InsertParameters.Add("Notes", txtNotes.Text);
                GvProjectTaskSQL.InsertParameters.Add("CompDate", txtCompDate.Text);
                GvProjectTaskSQL.Insert();
            }
        }

        protected void GvSubmittals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void GvSubmittals_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }


        protected void LbNewShipment_OnClick(object sender, EventArgs e)
        {
            
        }

        protected void LbNewChangeOrder_OnClick(object sender, EventArgs e)
        {
            
        }

        protected void GvChangeOrders_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FooterInsert":
                {
                    GridViewRow gvRow = GvChangeOrders.FooterRow;
                        GvChangeOrderRowInsert(gvRow);
                    break;
                }
                case "EmptyInsert":
                {
                    GridViewRow gvRow = (GridViewRow)GvChangeOrders.Controls[0].Controls[0];
                    GvChangeOrderRowInsert(gvRow);
                        break;
                }
            }
        }

        private void GvChangeOrderRowInsert(GridViewRow gvRow)
        {
            if (gvRow == null)
            {
                return;
            }
            
            Label lblProjectId = (Label)FvHeader.FindControl("LblProjectID");
            string strProjectId = lblProjectId.Text;
            TextBox txtDate = (TextBox) gvRow.FindControl("TxtDate");
            TextBox txtAmount = (TextBox) gvRow.FindControl("TxtAmount");
            DropDownList ddlSource = (DropDownList) gvRow.FindControl("DdlSource");
            TextBox txtDateDue = (TextBox) gvRow.FindControl("TxtDateDue");
            TextBox txtDateRecd = (TextBox) gvRow.FindControl("TxtDateRecd");
            DropDownList ddlStatus = (DropDownList) gvRow.FindControl("DdlStatus");
            TextBox txtDescription = (TextBox) gvRow.FindControl("TxtDescription");
            
            string[] name = Environment.UserName.Split('.');
            string firstName = name[0];
            string lastName = name[1];

            
            String conString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT TOP 1 COALESCE(SeqNo,0) FROM tblProjectChangeOrder WHERE ProjectID = '" + strProjectId + "' ORDER BY SeqNo DESC", connection);
            int scalar = (int) command.ExecuteScalar();
            SqlCommand cmdGetUserId = new SqlCommand("SELECT UserID FROM tblUser AS u INNER JOIN tblEmployee AS e ON u.EmployeeID = e.EmployeeID " +
                "WHERE e.Name ='"+firstName+" "+lastName+"'", connection);
            string userId = (string)cmdGetUserId.ExecuteScalar();
            connection.Close();
            String strSeqNo = (scalar + 1).ToString();

            if (string.IsNullOrWhiteSpace(userId))
            {
                ClientScript.RegisterStartupScript(GetType(), "error",
                    "alert('No link between UserID and current user.');", true);
            }

            else
            {
                GvChangeOrdersSQL.InsertParameters.Clear();
                GvChangeOrdersSQL.InsertParameters.Add("ProjectID", strProjectId);
                GvChangeOrdersSQL.InsertParameters.Add("SeqNo", strSeqNo);
                GvChangeOrdersSQL.InsertParameters.Add("Amount", txtAmount.Text);
                GvChangeOrdersSQL.InsertParameters.Add("Source", ddlSource.SelectedValue);
                GvChangeOrdersSQL.InsertParameters.Add("EnteredBy_UserID", userId);
                GvChangeOrdersSQL.InsertParameters.Add("Date", txtDate.Text);
                GvChangeOrdersSQL.InsertParameters.Add("DateDue", txtDateDue.Text);
                GvChangeOrdersSQL.InsertParameters.Add("DateRecd", txtDateRecd.Text);
                GvChangeOrdersSQL.InsertParameters.Add("Status", ddlStatus.SelectedValue);
                GvChangeOrdersSQL.InsertParameters.Add("Description", txtDescription.Text);
                GvChangeOrdersSQL.InsertParameters.Add("NumPanels", "0");
                GvChangeOrdersSQL.InsertParameters.Add("IsCommissionable", "True");
                GvChangeOrdersSQL.Insert();
            }
        }

        protected void GvChangeOrders_OnDataBound(object sender, EventArgs e)
        {
            
        }
    }
}