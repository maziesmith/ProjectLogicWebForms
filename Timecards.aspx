<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timecards.aspx.cs" Inherits="ProjectLogic.Timecards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
        <div id="wrapper">
            <div id="lside">
                <asp:Label ID="lblEmployee" runat="server" Text="Select Employee:" />
                <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlActiveEmployeeSQL" AppendDataBoundItems="true"
                                    DataTextField="Name" DataValueField="EmployeeID">
                    <asp:ListItem Text="<--Select Employee-->" Value="" />
                </asp:DropDownList>
                <br/>
                <br/>
                <table>
                    <tr>
                        <td>From: </td>
                        <td><asp:TextBox ID="TxtFrom" runat="server" CssClass="DateBox"></asp:TextBox></td>
                        <td>To: </td>
                        <td><asp:TextBox  ID="TxtTo" runat="server" CssClass="DateBox"></asp:TextBox></td>
                    </tr>
                </table>
                <br/>
                <asp:Button runat="server" ID="BtnSearch" Text="Search"/>
            </div> <!-- end div left -->
            <div id="rside">
            </div> <!-- end div right -->
        </div> <!-- end div wrapper -->
    <br/>

    <asp:GridView ID="GvTimecards" runat="server" AllowPaging="True"  ShowFooter="True" AllowSorting="True" OnDataBound="GvTimecards_DataBound" OnRowCommand="GvTimecards_OnRowCommand"
        AutoGenerateColumns="False" DataKeyNames="TimecardID" DataSourceID="GridViewTimecardSQL">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LbSave" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LbNew" runat="server" CausesValidation="True" CommandName="FooterInsert" Text="Add&nbsp;Entry"></asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtDate" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                    <asp:CompareValidator id="EditDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                          ControlToValidate="TxtDate" ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtDate" runat="server" CssClass="DateBox AlignRight" Text='<%# DateTime.Now.ToShortDateString() %>'></asp:TextBox>
                    <asp:CompareValidator id="EditDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                          ControlToValidate="TxtDate" ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtDate" runat="server" CssClass="AlignRight" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:DropDownList ID="DdlTaskDesc" runat="server" DataSourceID="DdlTaskDescSQL" AppendDataBoundItems="True"
                        DataTextField="Description" DataValueField="TimecardTaskID" SelectedValue='<%# Bind("TimeCardTaskID") %>'>
                        <asp:ListItem Text="<--Select Task-->" Value="" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DdlTaskDesc" runat="server" DataSourceID="DdlTaskDescSQL" AppendDataBoundItems="True"
                        DataTextField="Description" DataValueField="TimecardTaskID" SelectedValue='<%# Bind("TimeCardTaskID") %>'>
                        <asp:ListItem Text="<--Select Task-->" Value="" />
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtTaskDesc" runat="server" Text='<%# Bind("Description") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hours" SortExpression="Hours">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtHours" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("Hours") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtHours" runat="server" CssClass="NumBox AlignRight" Text="0.00"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtHours" runat="server" Text='<%# Bind("Hours") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtNotes" runat="server"  Text='<%# Bind("Notes") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtNotes" runat="server"  ></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Project #" SortExpression="ProjectID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DdlProjectsById" runat="server" DataSourceID="DdlProjectsByIdSQL" AppendDataBoundItems="True"
                        DataTextField="ProjectID" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' 
                        OnSelectedIndexChanged="DdlProjectsById_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DdlProjectsById" runat="server" DataSourceID="DdlProjectsByIdSQL" AppendDataBoundItems="True"
                        DataTextField="ProjectID" DataValueField="ProjectID" OnSelectedIndexChanged="FooterProjectsById_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" />
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtProjectID" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Project Name" SortExpression="ProjectName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DdlProjectsByName" runat="server" DataSourceID="DdlProjectsByNameSQL" AppendDataBoundItems="True"
                        DataTextField="ProjectName" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' 
                        OnSelectedIndexChanged="DdlProjectsByName_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DdlProjectsByName" runat="server" DataSourceID="DdlProjectsByNameSQL" AppendDataBoundItems="True"
                        DataTextField="ProjectName" DataValueField="ProjectID" OnSelectedIndexChanged="FooterProjectsByName_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" />
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtProjectName" runat="server" Text='<%# Bind("ProjectName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rel #" SortExpression="ReleaseNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtRelNo" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("ReleaseNo") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtRelNo" runat="server" CssClass="NumBox AlignRight" ></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtRelNo" runat="server" Text='<%# Bind("ReleaseNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="#&nbsp;Panels" SortExpression="NumPanels">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtNumPanels" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("NumPanels") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtNumPanels" runat="server" CssClass="NumBox AlignRight" Text="0"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtNumPanels" runat="server" Text='<%# Bind("NumPanels") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="#&nbsp;Sheets" SortExpression="NumSheets">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtNumSheets" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("NumSheets") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TxtNumSheets" runat="server" CssClass="NumBox AlignRight" Text="0"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="TxtNumSheets" runat="server" Text='<%# Bind("NumSheets") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <table border="1">
                <tr style="background-color:silver">
                    <th class="NoPrint"></th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Hours</th>
                    <th>Notes</th>
                    <th>Project&nbsp;#</th>
                    <th>Project Name</th>
                    <th>Release&nbsp;#</th>
                    <th>#&nbsp;Panels</th>
                    <th>#&nbsp;Sheets</th>
                </tr>
                <tr>
                    <td class="NoPrint"><asp:LinkButton ID="LbTimeCardEmpty" runat="server" CommandName="EmptyInsert" Text="Add&nbsp;Entry" /></td>
                    <td><asp:TextBox ID="TxtDate" runat="server" CssClass="DateBox AlignRight alert-warning" Text='<%# DateTime.Now.ToShortDateString() %>' />
                        <asp:CompareValidator id="EditDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" 
                                              ControlToValidate="TxtDate" ErrorMessage="Please enter a valid date.">
                        </asp:CompareValidator>
                    </td>
                    <td><asp:DropDownList ID="DdlTaskDesc" runat="server" DataSourceID="DdlTaskDescSQL" AppendDataBoundItems="True"
                            DataTextField="Description" DataValueField="TimecardTaskID" SelectedValue='<%# Bind("TimeCardTaskID") %>' AutoPostBack="True">
                        <asp:ListItem Text="<--Select Task-->" Value="" />
                        </asp:DropDownList></td>
                    <td><asp:TextBox ID="TxtHours" runat="server" CssClass="NumBox AlignRight alert-warning"  Text="0.00" /></td>
                    <td><asp:TextBox ID="TxtNotes" runat="server" Text="" /></td>
                    <td><asp:DropDownList ID="DdlProjectsById" runat="server" DataSourceID="DdlProjectsByIdSQL" AppendDataBoundItems="True"
                                          DataTextField="ProjectID" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' 
                                          OnSelectedIndexChanged="DdlEmptyProjectsById_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" />
                    </asp:DropDownList></td>
                    <td><asp:DropDownList ID="DdlProjectsByName" runat="server" DataSourceID="DdlProjectsByNameSQL" AppendDataBoundItems="True"
                                          DataTextField="ProjectName" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' 
                                          OnSelectedIndexChanged="DdlEmptyProjectsByName_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="<--Select Project-->" Value="" /></asp:DropDownList></td>
                    <td><asp:TextBox ID="TxtRelease" runat="server" CssClass="NumBox AlignRight" Text="" /></td>
                    <td><asp:TextBox ID="TxtNumPanels" runat="server" CssClass="NumBox AlignRight" Text="0" /></td>
                    <td><asp:TextBox ID="TxtNumSheets" runat="server" CssClass="NumBox AlignRight" Text="0" /></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <PagerTemplate>
            <div id="wrapper">
                <div id="lside">
                    <asp:Label ID="lblMessage" runat="server" Text="Select a page: " />
                    <asp:DropDownList ID="ddlPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="TimecardPagerDDL_SelectedIndexChanged" />
                </div>
                <div id="rside">
                    <asp:Label ID="lblPages" runat="server" />
                </div>
            </div>
            <asp:LinkButton ID="lbFirst" runat="server" Text="&lt&ltFirst" CommandArgument="First" CommandName="Page" />
            <asp:LinkButton ID="lbPrev" runat="server" Text="&ltPrev" CommandArgument="Prev" CommandName="Page" />
            <asp:LinkButton ID="lbNext" runat="server" Text="Next&gt" CommandArgument="Next" CommandName="Page" />
            <asp:LinkButton ID="lbLast" runat="server" Text="Last&gt&gt" CommandArgument="Last" CommandName="Page" />
        </PagerTemplate>
    </asp:GridView>

    <asp:SqlDataSource ID="ddlActiveEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] WHERE ([Status] = @Status) ORDER BY [Name]">
        <SelectParameters>
            <asp:Parameter DefaultValue="A" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="GridViewTimecardSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
                DeleteCommand="DELETE FROM [tblTimecard] WHERE [TimecardID] = @TimecardID" 
                InsertCommand="INSERT INTO [tblTimecard] ([EmployeeID], [Date], [TimeCardTaskID], [Hours], [Notes], [ProjectID], [ReleaseNo], [NumPanels], [NumSheets]) 
                    VALUES (@EmployeeID, @Date, @TimeCardTaskID, @Hours, @Notes, @ProjectID, @ReleaseNo, @NumPanels, @NumSheets)" 
                SelectCommand="SELECT tc.TimecardID, tc.EmployeeID, e.Name, tc.Date, tc.TimeCardTaskID, tt.Description, tc.Hours, tc.Notes, tc.ProjectID, 
                    p.ProjectName, tc.ReleaseNo, tc.NumPanels, tc.NumSheets 
                    FROM tblTimecard AS tc 
                    INNER JOIN tblEmployee AS e ON tc.EmployeeID = e.EmployeeID 
                    INNER JOIN tblProject AS p ON tc.ProjectID = p.ProjectID 
                    INNER JOIN tblTimecardTask AS tt ON tc.TimeCardTaskID = tt.TimecardTaskID 
                    WHERE (tc.EmployeeID = @EmployeeID) AND (tc.Date &gt;= @FromDate) AND (tc.Date &lt;= @ToDate) 
                    ORDER BY tc.ProjectID, tc.Date" 
                UpdateCommand="UPDATE [tblTimecard] SET  [Date] = @Date, [TimeCardTaskID] = @TimeCardTaskID, [Hours] = @Hours, 
                    [Notes] = @Notes, [ProjectID] = @ProjectID, [ReleaseNo] = @ReleaseNo, [NumPanels] = @NumPanels, [NumSheets] = @NumSheets WHERE [TimecardID] = @TimecardID">
                <DeleteParameters>
                    <asp:Parameter Name="TimecardID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="TimeCardTaskID" Type="Int32" />
                    <asp:Parameter Name="Hours" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                    <asp:Parameter Name="ReleaseNo" Type="Byte" />
                    <asp:Parameter Name="NumPanels" Type="Int32" />
                    <asp:Parameter Name="NumSheets" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="TxtFrom" Name="FromDate" PropertyName="Text" Type="DateTime" DefaultValue="" />
                    <asp:ControlParameter ControlID="TxtTo" Name="ToDate" PropertyName="Text" Type="DateTime" DefaultValue="" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="TimeCardTaskID" Type="Int32" />
                    <asp:Parameter Name="Hours" Type="Decimal" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                    <asp:Parameter Name="ReleaseNo" Type="Byte" />
                    <asp:Parameter Name="NumPanels" Type="Int32" />
                    <asp:Parameter Name="NumSheets" Type="Int32" />
                    <asp:Parameter Name="TimecardID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

    <asp:SqlDataSource ID="DdlTaskDescSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT [TimecardTaskID], [Description] FROM [tblTimecardTask] WHERE ([Description] IS NOT NULL)">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="DdlProjectsByIdSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT [ProjectID], [ProjectName] FROM [tblProject] ORDER BY [ProjectID]">
        
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DdlProjectsByNameSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT [ProjectID], [ProjectName] FROM [tblProject] ORDER BY [ProjectName]">
        
    </asp:SqlDataSource>

</asp:Content>
