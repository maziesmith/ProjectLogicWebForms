using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;
using System.Configuration;

namespace ProjectLogic
{
    public partial class TaskDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mnuTaskDashboard.Items[0].Selected = true;
            }
        }

        protected void mnuTaskDashboard_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = int.Parse(e.Item.Value);
            for (int i = 0; i <= (mnuTaskDashboard.Items.Count - 1); i++)
            {
                if (i == Convert.ToInt32(e.Item.Value))
                {
                    mnuTaskDashboard.Items[i].Text = mnuTaskDashboard.Items[i].Text;
                }
                else
                {
                    mnuTaskDashboard.Items[i].Text = mnuTaskDashboard.Items[i].Text;
                }
            }
        }

        protected void gvTaskTeam_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row1 = gvTaskTeam.Rows[e.RowIndex];
            DropDownList list = (DropDownList)row1.FindControl("ddlEditTaskStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)row1.FindControl("txtCompDate")).Text) && (list.SelectedItem.Text == "Complete"))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Complete Date if Status is Complete.');", true);
                e.Cancel = true;
            }
            else
            {
                gvTaskTeamSQL.Update();
            }
        }

        protected void gvTaskTeam_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = gvTaskTeam.FooterRow;
                if (footerRow == null)
                {
                    return;
                }
                DropDownList list = (DropDownList)footerRow.FindControl("ddlFooterEmployee");
                TextBox box = (TextBox)footerRow.FindControl("txtFooterProjectID");
                TextBox box2 = (TextBox)footerRow.FindControl("txtFooterZoneDesc");
                TextBox box3 = (TextBox)footerRow.FindControl("txtFooterReleaseID");
                DropDownList list2 = (DropDownList)footerRow.FindControl("ddlFooterTaskCode");
                DropDownList list3 = (DropDownList)footerRow.FindControl("ddlFooterTaskStatus");
                DropDownList list4 = (DropDownList)footerRow.FindControl("ddlFooterPriority");
                TextBox box4 = (TextBox)footerRow.FindControl("txtFooterDueDate");
                TextBox box5 = (TextBox)footerRow.FindControl("txtFooterNotes");
                TextBox box6 = (TextBox)footerRow.FindControl("txtFooterCompDate");
                if (string.IsNullOrWhiteSpace(box.Text) || string.IsNullOrWhiteSpace(box4.Text))
                {
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project ID and Due Date.');", true);
                }
                else
                {
                    gvTaskTeamSQL.InsertParameters.Clear();
                    gvTaskTeamSQL.InsertParameters.Add("EmployeeID", list.SelectedValue);
                    gvTaskTeamSQL.InsertParameters.Add("ProjectID", box.Text);
                    gvTaskTeamSQL.InsertParameters.Add("ZoneDesc", box2.Text);
                    gvTaskTeamSQL.InsertParameters.Add("ReleaseID", box3.Text);
                    gvTaskTeamSQL.InsertParameters.Add("TaskCodeID", list2.SelectedValue);
                    gvTaskTeamSQL.InsertParameters.Add("TaskStatusID", list3.SelectedValue);
                    gvTaskTeamSQL.InsertParameters.Add("TaskPriorityID", list4.SelectedValue);
                    gvTaskTeamSQL.InsertParameters.Add("DueDate", box4.Text);
                    gvTaskTeamSQL.InsertParameters.Add("Notes", box5.Text);
                    gvTaskTeamSQL.InsertParameters.Add("CompDate", box6.Text);
                    gvTaskTeamSQL.Insert();
                }
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow row2 = (GridViewRow)gvTaskTeam.Controls[0].Controls[0];
                if (row2 != null)
                {
                    DropDownList list5 = (DropDownList)row2.FindControl("ddlEmployee");
                    TextBox box7 = (TextBox)row2.FindControl("txtProjectID");
                    TextBox box8 = (TextBox)row2.FindControl("txtZoneDesc");
                    TextBox box9 = (TextBox)row2.FindControl("txtReleaseID");
                    DropDownList list6 = (DropDownList)row2.FindControl("ddlTaskCode");
                    DropDownList list7 = (DropDownList)row2.FindControl("ddlStatus");
                    DropDownList list8 = (DropDownList)row2.FindControl("ddlPriority");
                    TextBox box10 = (TextBox)row2.FindControl("txtDueDate");
                    TextBox box11 = (TextBox)row2.FindControl("txtNotes");
                    TextBox box12 = (TextBox)row2.FindControl("txtCompDate");
                    if (string.IsNullOrWhiteSpace(box7.Text) || string.IsNullOrWhiteSpace(box10.Text))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project # and Due Date.');", true);
                    }
                    else
                    {
                        gvTaskTeamSQL.InsertParameters.Clear();
                        gvTaskTeamSQL.InsertParameters.Add("EmployeeID", list5.SelectedValue);
                        gvTaskTeamSQL.InsertParameters.Add("ProjectID", box7.Text);
                        gvTaskTeamSQL.InsertParameters.Add("ZoneDesc", box8.Text);
                        gvTaskTeamSQL.InsertParameters.Add("ReleaseID", box9.Text);
                        gvTaskTeamSQL.InsertParameters.Add("TaskCodeID", list6.SelectedValue);
                        gvTaskTeamSQL.InsertParameters.Add("TaskStatusID", list7.SelectedValue);
                        gvTaskTeamSQL.InsertParameters.Add("TaskPriorityID", list8.SelectedValue);
                        gvTaskTeamSQL.InsertParameters.Add("DueDate", box10.Text);
                        gvTaskTeamSQL.InsertParameters.Add("Notes", box11.Text);
                        gvTaskTeamSQL.InsertParameters.Add("CompDate", box12.Text);
                        gvTaskTeamSQL.Insert();
                    }
                }
            }
        }

        protected void gvTaskEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row1 = gvTaskEmployee.Rows[e.RowIndex];
            DropDownList list = (DropDownList)row1.FindControl("ddlStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)row1.FindControl("txtCompDate")).Text) && (list.SelectedItem.Text == "Complete"))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Complete Date if Status is Complete.');", true);
                e.Cancel = true;
            }
            else
            {
                gvTaskEmployeeSQL.Update();
            }
        }

        protected void gvTaskEmp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if ((e.CommandName == "FooterInsert") && Page.IsValid)
            {
                GridViewRow footerRow = gvTaskEmployee.FooterRow;
                if (footerRow == null)
                {
                    return;
                }
                DropDownList list = (DropDownList)MultiView1.Views[0].FindControl("ddlEmployee");
                TextBox box = (TextBox)footerRow.FindControl("txtProjectID");
                TextBox box2 = (TextBox)footerRow.FindControl("txtFooterZoneDesc");
                TextBox box3 = (TextBox)footerRow.FindControl("txtReleaseID");
                DropDownList list2 = (DropDownList)footerRow.FindControl("ddlTaskCode");
                DropDownList list3 = (DropDownList)footerRow.FindControl("ddlStatus");
                DropDownList list4 = (DropDownList)footerRow.FindControl("ddlPriority");
                TextBox box4 = (TextBox)footerRow.FindControl("txtDueDate");
                TextBox box5 = (TextBox)footerRow.FindControl("txtNotes");
                TextBox box6 = (TextBox)footerRow.FindControl("txtCompDate");
                if (string.IsNullOrWhiteSpace(box.Text) || string.IsNullOrWhiteSpace(box4.Text))
                {
                    ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project ID and Due Date.');", true);
                }
                else
                {
                    gvTaskEmployeeSQL.InsertParameters.Clear();
                    gvTaskEmployeeSQL.InsertParameters.Add("EmployeeID", list.SelectedValue);
                    gvTaskEmployeeSQL.InsertParameters.Add("ProjectID", box.Text);
                    gvTaskEmployeeSQL.InsertParameters.Add("ZoneDesc", box2.Text);
                    gvTaskEmployeeSQL.InsertParameters.Add("ReleaseID", box3.Text);
                    gvTaskEmployeeSQL.InsertParameters.Add("TaskCodeID", list2.SelectedValue);
                    gvTaskEmployeeSQL.InsertParameters.Add("TaskStatusID", list3.SelectedValue);
                    gvTaskEmployeeSQL.InsertParameters.Add("TaskPriorityID", list4.SelectedValue);
                    gvTaskEmployeeSQL.InsertParameters.Add("DueDate", box4.Text);
                    gvTaskEmployeeSQL.InsertParameters.Add("Notes", box5.Text);
                    gvTaskEmployeeSQL.InsertParameters.Add("CompDate", box6.Text);
                    gvTaskEmployeeSQL.Insert();
                }
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow row2 = (GridViewRow)gvTaskEmployee.Controls[0].Controls[0];
                if (row2 != null)
                {
                    DropDownList list5 = (DropDownList)MultiView1.Views[0].FindControl("ddlEmployee");
                    TextBox box7 = (TextBox)row2.FindControl("txtProjectID");
                    TextBox box8 = (TextBox)row2.FindControl("txtZoneDesc");
                    TextBox box9 = (TextBox)row2.FindControl("txtReleaseID");
                    DropDownList list6 = (DropDownList)row2.FindControl("ddlTaskCode");
                    DropDownList list7 = (DropDownList)row2.FindControl("ddlStatus");
                    DropDownList list8 = (DropDownList)row2.FindControl("ddlPriority");
                    TextBox box10 = (TextBox)row2.FindControl("txtDueDate");
                    TextBox box11 = (TextBox)row2.FindControl("txtNotes");
                    TextBox box12 = (TextBox)row2.FindControl("txtCompDate");
                    if (string.IsNullOrWhiteSpace(box7.Text) || string.IsNullOrWhiteSpace(box10.Text))
                    {
                        ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project # and Due Date.');", true);
                    }
                    else
                    {
                        gvTaskEmployeeSQL.InsertParameters.Clear();
                        gvTaskEmployeeSQL.InsertParameters.Add("EmployeeID", list5.SelectedValue);
                        gvTaskEmployeeSQL.InsertParameters.Add("ProjectID", box7.Text);
                        gvTaskEmployeeSQL.InsertParameters.Add("ZoneDesc", box8.Text);
                        gvTaskEmployeeSQL.InsertParameters.Add("ReleaseID", box9.Text);
                        gvTaskEmployeeSQL.InsertParameters.Add("TaskCodeID", list6.SelectedValue);
                        gvTaskEmployeeSQL.InsertParameters.Add("TaskStatusID", list7.SelectedValue);
                        gvTaskEmployeeSQL.InsertParameters.Add("TaskPriorityID", list8.SelectedValue);
                        gvTaskEmployeeSQL.InsertParameters.Add("DueDate", box10.Text);
                        gvTaskEmployeeSQL.InsertParameters.Add("Notes", box11.Text);
                        gvTaskEmployeeSQL.InsertParameters.Add("CompDate", box12.Text);
                        gvTaskEmployeeSQL.Insert();
                    }
                }
            }
        }

        protected void gvPMProjects_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ProjectID"));
                SqlDataSource source = new SqlDataSource
                {
                    ConnectionString = ConfigurationManager.ConnectionStrings["ProjectLogicConnectionString"].ConnectionString,
                    SelectCommand = "SELECT tt.TaskID, e.Name, tt.ReleaseID, tc.TaskCodeAbbr, ts.TaskStatusName, tp.TaskPriorityName, tt.DueDate, tt.Notes, tt.CompDate " +
                    "FROM tblTaskTracker AS tt " +
                    "INNER JOIN tblTaskCode AS tc ON tt.TaskCodeID = tc.TaskCodeID " +
                    "INNER JOIN tblTaskPriority AS tp ON tt.TaskPriorityID = tp.TaskPriorityID " +
                    "INNER JOIN tblTaskStatus AS ts ON tt.TaskStatusID = ts.TaskStatusID " +
                    "INNER JOIN tblEmployee AS e ON tt.EmployeeID = e.EmployeeID " +
                    "WHERE (tt.ProjectID = '" + str + "') AND (ts.TaskStatusType <> 'Z') " +
                    "ORDER BY tp.TaskPriorityName, tt.DueDate"
                };
                GridView view1 = (GridView)e.Row.FindControl("gvPMProjectTask");
                view1.DataSource = source;
                view1.DataBind();
            }
        }


















    }
}