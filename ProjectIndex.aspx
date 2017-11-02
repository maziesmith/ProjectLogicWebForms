<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectIndex.aspx.cs" Inherits="ProjectLogic.ProjectList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table runat="server">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Project #: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjectID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Project Name: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjectName" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSearch" runat="server" Text="Search" />
    <br />
    <br />
    <asp:ListView ID="lvProjects" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectListSQL">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <a href="/ProjectLogic/Project/<%# Eval("ProjectID") %>">
                    <asp:Label ID="lblProjectID" runat="server" Text='<%# Eval("ProjectID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectAddress" runat="server" Text='<%# Eval("ProjectAddress") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectCity" runat="server" Text='<%# Eval("ProjectCity") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectState" runat="server" Text='<%# Eval("ProjectState") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectZip" runat="server" Text='<%# Eval("ProjectZip") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
      
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <a href="/ProjectLogic/Project/<%# Eval("ProjectID") %>">

                    <asp:Label ID="lblProjectID" runat="server" Text='<%# Eval("ProjectID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectAddress" runat="server" Text='<%# Eval("ProjectAddress") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectCity" runat="server" Text='<%# Eval("ProjectCity") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectState" runat="server" Text='<%# Eval("ProjectState") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectZip" runat="server" Text='<%# Eval("ProjectZip") %>' />
                </td>
            </tr>
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">Project&nbsp#</th>
                                <th runat="server">Name</th>
                                <th runat="server">Address</th>
                                <th runat="server">City</th>
                                <th runat="server">State</th>
                                <th runat="server">Zip</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                            <tr>
                                <td colspan = "6">
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvProjects" PageSize="10">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                ShowNextPageButton="false" />
                                            <asp:NumericPagerField ButtonType="Link" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
      
    </asp:ListView>

    <asp:SqlDataSource ID="ProjectListSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT [ProjectID], [ProjectName], [ProjectAddress], [ProjectCity], [ProjectState], [ProjectZip] FROM [tblProject]
            WHERE (ProjectName LIKE '%' + @ProjectName + '%') OR (ProjectID = @ProjectID)" CancelSelectOnNullParameter="false">
        <SelectParameters>
            <asp:ControlParameter Name="ProjectID" ControlID="txtProjectID" Type="Int32" PropertyName="Text" ConvertEmptyStringToNull="true" />
            <asp:ControlParameter Name="ProjectName" ControlID="txtProjectName" Type="String" PropertyName="Text" ConvertEmptyStringToNull="true" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
