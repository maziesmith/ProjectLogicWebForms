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
    public partial class ProjectDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mnuProject.Items[0].Selected = true;
            }

            
            
            
        }


        protected void mnuProject_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = int.Parse(mnuProject.SelectedValue);
            for (int i = 0; i <= (mnuProject.Items.Count - 1); i++)
            {
                if (i == Convert.ToInt32(e.Item.Value))
                {
                    mnuProject.Items[i].Text = mnuProject.Items[i].Text;
                }
                else
                {
                    mnuProject.Items[i].Text = mnuProject.Items[i].Text;
                }
            }
        }

        protected void fvGeneral_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void fvScope_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void fvCAD_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void fvPM_ItemCommand(object sender, FormViewCommandEventArgs e)
        {

        }
        protected void fvPM_DataBound(Object sender, EventArgs e)
        {
            int BidPanels = 0;
            int RelToDate = 0;
            int PanelsRemain = 0;

            TextBox txtBidPanels = (TextBox)fvPM.FindControl("txtBidPanels");
            TextBox txtRelToDate = (TextBox)fvPM.FindControl("txtRelToDate");
            TextBox txtPanelsRemain = (TextBox)fvPM.FindControl("txtPanelsRemain");
            Label lblProjectID = (Label)this.fvHeader.FindControl("lblProjectID");

            String strProjectID = lblProjectID.Text.ToString();
            if (strProjectID != null)
            {
                String conString = ConfigurationManager.ConnectionStrings["ProjectLogicConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(conString);
                connection.Open();
                SqlCommand command1 = new SqlCommand("SELECT NumPanels FROM tblBid WHERE BidID = '" + strProjectID + "'", connection);
                BidPanels = (int)command1.ExecuteScalar();
                SqlCommand command2 = new SqlCommand("SELECT SUM(NumPanels) FROM vueProjectRelease WHERE ProjectID = '" + strProjectID + "'", connection);
                RelToDate = (int)command2.ExecuteScalar();
                PanelsRemain = BidPanels - RelToDate;
            }
            if (txtBidPanels != null)
            { txtBidPanels.Text = String.Format("{0:n0}",BidPanels); }
            if (txtRelToDate != null)
            { txtRelToDate.Text = String.Format("{0:n0}",RelToDate); }
            if (txtPanelsRemain != null)
            { txtPanelsRemain.Text = String.Format("{0:n0}",PanelsRemain); }
        }
        protected void GvPMShipment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ProjectShipmentID"));
                SqlDataSource source = new SqlDataSource
                {
                    ConnectionString = ConfigurationManager.ConnectionStrings["ProjectLogicConnectionString"].ConnectionString,
                    SelectCommand = "SELECT [ShippingID], [Date], [PaidBy], [TrackingNo], [Cost] FROM [tblShipping] WHERE ([ProjectShipmentID] = '" + str + "')"
                };
                GridView view1 = (GridView)e.Row.FindControl("gvPMShipmentSub");
                view1.DataSource = source;
                view1.DataBind();
            }

        }

        protected void GvPMShipment_DataBound(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = gvPMShipment.BottomPagerRow;
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("lblPages");
            LinkButton lbFirst = (LinkButton)pagerRow.Cells[0].FindControl("lbFirst");
            LinkButton lbPrev = (LinkButton)pagerRow.Cells[0].FindControl("lbPrev");
            LinkButton lbNext = (LinkButton)pagerRow.Cells[0].FindControl("lbNext");
            LinkButton lbLast = (LinkButton)pagerRow.Cells[0].FindControl("lbLast");

            if (pagelist != null)
            {
                for (int i=0; i<gvPMShipment.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if(i==gvPMShipment.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if(pageLabel != null)
            {
                int currentPage = gvPMShipment.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage.ToString() + " of " + gvPMShipment.PageCount.ToString();
            }
            if (gvPMShipment.PageIndex == 0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
            }
            else if (gvPMShipment.PageIndex == gvPMShipment.PageCount - 1)
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

        protected void ShipmentPagerDDL_SelectedIndexChanged(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = gvPMShipment.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            gvPMShipment.PageIndex = pageList.SelectedIndex;
        }
        protected void GvPMRelease_DataBound(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = gvPMRelease.BottomPagerRow;
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("lblPages");
            LinkButton lbFirst = (LinkButton)pagerRow.Cells[0].FindControl("lbFirst");
            LinkButton lbPrev = (LinkButton)pagerRow.Cells[0].FindControl("lbPrev");
            LinkButton lbNext = (LinkButton)pagerRow.Cells[0].FindControl("lbNext");
            LinkButton lbLast = (LinkButton)pagerRow.Cells[0].FindControl("lbLast");

            if (pagelist != null)
            {
                for (int i = 0; i < gvPMRelease.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if (i == gvPMRelease.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = gvPMRelease.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage.ToString() + " of " + gvPMRelease.PageCount.ToString();
            }

            if (gvPMRelease.PageIndex ==0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
            }
            else if (gvPMRelease.PageIndex == gvPMRelease.PageCount - 1)
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

        protected void ReleasePagerDDL_SelectedIndexChanged(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = gvPMRelease.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            gvPMRelease.PageIndex = pageList.SelectedIndex;
        }

        protected void gvProjectTask_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row1 = gvProjectTask.Rows[e.RowIndex];
            DropDownList list = (DropDownList)row1.FindControl("ddlEditTaskStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)row1.FindControl("txtCompDate")).Text) && (list.SelectedItem.Text == "Complete"))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Complete Date if Status is Complete.');", true);
                e.Cancel = true;
            }
            else
            {
                gvProjectTaskSQL.Update();
            }
        }


        protected void gvProjectTask_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string str = base.Request.QueryString["PID"];
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = ((GridView)MultiView1.Views[10].FindControl("gvProjectTask")).FooterRow;
                if (footerRow == null)
                {
                    return;
                }
                DropDownList list = (DropDownList)footerRow.FindControl("ddlEmployee");
                TextBox box = (TextBox)footerRow.FindControl("txtReleaseID");
                DropDownList list2 = (DropDownList)footerRow.FindControl("ddlTaskCode");
                DropDownList list3 = (DropDownList)footerRow.FindControl("ddlTaskStatus");
                DropDownList list4 = (DropDownList)footerRow.FindControl("ddlPriority");
                TextBox box2 = (TextBox)footerRow.FindControl("txtDueDate");
                TextBox box3 = (TextBox)footerRow.FindControl("txtNotes");
                TextBox box4 = (TextBox)footerRow.FindControl("txtCompDate");
                if (string.IsNullOrWhiteSpace(box2.Text))
                {
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Due Date.');", true);
                }
                else
                {
                    gvProjectTaskSQL.InsertParameters.Clear();
                    gvProjectTaskSQL.InsertParameters.Add("EmployeeID", list.SelectedValue);
                    gvProjectTaskSQL.InsertParameters.Add("ProjectID", str.ToString());
                    gvProjectTaskSQL.InsertParameters.Add("ReleaseID", box.Text);
                    gvProjectTaskSQL.InsertParameters.Add("TaskCodeID", list2.SelectedValue);
                    gvProjectTaskSQL.InsertParameters.Add("TaskStatusID", list3.SelectedValue);
                    gvProjectTaskSQL.InsertParameters.Add("TaskPriorityID", list4.SelectedValue);
                    gvProjectTaskSQL.InsertParameters.Add("DueDate", box2.Text);
                    gvProjectTaskSQL.InsertParameters.Add("Notes", box3.Text);
                    gvProjectTaskSQL.InsertParameters.Add("CompDate", box4.Text);
                    gvProjectTaskSQL.Insert();
                }
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow row2 = (GridViewRow)gvProjectTask.Controls[0].Controls[0];
                if (row2 != null)
                {
                    DropDownList list5 = (DropDownList)row2.FindControl("ddlEmployee");
                    TextBox box5 = (TextBox)row2.FindControl("txtReleaseID");
                    DropDownList list6 = (DropDownList)row2.FindControl("ddlTaskCode");
                    DropDownList list7 = (DropDownList)row2.FindControl("ddlStatus");
                    DropDownList list8 = (DropDownList)row2.FindControl("ddlPriority");
                    TextBox box6 = (TextBox)row2.FindControl("txtDueDate");
                    TextBox box7 = (TextBox)row2.FindControl("txtNotes");
                    TextBox box8 = (TextBox)row2.FindControl("txtCompDate");
                    if (string.IsNullOrWhiteSpace(box6.Text))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Due Date.');", true);
                    }
                    else
                    {
                        gvProjectTaskSQL.InsertParameters.Clear();
                        gvProjectTaskSQL.InsertParameters.Add("EmployeeID", list5.SelectedValue);
                        gvProjectTaskSQL.InsertParameters.Add("ProjectID", str.ToString());
                        gvProjectTaskSQL.InsertParameters.Add("ReleaseID", box5.Text);
                        gvProjectTaskSQL.InsertParameters.Add("TaskCodeID", list6.SelectedValue);
                        gvProjectTaskSQL.InsertParameters.Add("TaskStatusID", list7.SelectedValue);
                        gvProjectTaskSQL.InsertParameters.Add("TaskPriorityID", list8.SelectedValue);
                        gvProjectTaskSQL.InsertParameters.Add("DueDate", box6.Text);
                        gvProjectTaskSQL.InsertParameters.Add("Notes", box7.Text);
                        gvProjectTaskSQL.InsertParameters.Add("CompDate", box8.Text);
                        gvProjectTaskSQL.Insert();
                    }
                }
            }
        }

        protected void gvSubmittals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void gvSubmittals_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }

        
    }
}