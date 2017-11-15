using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;

namespace ProjectLogic
{
    public partial class Timecards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TxtFrom.Text = DateTime.Now.ToShortDateString();
                TxtTo.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void DdlProjectsById_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = GvTimecards.Rows[GvTimecards.EditIndex];
            DropDownList ddlProjectsById = (DropDownList)gvrow.FindControl("DdlProjectsById");
            DropDownList ddlProjectsByName = (DropDownList) gvrow.FindControl("DdlProjectsByName");

            ddlProjectsByName.SelectedValue = ddlProjectsById.SelectedValue;
        }
        protected void DdlEmptyProjectsById_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = (GridViewRow)GvTimecards.Controls[0].Controls[0];
            DropDownList ddlProjectsById = (DropDownList)gvrow.FindControl("DdlProjectsById");
            DropDownList ddlProjectsByName = (DropDownList) gvrow.FindControl("DdlProjectsByName");

            ddlProjectsByName.SelectedValue = ddlProjectsById.SelectedValue;
        }
        protected void FooterProjectsById_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow footerRow = GvTimecards.FooterRow;
            DropDownList footerProjectsById = (DropDownList) footerRow.FindControl("DdlProjectsById");
            DropDownList footerProjectsByName = (DropDownList) footerRow.FindControl("DdlProjectsByName");

            footerProjectsByName.SelectedValue = footerProjectsById.SelectedValue;
        }

        protected void DdlProjectsByName_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = GvTimecards.Rows[GvTimecards.EditIndex];
            DropDownList ddlProjectsById = (DropDownList)gvrow.FindControl("DdlProjectsById");
            DropDownList ddlProjectsByName = (DropDownList)gvrow.FindControl("DdlProjectsByName");

            ddlProjectsById.SelectedValue = ddlProjectsByName.SelectedValue;
        }
        protected void DdlEmptyProjectsByName_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = (GridViewRow)GvTimecards.Controls[0].Controls[0];
            DropDownList ddlProjectsById = (DropDownList)gvrow.FindControl("DdlProjectsById");
            DropDownList ddlProjectsByName = (DropDownList)gvrow.FindControl("DdlProjectsByName");

            ddlProjectsById.SelectedValue = ddlProjectsByName.SelectedValue;
        }
        protected void FooterProjectsByName_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow footerRow = GvTimecards.FooterRow;
            DropDownList footerProjectsById = (DropDownList)footerRow.FindControl("DdlProjectsById");
            DropDownList footerProjectsByName = (DropDownList)footerRow.FindControl("DdlProjectsByName");

            footerProjectsById.SelectedValue = footerProjectsByName.SelectedValue;
        }

        protected void TimecardPagerDDL_SelectedIndexChanged(Object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvTimecards.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            GvTimecards.PageIndex = pageList.SelectedIndex;
        }

        protected void GvTimecards_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvTimecards.BottomPagerRow;
            if (pagerRow == null)
            {
                return;
            }
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("ddlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("lblPages");
            LinkButton lbFirst = (LinkButton)pagerRow.Cells[0].FindControl("lbFirst");
            LinkButton lbPrev = (LinkButton)pagerRow.Cells[0].FindControl("lbPrev");
            LinkButton lbNext = (LinkButton)pagerRow.Cells[0].FindControl("lbNext");
            LinkButton lbLast = (LinkButton)pagerRow.Cells[0].FindControl("lbLast");

            if (pagelist != null)
            {
                for (int i = 0; i < GvTimecards.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if (i == GvTimecards.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = GvTimecards.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage.ToString() + " of " + GvTimecards.PageCount.ToString();
            }

            if (GvTimecards.PageIndex == 0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
            }
            else if (GvTimecards.PageIndex == GvTimecards.PageCount - 1)
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

        protected void GvTimecards_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "FooterInsert" && Page.IsValid)
            {
                GridViewRow gvrow = GvTimecards.FooterRow;
                if (gvrow != null)
                {
                    RowInsert(gvrow);
                }
            }

            if (e.CommandName == "EmptyInsert" && Page.IsValid)
            {
                GridViewRow gvrow = (GridViewRow) GvTimecards.Controls[0].Controls[0];
                if (gvrow != null)
                {
                    RowInsert(gvrow);
                }
            }
        }

        private void RowInsert(GridViewRow gvRow)
        {
            GridViewRow gvrow = gvRow;
            TextBox txtDate = (TextBox)gvrow.FindControl("TxtDate");
            DropDownList ddlDescription = (DropDownList)gvrow.FindControl("DdlTaskDesc");
            TextBox txtHours = (TextBox)gvrow.FindControl("TxtHours");
            TextBox txtNotes = (TextBox)gvrow.FindControl("TxtNotes");
            DropDownList ddlProjectId = (DropDownList)gvrow.FindControl("DdlProjectsById");
            TextBox txtRelNo = (TextBox)gvrow.FindControl("TxtReleaseNo");
            TextBox txtNumPanels = (TextBox)gvrow.FindControl("TxtNumPanels");
            TextBox txtNumSheets = (TextBox)gvrow.FindControl("TxtNumSheets"); 

            //Data Validation
            if (string.IsNullOrWhiteSpace(ddlEmployee.SelectedValue)) // no employee selected. Control is in MainContent, not in GridView
            {
                ClientScript.RegisterStartupScript(GetType(), "error",
                    "alert('Please select Employee before adding Timecard.');", true);
            }
            else if (string.IsNullOrWhiteSpace(ddlDescription.SelectedValue)) // no task description selected
            {
                ClientScript.RegisterStartupScript(GetType(), "error",
                    "alert('Please select Timecard Description.');", true);
            }
            else if ((ddlDescription.SelectedValue == "2" || ddlDescription.SelectedValue == "8") &&
                        !string.IsNullOrWhiteSpace(ddlProjectId.SelectedValue)) // non-project task and project selected
            {
                ClientScript.RegisterStartupScript(GetType(), "error",
                    "alert('Non-project Description and Project #" + ddlProjectId.SelectedValue + " selected. Please change Description or use <--Select Project-->.');",
                    true);
            } 
            else
            {
                GridViewTimecardSQL.InsertParameters.Clear();
                GridViewTimecardSQL.InsertParameters.Add("EmployeeID", ddlEmployee.SelectedValue);
                GridViewTimecardSQL.InsertParameters.Add("Date", txtDate.Text);
                GridViewTimecardSQL.InsertParameters.Add("TimecardTaskID", ddlDescription.SelectedValue);
                GridViewTimecardSQL.InsertParameters.Add("Hours", txtHours.Text); // null exception here
                GridViewTimecardSQL.InsertParameters.Add("Notes", txtNotes.Text); 
                GridViewTimecardSQL.InsertParameters.Add("ProjectID", ddlProjectId.SelectedValue);
                GridViewTimecardSQL.InsertParameters.Add("ReleaseNo", txtRelNo.Text);
                GridViewTimecardSQL.InsertParameters.Add("NumPanels", txtNumPanels.Text);
                GridViewTimecardSQL.InsertParameters.Add("NumSheets", txtNumSheets.Text);
                GridViewTimecardSQL.Insert();
            }
        }
    }
}