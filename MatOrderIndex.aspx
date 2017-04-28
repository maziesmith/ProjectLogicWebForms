<%@ Page Title="Material Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MatOrderIndex.aspx.cs" Inherits="ProjectLogic.MatOrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table runat="server">
        <tr>
            <td>
                <asp:Label ID="lblProjectNum" runat="server" Text="Project #: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjectID" runat="server"></asp:TextBox>
            </td>
        </tr>
        
    </table>
    <br />
    <asp:Button ID="btnSearch" runat="server" OnCommand="btnSearch_Command" Text="Search" />
    <br />
    <br />
    <asp:ListView ID="lvMatOrders" runat="server" OnItemCommand="lvMatOrders_ItemCommand" DataKeyNames="OrderID" DataSourceID="lvMatOrdersSQL">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <a href="/ProjectLogic/MatOrder/<%# Eval("OrderID") %>">
                    <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("OrderID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="lblProjectID" runat="server" Text='<%# Eval("ProjectID") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' />
                </td>
                <td>
                    <asp:Label ID="lblOrderReason" runat="server" Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate", "{0:MM-dd-yyyy}") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
   
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No Material Orders found for Project # <asp:Label ID="lblProjectID" runat="server" />.</td>
                </tr>
                <tr></tr>
                <tr>
                    <td><asp:LinkButton ID="btnNewBookingForm" runat="server" CommandName="NewInsert" Text="New Material Order" /></td>
                </tr>
            </table>
        </EmptyDataTemplate>
   
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <a href="/ProjectLogic/MatOrder/<%# Eval("OrderID") %>">
                    <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("OrderID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="lblProjectID" runat="server" Text='<%# Eval("ProjectID") %>' />
                </td>
                <td>
                    <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' />
                </td>
                <td>
                    <asp:Label ID="lblOrderReason" runat="server" Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate", "{0:MM-dd-yyyy}") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">OrderID</th>
                                <th runat="server">Project #</th>
                                <th runat="server">Name</th>
                                <th runat="server">Order Reason</th>
                                <th runat="server">Order Date</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="btnNewBookingForm" runat="server" CommandName="NewInsert" Text="New Material Order" />
        </LayoutTemplate>
   

    </asp:ListView>  
    <asp:SqlDataSource ID="lvMatOrdersSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT mo.ProjectID, p.ProjectName, mo.OrderID, mor.Description, mo.OrderDate 
        FROM tblMatOrder AS mo 
        LEFT OUTER JOIN tblProject AS p ON mo.ProjectID = p.ProjectID 
        LEFT OUTER JOIN tblMatOrderReason AS mor ON mo.ReasonID = mor.ReasonID 
        WHERE (mo.ProjectID = @ProjectID)" CancelSelectOnNullParameter="False"
        InsertCommand="INSERT INTO tblMatOrder ( ProjectID, OrderedByEmpID, ReasonID) 
            VALUES ( @ProjectID, @OrderedByEmpID,  @ReasonID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtProjectID" Name="ProjectID" Type="Int32" PropertyName="Text" ConvertEmptyStringToNull="true" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="OrderedByEmpID" Type="Int32" />
            <asp:Parameter Name="DateNeeded" Type="DateTime" />
            <asp:Parameter Name="ReasonID" Type="Int32" />
            <asp:Parameter Name="Notes" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

