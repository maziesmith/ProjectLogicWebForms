using System;
using System.Collections.Generic;
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
            MultiView1.ActiveViewIndex = int.Parse(e.Item.Value);
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

        protected void gvProjectTask_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row1 = gvProjectTask.Rows[e.RowIndex];
            DropDownList list = (DropDownList)row1.FindControl("ddlEditTaskStatus");
            if (string.IsNullOrWhiteSpace(((TextBox)row1.FindControl("txtEditCompDate")).Text) && (list.SelectedItem.Text == "Complete"))
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
                DropDownList list = (DropDownList)footerRow.FindControl("ddlNewEmployee");
                TextBox box = (TextBox)footerRow.FindControl("txtNewReleaseID");
                DropDownList list2 = (DropDownList)footerRow.FindControl("ddlNewTaskCode");
                DropDownList list3 = (DropDownList)footerRow.FindControl("ddlNewTaskStatus");
                DropDownList list4 = (DropDownList)footerRow.FindControl("ddlNewPriority");
                TextBox box2 = (TextBox)footerRow.FindControl("txtNewDueDate");
                TextBox box3 = (TextBox)footerRow.FindControl("txtNewNotes");
                TextBox box4 = (TextBox)footerRow.FindControl("txtNewCompDate");
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
                    DropDownList list5 = (DropDownList)row2.FindControl("ddlEmptyEmployee");
                    TextBox box5 = (TextBox)row2.FindControl("txtEmptyReleaseID");
                    DropDownList list6 = (DropDownList)row2.FindControl("ddlEmptyTaskCode");
                    DropDownList list7 = (DropDownList)row2.FindControl("ddlEmptyStatus");
                    DropDownList list8 = (DropDownList)row2.FindControl("ddlEmptyPriority");
                    TextBox box6 = (TextBox)row2.FindControl("txtEmptyDueDate");
                    TextBox box7 = (TextBox)row2.FindControl("txtEmptyNotes");
                    TextBox box8 = (TextBox)row2.FindControl("txtEmptyCompDate");
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