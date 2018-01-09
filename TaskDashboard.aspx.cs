using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ProjectLogic
{
    public partial class TaskDashboard : Page
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
                mnuTaskDashboard.Items[i].Text = i == Convert.ToInt32(e.Item.Value) ? mnuTaskDashboard.Items[i].Text : mnuTaskDashboard.Items[i].Text;
            }
        }

        protected void gvTaskTeam_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = gvTaskTeam.Rows[e.RowIndex];
            DropDownList ddlStatus = (DropDownList)gvrow.FindControl("DdlTaskStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)gvrow.FindControl("txtCompDate")).Text) && (ddlStatus.SelectedItem.Text == "Complete"))
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
            if (e.CommandName == "FooterInsert" && Page.IsValid)
            {
                GridViewRow gvRow = gvTaskTeam.FooterRow;
                    TaskTeamRowInsert(gvRow);
            }
            if (e.CommandName == "EmptyInsert" && Page.IsValid)
            {
                GridViewRow gvRow = (GridViewRow)gvTaskTeam.Controls[0].Controls[0];
                    TaskTeamRowInsert(gvRow);
            }
        }

        private void TaskTeamRowInsert(GridViewRow gvRow)
        {
            if (gvRow == null)
            {
                return;
            }
            DropDownList ddlEmployee = (DropDownList)gvRow.FindControl("DdlEmployee");
            TextBox txtProjectId = (TextBox)gvRow.FindControl("TxtProjectID");
            TextBox txtZoneDesc = (TextBox)gvRow.FindControl("TxtZoneDesc");
            TextBox txtReleaseId = (TextBox)gvRow.FindControl("TxtReleaseID");
            DropDownList ddlTaskCode = (DropDownList)gvRow.FindControl("DdlTaskCode");
            DropDownList ddlStatus = (DropDownList)gvRow.FindControl("DdlStatus");
            DropDownList ddlPriority = (DropDownList)gvRow.FindControl("DdlPriority");
            TextBox txtDueDate = (TextBox)gvRow.FindControl("TxtDueDate");
            TextBox txtNotes = (TextBox)gvRow.FindControl("TxtNotes");
            TextBox txtComplete = (TextBox)gvRow.FindControl("TxtCompDate");
            if (string.IsNullOrWhiteSpace(txtProjectId.Text) || string.IsNullOrWhiteSpace(txtDueDate.Text))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project # and Due Date.');", true);
            }
            else
            {
                gvTaskTeamSQL.InsertParameters.Clear();
                gvTaskTeamSQL.InsertParameters.Add("EmployeeID", ddlEmployee.SelectedValue);
                gvTaskTeamSQL.InsertParameters.Add("ProjectID", txtProjectId.Text);
                gvTaskTeamSQL.InsertParameters.Add("ZoneDesc", txtZoneDesc.Text);
                gvTaskTeamSQL.InsertParameters.Add("ReleaseID", txtReleaseId.Text);
                gvTaskTeamSQL.InsertParameters.Add("TaskCodeID", ddlTaskCode.SelectedValue);
                gvTaskTeamSQL.InsertParameters.Add("TaskStatusID", ddlStatus.SelectedValue);
                gvTaskTeamSQL.InsertParameters.Add("TaskPriorityID", ddlPriority.SelectedValue);
                gvTaskTeamSQL.InsertParameters.Add("DueDate", txtDueDate.Text);
                gvTaskTeamSQL.InsertParameters.Add("Notes", txtNotes.Text);
                gvTaskTeamSQL.InsertParameters.Add("CompDate", txtComplete.Text);
                gvTaskTeamSQL.Insert();
            }
        }
        protected void gvTaskEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvrow = gvTaskEmployee.Rows[e.RowIndex];
            DropDownList list = (DropDownList)gvrow.FindControl("DdlStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)gvrow.FindControl("TxtCompDate")).Text) && list.SelectedItem.Text == "Complete")
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
                GridViewRow gvRow = gvTaskEmployee.FooterRow;
                    TaskEmpRowInsert(gvRow);
            }
            if ((e.CommandName == "EmptyInsert") && Page.IsValid)
            {
                GridViewRow gvRow = (GridViewRow)gvTaskEmployee.Controls[0].Controls[0];
                    TaskEmpRowInsert(gvRow);
            }
        }

        private void TaskEmpRowInsert(GridViewRow gvRow)
        {
            if (gvRow == null)
            {
                return;
            }
            GridViewRow gvrow = gvRow;
            DropDownList ddlEmployee = (DropDownList)MultiView1.Views[0].FindControl("DdlEmployee");
            TextBox txtProjectId = (TextBox)gvrow.FindControl("TxtProjectID");
            TextBox txtZoneDesc = (TextBox)gvrow.FindControl("TxtZoneDesc");
            TextBox txtReleaseId = (TextBox)gvrow.FindControl("TxtReleaseID");
            DropDownList ddlTaskCode = (DropDownList)gvrow.FindControl("DdlTaskCode");
            DropDownList ddlStatus = (DropDownList)gvrow.FindControl("DdlStatus");
            DropDownList ddlPriority = (DropDownList)gvrow.FindControl("DdlPriority");
            TextBox txtDueDate = (TextBox)gvrow.FindControl("TxtDueDate");
            TextBox txtNotes = (TextBox)gvrow.FindControl("TxtNotes");
            TextBox txtCompDate = (TextBox)gvrow.FindControl("TxtCompDate");
            if (string.IsNullOrWhiteSpace(txtProjectId.Text) || string.IsNullOrWhiteSpace(txtDueDate.Text))
            {
                ClientScript.RegisterStartupScript(GetType(), "error", "alert('Enter Project ID and Due Date.');", true);
            }
            else
            {
                gvTaskEmployeeSQL.InsertParameters.Clear();
                gvTaskEmployeeSQL.InsertParameters.Add("EmployeeID", ddlEmployee.SelectedValue);
                gvTaskEmployeeSQL.InsertParameters.Add("ProjectID", txtProjectId.Text);
                gvTaskEmployeeSQL.InsertParameters.Add("ZoneDesc", txtZoneDesc.Text);
                gvTaskEmployeeSQL.InsertParameters.Add("ReleaseID", txtReleaseId.Text);
                gvTaskEmployeeSQL.InsertParameters.Add("TaskCodeID", ddlTaskCode.SelectedValue);
                gvTaskEmployeeSQL.InsertParameters.Add("TaskStatusID", ddlStatus.SelectedValue);
                gvTaskEmployeeSQL.InsertParameters.Add("TaskPriorityID", ddlPriority.SelectedValue);
                gvTaskEmployeeSQL.InsertParameters.Add("DueDate", txtDueDate.Text);
                gvTaskEmployeeSQL.InsertParameters.Add("Notes", txtNotes.Text);
                gvTaskEmployeeSQL.InsertParameters.Add("CompDate", txtCompDate.Text);
                gvTaskEmployeeSQL.Insert();
            }
        }
        protected void gvPMProjects_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string str = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "ProjectID"));
                SqlDataSource source = new SqlDataSource
                {
                    ConnectionString = ConfigurationManager.ConnectionStrings["ProjectLogicTestConnectionString"].ConnectionString,
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