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
            CheckBox chkActiveOnly = ChkActiveOnly;
            DropDownList ddlPmSearch = DdlPmSearch;
            String strSelectCommand =
                "SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, p.Scope_PM_EmployeeID, e.Name, ps.Description AS Status " +
                "FROM tblProject p INNER JOIN tblEmployee e ON p.Scope_PM_EmployeeID = e.EmployeeID " +
                "LEFT JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID " +
                "WHERE((ProjectName LIKE '%' + @ProjectName + '%') OR ProjectID = @ProjectID) ";

            if (!String.IsNullOrEmpty(ddlPmSearch.SelectedValue))
            {
                if (string.IsNullOrEmpty(TxtProjectName.Text))
                {
                    strSelectCommand = strSelectCommand + "OR Scope_PM_EmployeeID = @PM ";
                }
                else strSelectCommand = strSelectCommand + "AND Scope_PM_EmployeeID = @PM ";
            }
            if (chkActiveOnly.Checked)
            {
                strSelectCommand = strSelectCommand + "AND p.ProjectStatusID NOT BETWEEN '4' AND '6' ORDER BY p.ProjectID";
            }
            else
            {
                strSelectCommand = strSelectCommand + "ORDER BY p.ProjectID";
            }

            LvProjectSQL.SelectCommand = strSelectCommand;
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

        //protected void ChkActiveOnly_OnCheckedChanged(object sender, EventArgs e)
        //{
        //    CheckBox chkActiveOnly = (CheckBox) sender;


        //    if (chkActiveOnly.Checked)
        //    {
        //        LvProjectSQL.SelectCommand =
        //            "SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, p.Scope_PM_EmployeeID, e.Name, ps.Description AS Status " +
        //            "FROM tblProject p INNER JOIN tblEmployee e ON p.Scope_PM_EmployeeID = e.EmployeeID " +
        //            "LEFT JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID " +
        //            "WHERE((ProjectName LIKE '%' + @ProjectName + '%') OR(ProjectID = @ProjectID) OR(Scope_PM_EmployeeID = @PM)) " +
        //            "AND p.ProjectStatusID NOT BETWEEN '4' AND '6' "+
        //            "ORDER BY p.ProjectID";
        //    }
        //    else
        //    {
        //        LvProjectSQL.SelectCommand =
        //            "SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, p.Scope_PM_EmployeeID, e.Name, ps.Description AS Status " +
        //            "FROM tblProject p INNER JOIN tblEmployee e ON p.Scope_PM_EmployeeID = e.EmployeeID " +
        //            "LEFT JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID " +
        //            "WHERE(ProjectName LIKE '%' + @ProjectName + '%') OR(ProjectID = @ProjectID) OR(Scope_PM_EmployeeID = @PM) "+
        //            "ORDER BY p.ProjectID";
        //    }
        //}

        protected void BtnSearch_OnClick(object sender, EventArgs e)
        {
            CheckBox chkActiveOnly = ChkActiveOnly;
            DropDownList ddlPmSearch = DdlPmSearch;
            String strSelectCommand =
                "SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, p.Scope_PM_EmployeeID, e.Name, ps.Description AS Status " +
                "FROM tblProject p INNER JOIN tblEmployee e ON p.Scope_PM_EmployeeID = e.EmployeeID " +
                "LEFT JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID " +
                "WHERE((ProjectName LIKE '%' + @ProjectName + '%') OR ProjectID = @ProjectID) ";

            if (!String.IsNullOrEmpty(ddlPmSearch.SelectedValue))
            {
                if (string.IsNullOrEmpty(TxtProjectName.Text))
                {
                    strSelectCommand = strSelectCommand + "OR Scope_PM_EmployeeID = @PM ";
                }
                else strSelectCommand = strSelectCommand + "AND Scope_PM_EmployeeID = @PM ";
            }
            if (chkActiveOnly.Checked)
            {
                strSelectCommand = strSelectCommand + "AND p.ProjectStatusID NOT BETWEEN '4' AND '6' ORDER BY p.ProjectID";
            }
            else
            {
                strSelectCommand = strSelectCommand + "ORDER BY p.ProjectID";
            }

            LvProjectSQL.SelectCommand = strSelectCommand;
        }
    }
}