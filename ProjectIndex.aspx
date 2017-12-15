<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectIndex.aspx.cs" Inherits="ProjectLogic.ProjectList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
    <table runat="server">
        <tr>
            <td>
                <asp:Label ID="LblProjectNum" runat="server" Text="Project #: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtProjectID" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblProjectName" runat="server" Text="Project Name: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtProjectName" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br/>

    <asp:Button ID="BtnSearch" runat="server" Text="Search"/>
    <br/>
    <br/>
    <asp:GridView ID="GvProjects" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" EmptyDataText="No Project Selected"
                  DataKeyNames="ProjectID" DataSourceID="LvProjectSQL" OnDataBound="GvProjects_OnDataBound" BackColor="White" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="Project&nbsp;#" SortExpression="ProjectID">
                <ItemTemplate>
                    <a href="Project/<%# Eval("ProjectID") %>">
                        <asp:Label ID="LblProjectID" runat="server" Text='<%# Eval("ProjectID") %>'/>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="ProjectName">
                <ItemTemplate>
                    <asp:Label ID="LblProjectName" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="ProjectAddress">
                <ItemTemplate>
                    <asp:Label ID="LblAddress" runat="server" Text='<%# Bind("ProjectAddress") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="ProjectCity">
                <ItemTemplate>
                    <asp:Label ID="LblCity" runat="server" Text='<%# Bind("ProjectCity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ST" SortExpression="ProjectState">
                <ItemTemplate>
                    <asp:Label ID="LblState" runat="server" Text='<%# Bind("ProjectState") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Zip" SortExpression="ProjectZip">
                <ItemTemplate>
                    <asp:Label ID="LblZip" runat="server" Text='<%# Bind("ProjectZip") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <PagerTemplate>
            <div >
                <div class="lside">
                    <asp:Label ID="LblMessage" runat="server" Text="Select a page: "/>
                    <asp:DropDownList ID="DdlPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlPage_OnSelectedIndexChanged"/>
                </div>
                <div class="rside">
                    <asp:Label ID="LblPages" runat="server"/>
                </div>
            </div>
            <div>
                <asp:Button ID="LbFirst" runat="server" Text="&lt;&lt;First" CommandArgument="First" CommandName="Page"/>
                <asp:Button ID="LbPrev" runat="server" Text="&lt;Prev" CommandArgument="Prev" CommandName="Page"/>
                <asp:Button ID="LbNext" runat="server" Text="Next&gt;" CommandArgument="Next" CommandName="Page"/>
                <asp:Button ID="LbLast" runat="server" Text="Last&gt;&gt;" CommandArgument="Last" CommandName="Page"/> 
            </div>
            
        </PagerTemplate>
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:SqlDataSource ID="LvProjectSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                       SelectCommand="SELECT [ProjectID], [ProjectName], [ProjectAddress], [ProjectCity], [ProjectState], [ProjectZip] FROM [tblProject]
            WHERE (ProjectName LIKE '%' + @ProjectName + '%') OR (ProjectID = @ProjectID)" CancelSelectOnNullParameter="false">
        <SelectParameters>
            <asp:ControlParameter Name="ProjectID" ControlID="TxtProjectID" Type="Int32" PropertyName="Text" ConvertEmptyStringToNull="true"/>
            <asp:ControlParameter Name="ProjectName" ControlID="TxtProjectName" Type="String" PropertyName="Text" ConvertEmptyStringToNull="true"/>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>