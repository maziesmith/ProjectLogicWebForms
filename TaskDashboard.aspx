<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskDashboard.aspx.cs" Inherits="ProjectLogic.TaskDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
	    function plusminus(input) {
	        var displayIcon = "img" + input;
	        if ($("#" + displayIcon).attr("src") == "images/plus.png")
            {
                $("#" + displayIcon).closest("tr")
			    .after("<tr><td></td><td colspan = '100%'>" + $("#" + input)
			    .html() + "</td></tr>");
                $("#" + displayIcon).attr("src", "images/minus.png");
            } else
            {
                $("#" + displayIcon).closest("tr").next().remove();
                $("#" + displayIcon).attr("src", "images/plus.png");
		    }
	    }
    </script>
    <br />
    <asp:Menu ID="mnuTaskDashboard" runat="server" Orientation="Horizontal" OnMenuItemClick="mnuTaskDashboard_MenuItemClick" EnableViewState="false">
        <StaticMenuStyle CssClass="MenuStyle" />
        <StaticMenuItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
        <StaticSelectedStyle BackColor="Silver" />
        <Items>
            <asp:MenuItem Text="By&nbspEmployee" Value="0" />
            <asp:MenuItem Text="By&nbspProgram" Value="1" />
            <asp:MenuItem Text="By&nbspPM" Value="2" />
            <asp:MenuItem Text="By&nbspTeam" Value="3" />
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="vueByEmployee" runat="server">
            <div id="wrapper">
                <div id="lside">
                    <br />
                    <asp:BulletedList ID="blEmployee" runat="server">
                        <asp:ListItem>Select Employee from dropdown list to view active and inactive tasks for that employee.</asp:ListItem>
                        <asp:ListItem>To create new task, enter Project #, Release #, Task Code, Status, Priority, and Due Date. Then click Insert.</asp:ListItem>
                        <asp:ListItem>To edit an existing task, click on Edit, make any necessary changes, then click Update.</asp:ListItem>
                        <asp:ListItem>NOTE: When a status is changed to Complete, the task will no longer be visible.</asp:ListItem>
                    </asp:BulletedList>
                    <br />
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Employee:" />
                    </div>
                    <div>
                        <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlEmployeeSQL" DataTextField="Name" DataValueField="EmployeeID">
                        </asp:DropDownList>
                    </div>  
                </div> <!-- end div left -->
                <div id="rside">
                    <asp:Label ID="Label4" runat="server" Text="Task Code Legend"></asp:Label>
                    <div style="height: 100px; width:225px; overflow:auto; border: 1px solid">
                        <asp:DataList ID="DataList1" bordercolor="Black" borderwidth="0px" runat="server" DataKeyField="TaskCodeID" DataSourceID="lstTaskCodeSQL">
                        <ItemTemplate>
                            <tr style="background-color:white;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color:silver;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </AlternatingItemTemplate>
                        </asp:DataList>
                    </div> <!-- end div datalist -->
                </div> <!-- end div right -->
            </div> <!-- end div wrapper -->
            <hr />
            <asp:GridView ID="gvTaskEmployee" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataSourceID="gvTaskEmployeeSQL" 
                OnRowCommand="gvTaskEmp_RowCommand" OnRowUpdating="gvTaskEmp_RowUpdating">
            <Columns>
                <asp:TemplateField  ShowHeader="False" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Insert"></asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TaskID" SortExpression="TaskID" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:Label ID="lblTaskIDEdit" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTaskID" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblNewTaskID" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project&nbsp#" SortExpression="ProjectID" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:Label ID="lblProjectID" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewProjectID" runat="server" Width="75" Text='<%# Bind("ProjectID") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project Name" SortExpression="ProjectName" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:Label ID="lblProjectName" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblNewProjectName" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zone Desc" SortExpression="ZoneDesc" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditZoneDesc" CssClass="NumBox" runat="server" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblZoneDesc" runat="server" Text='<%# Bind("ZoneDesc") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFooterZoneDesc" CssClass="NumBox" runat="server" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Release&nbsp#" SortExpression="ReleaseID" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:Label ID="lblReleaseID" runat="server" Text='<%# Bind("ReleaseID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReleaseID") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewReleaseID" runat="server" Width="50" Text='<%# Bind("ReleaseID") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task Code" SortExpression="TaskCodeAbbr" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:Label ID="lblTaskCode" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNewTaskCode" runat="server" AutoPostBack="True" 
                            DataSourceID="lstTaskCodeSQL" DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="TaskStatusID" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                            DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlViewStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" enabled="false"
                            DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNewStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                            DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Priority" SortExpression="TaskPriorityID" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                            DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlViewPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" enabled="false"
                            DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNewPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                            DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Due Date" SortExpression="DueDate" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDueDate" CssClass="DateBox" runat="server" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator id="DueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDueDate"
                            ErrorMessage="Please enter a valid date.">
                        </asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" CssClass="DateBox" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewDueDate" CssClass="DateBox" runat="server"  Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator id="DueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtNewDueDate"
                            ErrorMessage="Please enter a valid date.">
                        </asp:CompareValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Notes" SortExpression="Notes" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Complete" SortExpression="CompDate" HeaderStyle-BackColor="Silver">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCompDate" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator id="CompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtCompDate"
                            ErrorMessage="Please enter a valid date.">
                        </asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNewCompDate" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        <asp:CompareValidator id="CompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtNewCompDate"
                            ErrorMessage="Please enter a valid date.">
                        </asp:CompareValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <table border="1">
                        <tr style="background-color:silver">
                            <th></th>
                            <th>Task ID</th>
                            <th>Project&nbsp#</th>
                            <th>Project Name</th>
                            <th>Zone Desc</th>
                            <th>Release&nbsp#</th>
                            <th>Task Code</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Due Date</th>
                            <th>Notes</th>
                            <th>Date Complete</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbTaskEmpty" runat="server" CommandName="EmptyInsert" Text="Save" />
                            </td>
                            <td>
                                
                            </td>
                            <td><asp:TextBox ID="txtEmptyProjectID" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ProjectID") %>'></asp:TextBox></td>
                            <td></td>
                            <td><asp:TextBox ID="txtEmptyZoneDesc" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="txtEmptyReleaseID" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ReleaseID") %>'></asp:TextBox></td>
                            <td><asp:DropDownList ID="ddlEmptyTaskCode" runat="server" AutoPostBack="True" DataSourceID="lstTaskCodeSQL" 
                                DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
                                    </asp:DropDownList></td>
                            <td><asp:DropDownList ID="ddlEmptyStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                                        DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                                </asp:DropDownList></td>
                            <td><asp:DropDownList ID="ddlEmptyPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                                        DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                                </asp:DropDownList></td>
                            <td><asp:TextBox ID="txtEmptyDueDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                <asp:CompareValidator id="EmptyDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtEmptyDueDate"
                                    ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                            </td>
                            <td><asp:TextBox ID="txtEmptyNotes" runat="server" AutoPostBack="true" Text='<%# Bind("Notes") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="txtEmptyCompDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                <asp:CompareValidator id="EmptyCompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtEmptyCompDate"
                                    ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
            </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="vueByProgram" runat="server">
            <div id="wrapper">
                <div id="lside">
                    <br />
                    <asp:BulletedList ID="blProgram" runat="server">
                        <asp:ListItem>Select Program from dropdown list to view and create tasks for that Program.</asp:ListItem>
                        <asp:ListItem>To create new task, enter Project #, Release #, Task Code, Status, Priority, and Due Date. Then click Insert.</asp:ListItem>
                        <asp:ListItem>To edit an existing task, click on Edit, make any necessary changes, then click Update.</asp:ListItem>
                        <asp:ListItem>NOTE: When a status is changed to Complete, the task will no longer be visible.</asp:ListItem>
                    </asp:BulletedList>
                    <br />
                    <div>
                        <asp:Label ID="Label8" runat="server" Text="Program:" />
                    </div>
                    <div>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem Text="Adidas" Value="0" />
                            <asp:ListItem text="Architectural" Value="1" />
                            <asp:ListItem Text="BABW" Value="2" />
                            <asp:ListItem Text="Buick/Chevy/GMC" Value="3" />
                            <asp:ListItem Text="Ford" Value="4" />
                            <asp:ListItem Text="KIA" Value="5" />
                            <asp:ListItem Text="Nordstrom Rack" Value="6" />
                            <asp:ListItem Text="Porsche" Value="7" />
                            <asp:ListItem Text="Honda" Value="8" />
                            <asp:ListItem Text="Honda MS" Value="9" />
                            <asp:ListItem Text="Nissan" Value="10" />
                            <asp:ListItem Text="iFly" Value="11" />
                            <asp:ListItem Text="Audi" Value="12" />
                            <asp:ListItem Text="Volvo" Value="13" />
                            <asp:ListItem Text="Land Rover" Value="14" />
                        </asp:DropDownList>
                    </div>  
                </div> <!-- end div left -->
                <div id="rside">
                    <asp:Label ID="Label9" runat="server" Text="Task Code Legend"></asp:Label>
                    <div style="height: 100px; width:225px; overflow:auto; border: 1px solid">
                        <asp:DataList ID="DataList2" bordercolor="Black" borderwidth="0px" runat="server" DataKeyField="TaskCodeID" DataSourceID="lstTaskCodeSQL">
                        <ItemTemplate>
                            <tr style="background-color:white;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color:silver;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </AlternatingItemTemplate>
                        </asp:DataList>
                    </div> <!-- end div datalist -->
                </div> <!-- end div right -->
            </div> <!-- end div wrapper -->
            <hr />
        </asp:View>
        <asp:View ID="vueByPM" runat="server">
            <div id="wrapper">
                <div id="lside">
                    <br />
                    <asp:BulletedList ID="blPM" runat="server">
                        <asp:ListItem>Select PM from dropdown list to view active Projects.</asp:ListItem>
                        <asp:ListItem>Select a project to view active and inactive tasks for that project.</asp:ListItem>
                        <asp:ListItem>To create new task, enter Project #, Release #, Task Code, Status, Priority, and Due Date. Then click Insert.</asp:ListItem>
                        <asp:ListItem>To edit an existing task, click on Edit, make any necessary changes, then click Update.</asp:ListItem>
                        <asp:ListItem>NOTE: When a status is changed to Complete, the task will no longer be visible.</asp:ListItem>
                    </asp:BulletedList>
                    <br />
                    <div>
                        <asp:Label ID="Label12" runat="server" Text="PM:" />
                    </div>
                    <div>
                        <asp:DropDownList ID="ddlPMEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlPMEmployeeSQL" 
                            DataTextField="Name" DataValueField="EmployeeID">
                        </asp:DropDownList>
                    </div>  
                </div> <!-- end div left -->
                <div id="rside">
                    <asp:Label ID="Label13" runat="server" Text="Task Code Legend"></asp:Label>
                    <div style="height: 100px; width:225px; overflow:auto; border: 1px solid">
                        <asp:DataList ID="lstTaskCode" bordercolor="Black" borderwidth="0px" runat="server" DataKeyField="TaskCodeID" DataSourceID="lstTaskCodeSQL">
                        <ItemTemplate>
                            <tr style="background-color:white;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color:silver;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </AlternatingItemTemplate>
                        </asp:DataList>
                    </div> <!-- end div datalist -->
                </div> <!-- end div right -->
            </div> <!-- end div wrapper -->
            <hr />
            <br />
            <asp:GridView ID="gvPMProjects" runat="server" AutoGenerateColumns="False" CssClass="Grid" 
                DataKeyNames="ProjectID" DataSourceID="gvPMProjectSQL" OnRowDataBound="gvPMProjects_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Tasks">
                        <ItemTemplate>
                            <a href="JavaScript:plusminus('div<%# Eval("ProjectID") %>');">
                                <img alt="Tasks" id="imgdiv<%# Eval ("ProjectID") %>" src="images/plus.png" />
                            </a>
                            <div id="div<%# Eval("ProjectID") %>" style="display:none;">
                                <asp:SqlDataSource ID="gvPMProjectTaskSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
                                    SelectCommand="SELECT tt.TaskID, e.Name, tt.ReleaseID, tc.TaskCodeAbbr, ts.TaskStatusName, tp.TaskPriorityName, 
                                        tt.DueDate, tt.Notes, tt.CompDate 
                                    FROM tblTaskTracker AS tt INNER JOIN 
                                    tblTaskCode AS tc ON tt.TaskCodeID = tc.TaskCodeID INNER JOIN 
                                    tblTaskPriority AS tp ON tt.TaskPriorityID = tp.TaskPriorityID INNER JOIN 
                                    tblTaskStatus AS ts ON tt.TaskStatusID = ts.TaskStatusID INNER JOIN 
                                    tblEmployee AS e ON tt.EmployeeID = e.EmployeeID 
                                    WHERE (tt.ProjectID = @ProjectID) AND (ts.TaskStatusType &lt;&gt; 'Z') 
                                    ORDER BY tp.TaskPriorityName, tt.DueDate">
                                    <SelectParameters>
                                        <asp:Parameter Name="ProjectID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gvPMProjectTask" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskID"> 
                                    <Columns>
                                        <asp:BoundField DataField="TaskID" HeaderText="TaskID" InsertVisible="False" ReadOnly="True" SortExpression="TaskID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="ReleaseID" HeaderText="Release #" SortExpression="ReleaseID" />
                                        <asp:BoundField DataField="TaskCodeAbbr" HeaderText="Task Code" SortExpression="TaskCodeAbbr" />
                                        <asp:BoundField DataField="TaskStatusName" HeaderText="Status" SortExpression="TaskStatusName" />
                                        <asp:BoundField DataField="TaskPriorityName" HeaderText="Priority" SortExpression="TaskPriorityName" />
                                        <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                                        <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                        <asp:BoundField DataField="CompDate" HeaderText="Complete Date" SortExpression="CompDate" DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project&nbsp#" SortExpression="ProjectID">
                        <EditItemTemplate>
                            <a href="/ProjectLogic/ProjectDetails.aspx?PID=<%# Eval("ProjectID") %>">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProjectID") %>'></asp:Label>
                            </a>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <a href="/ProjectLogic/ProjectDetails.aspx?PID=<%# Eval("ProjectID") %>">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="ProjectName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProjectName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" SortExpression="ProjectStatusID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="ddlProjectStatusSQL" 
                                DataTextField="Description" DataValueField="ProjectStatusID" SelectedValue='<%# Bind("ProjectStatusID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="ddlProjectStatusSQL" Enabled="false"
                                DataTextField="Description" DataValueField="ProjectStatusID" SelectedValue='<%# Bind("ProjectStatusID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" SortExpression="DateStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DateStatus", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DateStatus", "{0:MM/dd/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    No Projects for selected PM.
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View ID="vueByTeam" runat="server">
            <div id="wrapper">
                <div id="lside">
                    <br />
                    <asp:BulletedList ID="blTeam" runat="server">
                        <asp:ListItem>Select Team from dropdown list to view team members. Click the + sign next to the name to view that person's tasks.</asp:ListItem>
                        <asp:ListItem>To create new task, enter Project #, Release #, Task Code, Status, Priority, and Due Date. Then click Insert.</asp:ListItem>
                        <asp:ListItem>To edit an existing task, click on Edit, make any necessary changes, then click Update.</asp:ListItem>
                        <asp:ListItem>NOTE: When a status is changed to Complete, the task will no longer be visible.</asp:ListItem>
                    </asp:BulletedList>
                    <br />
                    <div>
                        <asp:Label ID="Label14" runat="server" Text="Team:" />
                    </div>
                    <div>
                        <asp:DropDownList ID="ddlTeam" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0" Text="Design/Modeling" />
                            <asp:ListItem Value="1" Text="Programming" />
                            <asp:ListItem Value="2" Text="PM" />
                            <asp:ListItem Value="3" Text="Production" />
                            <asp:ListItem Value="4" Text="Management" />
                            <asp:ListItem Value="5" Text="Scanning" />
                            <asp:ListItem Value="6" Text="Admin" />
                        </asp:DropDownList>
                        
                    </div>  
                </div> <!-- end div left -->
                <div id="rside">
                    <asp:Label ID="Label15" runat="server" Text="Task Code Legend"></asp:Label>
                    <div style="height: 100px; width:225px; overflow:auto; border: 1px solid">
                        <asp:DataList ID="DataList4" bordercolor="Black" borderwidth="0px" runat="server" DataKeyField="TaskCodeID" DataSourceID="lstTaskCodeSQL">
                        <ItemTemplate>
                            <tr style="background-color:white;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr style="background-color:silver;">
                                <td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
                                <td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
                            </tr>
                        </AlternatingItemTemplate>
                        </asp:DataList>
                    </div> <!-- end div datalist -->
                </div> <!-- end div right -->
            </div> <!-- end div wrapper -->
            <hr />
            <asp:GridView ID="gvTaskTeam" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataSourceID="gvTaskTeamSQL"
                OnRowCommand="gvTaskTeam_RowCommand" OnRowUpdating="gvTaskTeam_RowUpdating">
                <Columns>
                    <asp:TemplateField  ShowHeader="False" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Insert"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TaskID" InsertVisible="False" SortExpression="TaskID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee" SortExpression="EmployeeID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditEmployee" runat="server" AutoPostBack="true" DataSourceID="ddlCADModelEmpSQL" 
                                DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFooterEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlCADModelEmpSQL" 
                                DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlViewEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlCADModelEmpSQL" Enabled="false"
                                DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project&nbsp#" SortExpression="ProjectID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditProject" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterProjectID" runat="server" Width="75" Text='<%# Bind("ProjectID") %>'></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblViewProject" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project Name" SortExpression="ProjectName" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:Label ID="lblProjectName" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblViewProjectName" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zone Desc" SortExpression="ZoneDesc" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtZoneDesc" runat="server" CssClass="NumBox" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterZoneDesc" runat="server" CssClass="NumBox" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblZoneDesc" runat="server" CssClass="NumBox" Text='<%# Bind("ZoneDesc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Release&nbsp#" SortExpression="ReleaseID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtReleaseNum" runat="server" CssClass="NumBox" Text='<%# Bind("ReleaseID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterReleaseID" runat="server" CssClass="NumBox" Text='<%# Bind("ReleaseID") %>'></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblReleaseNum" runat="server" CssClass="NumBox" Text='<%# Bind("ReleaseID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Task Code" SortExpression="TaskCodeID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditTaskCodeAbbr" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFooterTaskCode" runat="server" AutoPostBack="True" DataSourceID="lstTaskCodeSQL" 
                                DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblViewTaskCodeAbbr" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" SortExpression="TaskStatusID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                                DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFooterTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                                DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlViewTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" enabled="false"
                                DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Priority" SortExpression="TaskPriorityID" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                                DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFooterPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                                DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlViewPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" enabled="false"
                                DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Due Date" SortExpression="DueDate" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDueDate" runat="server" CssClass="DateBox" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="EditDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                ControlToValidate="txtEditDueDate" ErrorMessage="Please enter a valid date.">
                            </asp:CompareValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterDueDate" runat="server" CssClass="DateBox" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="FooterDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                ControlToValidate="txtFooterDueDate" ErrorMessage="Please enter a valid date.">
                            </asp:CompareValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDueDate" runat="server" CssClass="DateBox" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Notes" SortExpression="Notes" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNotes" runat="server" CssClass="DateBox" Text='<%# Bind("Notes") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterNotes" runat="server" CssClass="DateBox" Text='<%# Bind("Notes") %>'></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNotes" runat="server" CssClass="DateBox" Text='<%# Bind("Notes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Complete Date" SortExpression="CompDate" HeaderStyle-BackColor="Silver">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCompDate" runat="server" CssClass="DateBox" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="EditCompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                ControlToValidate="txtEditCompDate" ErrorMessage="Please enter a valid date.">
                            </asp:CompareValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFooterCompDate" runat="server" CssClass="DateBox" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="FooterCompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                ControlToValidate="txtFooterCompDate" ErrorMessage="Please enter a valid date.">
                            </asp:CompareValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCompDate" runat="server" CssClass="DateBox" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="1">
                        <tr style="background-color:silver">
                            <th></th>
                            <th>Task&nbspID</th>
                            <th>Employee</th>
                            <th>Project&nbsp#</th>
                            <th>Project Name</th>
                            <th>Zone Desc</th>
                            <th>Release&nbsp#</th>
                            <th>Task Code</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Due Date</th>
                            <th>Notes</th>
                            <th>Date Complete</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbTaskEmpty" runat="server" CommandName="EmptyInsert" Text="Save" />
                            </td>
                            <td>
                                
                            </td>
                            <td><asp:DropDownList ID="ddlEmptyEmployee" runat="server" AutoPostBack="true" DataSourceID="ddlCADModelEmpSQL" 
                                    DataTextField="Name" DataValueField="EmployeeID">
                                </asp:DropDownList></td>
                            <td><asp:TextBox ID="txtEmptyProjectID" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ProjectID") %>'></asp:TextBox></td>
                            <td></td>
                            <td><asp:TextBox ID="txtEmptyZoneDesc" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ZoneDesc") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="txtEmptyReleaseID" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ReleaseID") %>'></asp:TextBox></td>
                            <td><asp:DropDownList ID="ddlEmptyTaskCode" runat="server" AutoPostBack="True" DataSourceID="lstTaskCodeSQL" 
                                DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
                                    </asp:DropDownList></td>
                            <td><asp:DropDownList ID="ddlEmptyStatus" runat="server" AutoPostBack="True" DataSourceID="ddlStatusSQL" 
                                        DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
                                </asp:DropDownList></td>
                            <td><asp:DropDownList ID="ddlEmptyPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
                                        DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
                                </asp:DropDownList></td>
                            <td><asp:TextBox ID="txtEmptyDueDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                <asp:CompareValidator id="EmptyDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtEmptyDueDate"
                                    ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                            </td>
                            <td><asp:TextBox ID="txtEmptyNotes" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("Notes") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="txtEmptyCompDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                <asp:CompareValidator id="EmptyCompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtEmptyCompDate"
                                    ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>


    <asp:SqlDataSource ID="ddlEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
            SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] WHERE ([Status] = 'A') ORDER BY [Name]">
        </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="lstTaskCodeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [TaskCodeID], [TaskCodeAbbr], [TaskCodeName] FROM [tblTaskCode] WHERE ([TaskCodeStatus] = @TaskCodeStatus) ORDER BY [TaskCodeAbbr]">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="TaskCodeStatus" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="gvTaskEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
                SelectCommand="SELECT tt.TaskID
                    , tt.EmployeeID
                    , tt.ProjectID
                    , tt.ZoneDesc
	                , tt.ReleaseID
	                , tt.TaskStatusID
	                , tt.TaskPriorityID
	                , tt.DueDate
	                , tt.Notes
	                , tt.CompDate
	                , p.ProjectName
	                , tc.TaskCodeAbbr 
                    FROM tblTaskTracker tt INNER JOIN
                        tblProject p ON tt.ProjectID = p.ProjectID INNER JOIN
                        tblTaskCode tc ON tt.TaskCodeID = tc.TaskCodeID INNER JOIN
                        tblTaskStatus ts on tt.TaskStatusID = ts.TaskStatusID
                    WHERE tt.EmployeeID = @EmployeeID AND ts.TaskStatusType <> 'Z' 
                    ORDER BY ts.TaskStatusType, tt.TaskPriorityID, tt.DueDate"
                InsertCommand="INSERT INTO [tblTaskTracker] 
                    ([EmployeeID], [ProjectID], [ZoneDesc], [ReleaseID], [TaskCodeID], [TaskStatusID], [TaskPriorityID], [DueDate], [Notes], [CompDate])
                    VALUES (@EmployeeID, @ProjectID, @ZoneDesc, @ReleaseID, @TaskCodeID, @TaskStatusID, @TaskPriorityID, @DueDate, @Notes, @CompDate)"
                UpdateCommand="UPDATE [tblTaskTracker] 
                    SET [ZoneDesc] = @ZoneDesc, [TaskStatusID] = @TaskStatusID, [TaskPriorityID] = @TaskPriorityID, [DueDate] = @DueDate, [Notes] = @Notes, [CompDate] = @CompDate 
                    WHERE [TaskID] = @TaskID"
                DeleteCommand="DELETE FROM [tblTaskTracker] WHERE [TaskID] = @TaskID">
                
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                    <asp:Parameter Name="ZoneDesc" Type="String" />
                    <asp:Parameter Name="ReleaseID" Type="Int32" />
                    <asp:Parameter Name="TaskCodeID" Type="Int32" />
                    <asp:Parameter Name="TaskStatusID" Type="Int32" />
                    <asp:Parameter Name="TaskPriorityID" Type="Int32" />
                    <asp:Parameter Name="DueDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="CompDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TaskID" Type="Int32" />
                    <asp:Parameter Name="ZoneDesc" Type="String" />
                    <asp:Parameter Name="TaskStatusID" Type="Int32" />
                    <asp:Parameter Name="TaskPriorityID" Type="Int32" />
                    <asp:Parameter Name="DueDate" Type="DateTime" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="CompDate" Type="DateTime" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="TaskID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

    <asp:SqlDataSource ID="gvTaskProjectSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT tt.TaskID
            , tt.EmployeeID
            , tt.ProjectID
	        , tt.ReleaseID
	        , tt.TaskStatusID
	        , tt.TaskPriorityID
	        , tt.DueDate
	        , tt.Notes
	        , tt.CompDate
	        , p.ProjectName
	        , tc.TaskCodeAbbr 
            FROM tblTaskTracker tt INNER JOIN
                tblProject p ON tt.ProjectID = p.ProjectID INNER JOIN
                tblTaskCode tc ON tt.TaskCodeID = tc.TaskCodeID INNER JOIN
                tblTaskStatus ts on tt.TaskStatusID = ts.TaskStatusID
            WHERE tt.ProjectID = @ProjectID AND ts.TaskStatusType <> 'Z' 
            ORDER BY ts.TaskStatusType, tt.TaskPriorityID, tt.DueDate"
        InsertCommand="INSERT INTO [tblTaskTracker] 
            ([EmployeeID], [ProjectID], [ReleaseID], [TaskCodeID], [TaskStatusID], [TaskPriorityID], [DueDate], [Notes], [CompDate])
            VALUES (@EmployeeID, @ProjectID, @ReleaseID, @TaskCodeID, @TaskStatusID, @TaskPriorityID, @DueDate, @Notes, @CompDate)"
        UpdateCommand="UPDATE [tblTaskTracker] SET  [TaskStatusID] = @TaskStatusID, [TaskPriorityID] = @TaskPriorityID, 
                        [DueDate] = @DueDate, [Notes] = @Notes, [CompDate] = @CompDate WHERE [TaskID] = @TaskID"
        DeleteCommand="DELETE FROM [tblTaskTracker] WHERE [TaskID] = @TaskID">
                
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjectID" Type="Int32" QueryStringField="PID" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="ReleaseID" Type="Int32" />
            <asp:Parameter Name="TaskCodeID" Type="Int32" />
            <asp:Parameter Name="TaskStatusID" Type="Int32" />
            <asp:Parameter Name="TaskPriorityID" Type="Int32" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="CompDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TaskID" Type="Int32" />
            <asp:Parameter Name="TaskStatusID" Type="Int32" />
            <asp:Parameter Name="TaskPriorityID" Type="Int32" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="CompDate" Type="DateTime" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="TaskID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="ddlStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [TaskStatusID], [TaskStatusName] FROM [tblTaskStatus] ORDER BY [TaskStatusType], [TaskStatusName]">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="ddlPrioritySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [TaskPriorityID], [TaskPriorityName] FROM [tblTaskPriority] ORDER BY [TaskPriorityID]">
    </asp:SqlDataSource>
    
            <asp:SqlDataSource ID="gvPMProjectSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
                SelectCommand="SELECT [ProjectID], [ProjectName], [ProjectStatusID], [DateStatus] 
                FROM [tblProject] 
                WHERE (([Scope_PM_EmployeeID] = @Scope_PM_EmployeeID) AND ([ProjectStatusID] &lt;&gt; '5') AND [ProjectStatusID] &lt;&gt; '6') 
                ORDER BY [ProjectID]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlPMEmployee" Name="Scope_PM_EmployeeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    
            <asp:SqlDataSource ID="ddlProjectStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
                SelectCommand="SELECT [ProjectStatusID], [Description] FROM [tblProjectStatus] ORDER BY [AutoStep]">
            </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="ddlCADModelEmpSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT e.EmployeeID, e.Name
            FROM tblEmployee e INNER JOIN
            tblEmployeeType et ON e.EmployeeTypeID = et.EmployeeTypeID
            WHERE (et.Description = 'CAD' OR et.Description = 'Modeler') AND (e.Status = 'A')
            ORDER BY e.Name">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ddlPMEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT e.EmployeeID, e.Name
            FROM tblEmployee e INNER JOIN
            tblEmployeeType et ON e.EmployeeTypeID = et.EmployeeTypeID
            WHERE (et.Description = 'Project Manager') AND (e.Status = 'A')">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="gvTaskTeamSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT tt.TaskID, 
                tt.EmployeeID, 
                tt.ProjectID, 
                tt.ZoneDesc, 
                tt.ReleaseID, 
                tc.TaskCodeAbbr, 
                tt.TaskStatusID, 
                tt.TaskPriorityID, 
                tt.DueDate, 
                tt.Notes, 
                tt.CompDate,
                et.Description, 
                p.ProjectName 
            FROM tblTaskTracker tt INNER JOIN
                tblTaskCode tc ON tt.TaskCodeID = tc.TaskCodeID INNER JOIN
                tblTaskStatus ts on tt.TaskStatusID = ts.TaskStatusID INNER JOIN
                tblEmployee e ON tt.EmployeeID = e.EmployeeID INNER JOIN
                tblEmployeeType et ON e.EmployeeTypeID = et.EmployeeTypeID INNER JOIN
                tblProject p ON tt.ProjectID = p.ProjectID
            WHERE (et.Description = 'CAD' OR et.Description = 'Modeler') AND (e.Status = 'A') AND (ts.TaskStatusType <> 'Z')
            ORDER BY e.Name, tt.TaskStatusID, tt.TaskPriorityID, tt.DueDate DESC"
        UpdateCommand="UPDATE [tblTaskTracker] 
                SET  [EmployeeID] = @EmployeeID, [ZoneDesc] = @ZoneDesc, [ReleaseID] = @ReleaseID, [TaskStatusID] = @TaskStatusID, 
                    [TaskPriorityID] = @TaskPriorityID, [DueDate] = @DueDate, [Notes] = @Notes, [CompDate] = @CompDate 
                WHERE [TaskID] = @TaskID"
        InsertCommand="INSERT INTO [tblTaskTracker] 
                    ([EmployeeID], [ProjectID], [ZoneDesc], [ReleaseID], [TaskCodeID], [TaskStatusID], [TaskPriorityID], [DueDate], [Notes], [CompDate])
                    VALUES (@EmployeeID, @ProjectID, @ZoneDesc, @ReleaseID, @TaskCodeID, @TaskStatusID, @TaskPriorityID, @DueDate, @Notes, @CompDate)"
        DeleteCommand="DELETE FROM [tblTaskTracker] WHERE [TaskID] = @TaskID">
        <UpdateParameters>
            <asp:Parameter Name="TaskID" Type="Int32" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="ZoneDesc" Type="String" />
            <asp:Parameter Name="ReleaseID" Type="Int32" />
            <asp:Parameter Name="TaskStatusID" Type="Int32" />
            <asp:Parameter Name="TaskPriorityID" Type="Int32" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="CompDate" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="ZoneDesc" Type="String" />
            <asp:Parameter Name="ReleaseID" Type="Int32" />
            <asp:Parameter Name="TaskCodeID" Type="Int32" />
            <asp:Parameter Name="TaskStatusID" Type="Int32" />
            <asp:Parameter Name="TaskPriorityID" Type="Int32" />
            <asp:Parameter Name="DueDate" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="CompDate" Type="DateTime" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="TaskID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
</asp:Content>
