<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timecards.aspx.cs" Inherits="ProjectLogic.Timecards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="wrapper">
        <div id="lside">
            <asp:Label ID="lblEmployee" runat="server" Text="Select Employee:" />
            <asp:DropDownList ID="ddlAvtiveEmployee" runat="server" AutoPostBack="True" DataSourceID="ddlActiveEmployeeSQL" 
                DataTextField="Name" DataValueField="EmployeeID">
            </asp:DropDownList>
        </div> <!-- end div left -->
        <div id="rside">
            
        </div> <!-- end div right-->
        
    </div>
    <asp:SqlDataSource ID="ddlActiveEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] WHERE ([Status] = @Status) ORDER BY [Name]">
        <SelectParameters>
            <asp:Parameter DefaultValue="A" Name="Status" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
