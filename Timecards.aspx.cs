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
                txtFrom.Text = DateTime.Now.ToShortDateString();
                txtTo.Text = DateTime.Now.ToShortDateString();
            }
                
        }

        protected void DdlProjectsById_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvrow = GvTimecards.Rows[GvTimecards.EditIndex];
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
    }
}