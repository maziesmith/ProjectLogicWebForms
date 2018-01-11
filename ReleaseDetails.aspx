<%@ Page Title="Release" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReleaseDetails.aspx.cs" Inherits="ProjectLogic.ReleaseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script>
    window.onunload = refreshParent;

    function refreshParent() {
        window.opener.location.reload();
    }
</script>
<asp:Menu ID="MnuReleases" runat="server" Orientation="Horizontal" OnMenuItemClick="MnuReleases_OnMenuItemClick_MenuItemClick" EnableViewState="false">
    <StaticMenuStyle CssClass="MenuStyle"/>
    <StaticMenuItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalPadding="10px"/>
    <StaticSelectedStyle BackColor="Silver"/>
    <Items>
        <asp:MenuItem Text="General" Value="0"/>
        <asp:MenuItem Text="Support Materials" Value="1"/>
        <asp:MenuItem Text="Work Orders" Value="2"/>
        <asp:MenuItem Text="Columns" Value="3"/>
    </Items>
</asp:Menu>
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
<asp:View runat="server" ID="ViewGeneral">

<asp:FormView ID="FvGeneral" runat="server" DataKeyNames="ProjectReleaseID" DataSourceID="FvGeneralSQL" OnItemCommand="FvGeneral_OnItemCommand" OnDataBound="FvGeneral_OnDataBound">
<EditItemTemplate>
    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"/>
    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
</EditItemTemplate>
<ItemTemplate>
<table>
    <tr>
        <td>Project #: </td>
        <td>
            <asp:Label ID="LblProjectID" runat="server" Text='<%# Bind("ProjectID") %>'/>
        </td>
        <td>Shipment #: </td>
        <td>
            <asp:DropDownList ID="DdlShipment" runat="server" DataSourceID="DdlShipmentSQL" SelectedValue='<%# Bind("ProjectShipmentID") %>'
                              DataValueField="ProjectShipmentID" DataTextField="ShipmentNo" Enabled="False"/>
        </td>
        <td>Release #: </td>
        <td>
            <asp:Label ID="LblReleaseNo" runat="server" Text='<%# Bind("ReleaseNo") %>'/>
        </td>
    </tr>
</table>
<div class="clear">
    <div class="lside">
        <table>
            <tr>
                <td>Description: </td>
                <td>
                    <asp:Label ID="LblDescription" runat="server" Text='<%# Bind("Description") %>'/>
                </td>
            </tr>
            <tr>
                <td>Series: </td>
                <td>
                    <asp:DropDownList runat="server" ID="DdlSeries" DataSourceID="DdlSeriesSQL" SelectedValue='<%# Bind("SeriesID") %>'
                                      DataTextField="Description" DataValueField="SeriesID" Enabled="False"/>
                </td>
            </tr>
            <tr>
                <td>Release Reason: </td>
                <td>
                    <asp:Label ID="LblReleaseReason" runat="server" Text='<%# Bind("ReleaseReason") %>'/>
                </td>
            </tr>
        </table>
    </div>
    <div class="rside">
        <table>
            <tr>
                <td>Panel Qty: </td>
                <td>
                    <asp:Label runat="server" CssClass="AlignRight" ID="LblPanelQty"/>
                </td>
            </tr>
            <tr>
                <td>Sq Ft: </td>
                <td>
                    <asp:Label runat="server" CssClass="AlignRight" ID="LblSqFt"/>
                </td>
            </tr>
            <tr>
                <td>Internal Cost: </td>
                <td>
                    <asp:Label ID="LblInternalCost" runat="server" CssClass="AlignRight" Text='<%# Bind("InternalCost", "{0:c}") %>'/>
                </td>
            </tr>
        </table>
    </div>
    <div class="clear">
        <table>
            <tr>
                <td>DateRelease: </td>
                <td>
                    <asp:Label ID="LblDateRelease" runat="server" Text='<%# Bind("DateRelease", "{0:d}") %>'/>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="clear">
    <div class="lside">
        <table>
            <tr>
                <td>Dims Recd: </td>
                <td>
                    <asp:Label ID="LblDimsRecd" runat="server" Text='<%# Bind("FieldDims_RecdFirst", "{0:d}") %>'/>
                </td>
                <td>Approved: </td>
                <td>
                    <asp:Label ID="LblApproved" runat="server" Text='<%# Bind("FieldDims_Approved", "{0:d}") %>'/>
                </td>
            </tr>
            <tr>
                <td>Dims Resubmitted: </td>
                <td>
                    <asp:Label ID="LblDimsResubmitted" runat="server" Text='<%# Bind("DateFieldDimsRecd", "{0:d}") %>'/>
                </td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <br/>
            </tr>
            <tr>
                <td>Programmed By: </td>
                <td colspan="3">
                    <asp:DropDownList runat="server" ID="DdlProgBy" DataSourceID="DdlProgBySQL" SelectedValue='<%# Bind("ProgrammedBy_EmployeeID") %>'
                                      DataTextField="Name" DataValueField="EmployeeID" Enabled="False"/>
                </td>
            </tr>
            <tr>
                <td>Prog Due: </td>
                <td>
                    <asp:Label ID="LblProgDue" runat="server" Text='<%# Bind("DateProgrammingDue", "{0:d}") %>'/>
                </td>
                <td>Comp'd: </td>
                <td>
                    <asp:Label ID="LblProgComplete" runat="server" Text='<%# Bind("DateProgrammingComplete", "{0:d}") %>'/>
                </td>
            </tr>
            <tr>
                <td>Prog Chk'd By: </td>
                <td>
                    <asp:Label ID="LblProgCheckedBy" runat="server" Text='<%# Bind("ProgramCheckedBy") %>'/>
                </td>
                <td colspan="2"></td>
            </tr>
        </table>
    </div>
    <div class="rside">
        <asp:Label runat="server" ID="LblNotesLbl" Text="Release Notes:" Font-Bold="True"/>
        <br/>
        <asp:Label ID="LblNotes" runat="server" BorderStyle="Solid" BorderWidth="1"
                   Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
    </div>
</div>
<br/>
<br/>
<div class="clear">
    <br/>
    <asp:Label runat="server" ID="LblOpsEst" Text="Operations Estimates:" Font-Bold="True"/>
</div>


<div class="clear">
    <div class="lside">
        <asp:ListView ID="LvOpsEst" runat="server" DataSourceID="LvOpsEstSQL">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="LblOpCodeDesc" runat="server" Text='<%# Eval("OpCode_Description") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="LblTotalEstHours" runat="server" CssClass="AlignRight" Text='<%# Eval("TotalEstHours", "{0:N2}") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="LblTotalActHours" runat="server" CssClass="AlignRight" Text='<%# Eval("TotalActHours", "{0:N2}") %>'/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="LblOpCodeDesc" runat="server" Text='<%# Eval("OpCode_Description") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LblTotalEstHours" runat="server" CssClass="AlignRight" Text='<%# Eval("TotalEstHours", "{0:N2}") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LblTotalActHours" runat="server" CssClass="AlignRight" Text='<%# Eval("TotalActHours", "{0:N2}") %>'></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" style="">
                    <tr runat="server" style="">
                        <th runat="server">Op Code</th>
                        <th runat="server">Est Hours</th>
                        <th runat="server">Act Hours</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>

    </div>
    <div class="rside">
        <table>
            <tr>
                <td>Total Est Hrs</td>
                <td>
                    <asp:Label runat="server" ID="LblTotalEstHours" CssClass="AlignRight" Text=""/>
                </td>
            </tr>
            <tr>
                <td>Total Act Hrs</td>
                <td>
                    <asp:Label runat="server" ID="LblTotalActHours" CssClass="AlignRight" Text=""/>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="clear">
    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="FakeDelete" Text="Delete"/>
    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New"/>
</div>
</ItemTemplate>
</asp:FormView>


</asp:View>
<asp:View runat="server" ID="ViewSupport">

</asp:View>
<asp:View runat="server" ID="ViewWorkOrders">

</asp:View>
<asp:View runat="server" ID="ViewColumns">


</asp:View>
</asp:MultiView>
<asp:SqlDataSource ID="FvGeneralSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [ProjectReleaseID], [ProjectID], [ReleaseNo], [Description], [DateRelease], [DateFieldDimsDue], [DateFieldDimsRecd], 
        [DateProgrammingDue], [DateProgrammingComplete], [DateShipped], [ShippingCompany], [ShippingBOL], [EstProgramming], [EstTable], [EstAssembly], [Notes], 
        [ReleaseReason], [ProgramCheckedBy], [InternalCost], [SeriesID], [ProjectShipmentID], [ProgrammedBy_EmployeeID], [PM_EmployeeID], [FieldDims_RecdFirst], [FieldDims_Approved] 
        FROM [tblProjectRelease] WHERE ([ProjectReleaseID] = @PRID)"
                   DeleteCommand="DELETE FROM [tblProjectRelease] WHERE [ProjectReleaseID] = @PRID"
                   InsertCommand="INSERT INTO [tblProjectRelease] ([ProjectID], [ReleaseNo], [Description], [DateRelease], [DateFieldDimsDue], [DateFieldDimsRecd], 
        [DateProgrammingDue], [DateProgrammingComplete], [DateShipped], [ShippingCompany], [ShippingBOL], [EstProgramming], [EstTable], [EstAssembly], [Notes], 
        [ReleaseReason], [ProgramCheckedBy], [InternalCost], [SeriesID], [ProjectShipmentID], [ProgrammedBy_EmployeeID], [PM_EmployeeID], [FieldDims_RecdFirst], [FieldDims_Approved]) 
        VALUES (@ProjectID, @ReleaseNo, @Description, @DateRelease, @DateFieldDimsDue, @DateFieldDimsRecd, @DateProgrammingDue, @DateProgrammingComplete, @DateShipped, 
        @ShippingCompany, @ShippingBOL, @EstProgramming, @EstTable, @EstAssembly, @Notes, @ReleaseReason, @ProgramCheckedBy, @InternalCost, @SeriesID, @ProjectShipmentID, 
        @ProgrammedBy_EmployeeID, @PM_EmployeeID, @FieldDims_RecdFirst, @FieldDims_Approved)"
                   UpdateCommand="UPDATE [tblProjectRelease] SET [ProjectID] = @ProjectID, [ReleaseNo] = @ReleaseNo, [Description] = @Description, [DateRelease] = @DateRelease, 
        [DateFieldDimsDue] = @DateFieldDimsDue, [DateFieldDimsRecd] = @DateFieldDimsRecd, [DateProgrammingDue] = @DateProgrammingDue, 
        [DateProgrammingComplete] = @DateProgrammingComplete, [DateShipped] = @DateShipped, [ShippingCompany] = @ShippingCompany, [ShippingBOL] = @ShippingBOL, 
        [EstProgramming] = @EstProgramming, [EstTable] = @EstTable, [EstAssembly] = @EstAssembly, [Notes] = @Notes, [ReleaseReason] = @ReleaseReason, 
        [ProgramCheckedBy] = @ProgramCheckedBy, [InternalCost] = @InternalCost, [SeriesID] = @SeriesID, [ProjectShipmentID] = @ProjectShipmentID, 
        [ProgrammedBy_EmployeeID] = @ProgrammedBy_EmployeeID, [PM_EmployeeID] = @PM_EmployeeID, [FieldDims_RecdFirst] = @FieldDims_RecdFirst, 
        [FieldDims_Approved] = @FieldDims_Approved WHERE [ProjectReleaseID] = @PRID">
    <DeleteParameters>
        <asp:QueryStringParameter Name="PRID" QueryStringField="PRID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Name="ReleaseNo" Type="Byte"/>
        <asp:Parameter Name="Description" Type="String"/>
        <asp:Parameter Name="DateRelease" Type="DateTime"/>
        <asp:Parameter Name="DateFieldDimsDue" Type="DateTime"/>
        <asp:Parameter Name="DateFieldDimsRecd" Type="DateTime"/>
        <asp:Parameter Name="DateProgrammingDue" Type="DateTime"/>
        <asp:Parameter Name="DateProgrammingComplete" Type="DateTime"/>
        <asp:Parameter Name="DateShipped" Type="DateTime"/>
        <asp:Parameter Name="ShippingCompany" Type="String"/>
        <asp:Parameter Name="ShippingBOL" Type="String"/>
        <asp:Parameter Name="EstProgramming" Type="Decimal"/>
        <asp:Parameter Name="EstTable" Type="Decimal"/>
        <asp:Parameter Name="EstAssembly" Type="Decimal"/>
        <asp:Parameter Name="Notes" Type="String"/>
        <asp:Parameter Name="ReleaseReason" Type="String"/>
        <asp:Parameter Name="ProgramCheckedBy" Type="String"/>
        <asp:Parameter Name="InternalCost" Type="Decimal"/>
        <asp:Parameter Name="SeriesID" Type="Int32"/>
        <asp:Parameter Name="ProjectShipmentID" Type="Int32"/>
        <asp:Parameter Name="ProgrammedBy_EmployeeID" Type="Int32"/>
        <asp:Parameter Name="PM_EmployeeID" Type="Int32"/>
        <asp:Parameter Name="FieldDims_RecdFirst" Type="DateTime"/>
        <asp:Parameter Name="FieldDims_Approved" Type="DateTime"/>
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="PRID" QueryStringField="PRID" Type="Int32"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Name="ReleaseNo" Type="Byte"/>
        <asp:Parameter Name="Description" Type="String"/>
        <asp:Parameter Name="DateRelease" Type="DateTime"/>
        <asp:Parameter Name="DateFieldDimsDue" Type="DateTime"/>
        <asp:Parameter Name="DateFieldDimsRecd" Type="DateTime"/>
        <asp:Parameter Name="DateProgrammingDue" Type="DateTime"/>
        <asp:Parameter Name="DateProgrammingComplete" Type="DateTime"/>
        <asp:Parameter Name="DateShipped" Type="DateTime"/>
        <asp:Parameter Name="ShippingCompany" Type="String"/>
        <asp:Parameter Name="ShippingBOL" Type="String"/>
        <asp:Parameter Name="EstProgramming" Type="Decimal"/>
        <asp:Parameter Name="EstTable" Type="Decimal"/>
        <asp:Parameter Name="EstAssembly" Type="Decimal"/>
        <asp:Parameter Name="Notes" Type="String"/>
        <asp:Parameter Name="ReleaseReason" Type="String"/>
        <asp:Parameter Name="ProgramCheckedBy" Type="String"/>
        <asp:Parameter Name="InternalCost" Type="Decimal"/>
        <asp:Parameter Name="SeriesID" Type="Int32"/>
        <asp:Parameter Name="ProjectShipmentID" Type="Int32"/>
        <asp:Parameter Name="ProgrammedBy_EmployeeID" Type="Int32"/>
        <asp:Parameter Name="PM_EmployeeID" Type="Int32"/>
        <asp:Parameter Name="FieldDims_RecdFirst" Type="DateTime"/>
        <asp:Parameter Name="FieldDims_Approved" Type="DateTime"/>
        <asp:QueryStringParameter Name="PRID" QueryStringField="PRID" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="LvOpsEstSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [OpCode_Description], [TotalEstHours], [TotalActHours] 
        FROM [vueProjectReleaseOpsSummary] 
        WHERE ([ProjectReleaseID] = @PRID) 
        ORDER BY [ProjectReleaseID], [SeqNo], [OpCode_Description]">
    <SelectParameters>
        <asp:QueryStringParameter Name="PRID" QueryStringField="PRID" Type="Int32"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlSeriesSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [SeriesID], [Description] FROM [tblSeries]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlShipmentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [ProjectShipmentID], [ShipmentNo] FROM [tblProjectShipment] ORDER BY [ShipmentNo]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlProgBySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [EmployeeID], [Name] FROM [vueLkupRelProgBy] ORDER BY [Name]">
</asp:SqlDataSource>
</asp:Content>