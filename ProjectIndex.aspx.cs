using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;

namespace ProjectLogic
{
    public partial class ProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvProjects_OnDataBound(object sender, EventArgs e)
        {
            if (GvProjects.BottomPagerRow == null)
            {
                return;
            }
            GridViewRow pagerRow = GvProjects.BottomPagerRow;
            DropDownList pagelist = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            Label pageLabel = (Label)pagerRow.Cells[0].FindControl("LblPages");
            Button lbFirst = (Button)pagerRow.Cells[0].FindControl("LbFirst");
            Button lbPrev = (Button)pagerRow.Cells[0].FindControl("LbPrev");
            Button lbNext = (Button)pagerRow.Cells[0].FindControl("LbNext");
            Button lbLast = (Button)pagerRow.Cells[0].FindControl("LbLast");

            if (pagelist != null)
            {
                for (int i = 0; i < GvProjects.PageCount; i++)
                {
                    int pageNumber = i + 1;
                    ListItem item = new ListItem(pageNumber.ToString());

                    if (i == GvProjects.PageIndex)
                    {
                        item.Selected = true;
                    }

                    pagelist.Items.Add(item);
                }
            }

            if (pageLabel != null)
            {
                int currentPage = GvProjects.PageIndex + 1;

                pageLabel.Text = "Page " + currentPage + " of " + GvProjects.PageCount;
            }
            if (GvProjects.PageIndex == 0)
            {
                lbFirst.Visible = false;
                lbPrev.Visible = false;
                lbNext.Visible = true;
                lbLast.Visible = true;
            }
            else if (GvProjects.PageIndex == GvProjects.PageCount - 1)
            {
                lbFirst.Visible = true;
                lbPrev.Visible = true;
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

        protected void DdlPage_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GvProjects.BottomPagerRow;
            DropDownList pageList = (DropDownList)pagerRow.Cells[0].FindControl("DdlPage");
            GvProjects.PageIndex = pageList.SelectedIndex;
        }
    }
}