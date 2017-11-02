<%@ Page Title="Shipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShipmentDetails.aspx.cs" Inherits="ProjectLogic.ShipmentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        window.onunload = refreshParent;
        function refreshParent() {
            window.opener.location.reload();
        }
    </script>
    <asp:Menu ID="mnuShipment" runat="server" Orientation="Horizontal" OnMenuItemClick="mnuShipment_MenuItemClick" EnableViewState="false">
        <StaticMenuStyle CssClass="MenuStyle" />
        <StaticMenuItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
        <StaticSelectedStyle BackColor="Silver" />
        <Items>
            <asp:MenuItem Text="General" Value="0" />
            <asp:MenuItem Text="Shipping" Value="1" />
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="General" runat="server">


            <asp:FormView ID="fvGeneral" runat="server" DataKeyNames="ProjectShipmentID" DataSourceID="fvGeneralSQL" OnItemCommand="fvGeneral_ItemCommand">
                <EditItemTemplate>
                    <table border="1">
                        <tr>
                            <td>Project #:</td>
                            <td><asp:TextBox ID="txtProjectID" runat="server" CssClass="DateBox" Text='<%# Eval("ProjectID") %>' /></td>
                        </tr>
                        <tr>
                            <td>Shipment #:</td>
                            <td><asp:TextBox ID="txtShipmentNo" runat="server" CssClass="NumBox" Text='<%# Bind("ShipmentNo") %>' /></td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>Requested:</td>
                            <td><asp:TextBox ID="txtDateRequested" runat="server" Text='<%# Bind("DateRequested", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateRequestedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateRequested"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                        <tr>
                            <td>Assigned:</td>
                            <td><asp:TextBox ID="txtDateAssigned" runat="server" Text='<%# Bind("DateAssigned", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateAssignedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateAssigned"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                    </table>
                    <br  />
                    <b>Ship To:</b>
                    <table border="1">
                        <tr>
                            <td>Name:</td>
                            <td colspan="3"><asp:TextBox ID="txtShipToName" runat="server" CssClass="LongBox" Text='<%# Bind("ShipToName") %>' /></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td colspan="3"><asp:TextBox ID="txtShipToAddress" runat="server" CssClass="LongBox" Text='<%# Bind("ShipToAddress") %>' /></td>
                        </tr>
                        <tr>
                            <td>City, ST Zip</td>
                            <td><asp:TextBox ID="txtShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>' /></td>
                            <td><asp:TextBox ID="txtShipToState" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToState") %>' /></td>
                            <td><asp:TextBox ID="txtShipToZip" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToZip") %>' /></td>
                        </tr>
                    </table>
                    
                    <br />
                    <table border="1">
                        <tr>
                            <td>Date Shipped:</td>
                            <td><asp:TextBox ID="txtDateShipped" runat="server" Text='<%# Bind("DateShipped", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateShippedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateShipped"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                        <tr>
                            <td>Notes:</td>
                            <td><asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>' /></td>
                        </tr>
                        <tr>
                            <td>Freight Paid By:</td>
                            <td>
                                <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("FreightPaidBy") %>'>
                                    <asp:ListItem Text="<--Select-->" Value="" />
                                    <asp:ListItem Text="MDSI" Value="M" />
                                    <asp:ListItem Text="Customer" Value="C" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table border="1">
                        <tr>
                            <td>Project #:</td>
                            <td><asp:TextBox ID="txtProjectID" runat="server" Text='<%# Bind("ProjectID") %>' /></td>
                        </tr>
                        <tr>
                            <td>Shipment #:</td>
                            <td><asp:TextBox ID="txtShipmentNo" runat="server" Text='<%# Bind("ShipmentNo") %>' /></td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td><asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>Requested:</td>
                            <td><asp:TextBox ID="txtDateRequested" runat="server" Text='<%# Bind("DateRequested", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateRequestedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateRequested"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                        <tr>
                            <td>Assigned:</td>
                            <td><asp:TextBox ID="txtDateAssigned" runat="server" Text='<%# Bind("DateAssigned", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateAssignedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateAssigned"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                    </table>
                    <br  />
                    <b>Ship To:</b>
                    <table border="1">
                        <tr>
                            <td>Name:</td>
                            <td colspan="3"><asp:TextBox ID="txtShipToName" runat="server" Text='<%# Bind("ShipToName") %>' /></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td colspan="3"><asp:TextBox ID="txtShipToAddress" runat="server" Text='<%# Bind("ShipToAddress") %>' /></td>
                        </tr>
                        <tr>
                            <td>City, ST Zip</td>
                            <td><asp:TextBox ID="txtShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>' /></td>
                            <td><asp:TextBox ID="txtShipToState" runat="server" Text='<%# Bind("ShipToState") %>' /></td>
                            <td><asp:TextBox ID="txtShipToZip" runat="server" Text='<%# Bind("ShipToZip") %>' /></td>
                        </tr>
                    </table>
                    
                    <br />
                    <table border="1">
                        <tr>
                            <td>Date Shipped:</td>
                            <td><asp:TextBox ID="txtDateShipped" runat="server" Text='<%# Bind("DateShipped", "{0:MM/dd/yyyy}") %>' /></td>
                            <asp:CompareValidator id="DateShippedValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateShipped"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </tr>
                        <tr>
                            <td>Notes:</td>
                            <td><asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>' /></td>
                        </tr>
                        <tr>
                            <td>Freight Paid By:</td>
                            <td>
                                <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("FreightPaidBy") %>'>
                                    <asp:ListItem Text="<--Select-->" Value="" />
                                    <asp:ListItem Text="MDSI" Value="M" />
                                    <asp:ListItem Text="Customer" Value="C" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table border="1">
                        <tr>
                            <td>Project #:</td>
                            <td><asp:Label ID="lblProjectID" runat="server" Text='<%# Bind("ProjectID") %>' /></td>
                        </tr>
                        <tr>
                            <td>Shipment #:</td>
                            <td><asp:Label ID="lblShipmentNo" runat="server" Text='<%# Bind("ShipmentNo") %>' /></td>
                        </tr>
                        <tr>
                            <td>Description:</td>
                            <td><asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' /></td>
                        </tr>
                        <tr>
                            <td>Requested:</td>
                            <td><asp:Label ID="lblDateRequested" runat="server" Text='<%# Bind("DateRequested", "{0:MM/dd/yyyy}") %>' /></td>
                        </tr>
                        <tr>
                            <td>Assigned:</td>
                            <td><asp:Label ID="lblDateAssigned" runat="server" Text='<%# Bind("DateAssigned", "{0:MM/dd/yyyy}") %>' /></td>
                        </tr>
                    </table>
                    <br  />
                    <b>Ship To:</b>
                    <table border="1">
                        <tr>
                            <td>Name:</td>
                            <td colspan="3"><asp:Label ID="lblShipToName" runat="server" Text='<%# Bind("ShipToName") %>' /></td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td colspan="3"><asp:Label ID="lblShipToAddress" runat="server" Text='<%# Bind("ShipToAddress") %>' /></td>
                        </tr>
                        <tr>
                            <td>City, ST Zip</td>
                            <td><asp:Label ID="lblShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>' /></td>,
                            <td><asp:Label ID="lblShipToState" runat="server" Text='<%# Bind("ShipToState") %>' /></td>&nbsp;
                            <td><asp:Label ID="lblShipToZip" runat="server" Text='<%# Bind("ShipToZip") %>' /></td>
                        </tr>
                    </table>
                    
                    <br />
                    <table border="1">
                        <tr>
                            <td>Date Shipped:</td>
                            <td><asp:Label ID="lblDateShipped" runat="server" Text='<%# Bind("DateShipped", "{0:MM/dd/yyyy}") %>' /></td>
                        </tr>
                        <tr>
                            <td>Notes:</td>
                            <td><asp:Label ID="lblNotes" runat="server" Text='<%# Bind("Notes") %>' /></td>
                        </tr>
                        <tr>
                            <td>Freight Paid By:</td>
                            <td>
                                <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("FreightPaidBy") %>'>
                                    <asp:ListItem Text="<--Select-->" Value="" />
                                    <asp:ListItem Text="MDSI" Value="M" />
                                    <asp:ListItem Text="Customer" Value="C" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="FakeDelete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="Shipping" runat="server">
            <asp:GridView ID="gvShipment" runat="server" AutoGenerateColumns="False" DataKeyNames="ShippingID" OnRowCommand="gvShipment_RowCommand"
                DataSourceID="gvShipmentSQL" ShowFooter="True" >
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Date" SortExpression="Date">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="DateBox" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="DateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDate"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="DateBox" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
                            <asp:CompareValidator id="DateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDate"
                                ErrorMessage="Please enter a valid date."></asp:CompareValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipper" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipperName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipperName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipperName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="ShipToName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipToName" runat="server" Text='<%# Bind("ShipToName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipToName" runat="server" Text='<%# Bind("ShipToName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipToName" runat="server" Text='<%# Bind("ShipToName") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" SortExpression="ShipToAddress">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipToAddress" runat="server" Text='<%# Bind("ShipToAddress") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipToAddress" runat="server" Text='<%# Bind("ShipToAddress") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipToAddress" runat="server" Text='<%# Bind("ShipToAddress") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City" SortExpression="ShipToCity">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipToCity" runat="server" Text='<%# Bind("ShipToCity") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State" SortExpression="ShipToState">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipToState" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToState") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipToState" runat="server" Text='<%# Bind("ShipToState") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipToState" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToState") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip" SortExpression="ShipToZip">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtShipToZip" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToZip") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblShipToZip" runat="server" Text='<%# Bind("ShipToZip") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtShipToZip" runat="server" CssClass="NumBox" Text='<%# Bind("ShipToZip") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Paid By" SortExpression="PaidBy">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("PaidBy") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                                <asp:ListItem Text="MDSI" Value="M" />
                                <asp:ListItem Text="Customer" Value="C" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("PaidBy") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                                <asp:ListItem Text="MDSI" Value="M" />
                                <asp:ListItem Text="Customer" Value="C" />
                            </asp:DropDownList>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("PaidBy") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                                <asp:ListItem Text="MDSI" Value="M" />
                                <asp:ListItem Text="Customer" Value="C" />
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tracking #" SortExpression="TrackingNo">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTrackingNo" runat="server" Text='<%# Bind("TrackingNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTrackingNo" runat="server" Text='<%# Bind("TrackingNo") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTrackingNo" runat="server" Text='<%# Bind("TrackingNo") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cost" SortExpression="Cost">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCost" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("Cost","${0:f2}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCost" runat="server" Text='<%# Bind("Cost","${0:f2}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtCost" runat="server" CssClass="NumBox AlignRight" Text='<%# Bind("Cost","${0:f2}") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
    <asp:SqlDataSource ID="fvGeneralSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        DeleteCommand="DELETE FROM [tblProjectShipment] WHERE [ProjectShipmentID] = @ProjectShipmentID" 
        InsertCommand="INSERT INTO [tblProjectShipment] ([ProjectID], [ShipmentNo], [Description], [DateRequested], [DateAssigned], 
            [ShipToName], [ShipToAddress], [ShipToCity], [ShipToState], [ShipToZip], [DateShipped], [Notes], [FreightPaidBy]) 
            VALUES (@ProjectID, @ShipmentNo, @Description, @DateRequested, @DateAssigned, @ShipToName, @ShipToAddress, 
            @ShipToCity, @ShipToState, @ShipToZip, @DateShipped, @Notes, @FreightPaidBy)" 
        SelectCommand="SELECT ProjectShipmentID, ProjectID, ShipmentNo, Description, DateRequested, DateAssigned, ShipToName, ShipToAddress, ShipToCity, ShipToState, ShipToZip, DateShipped, Notes, FreightPaidBy FROM tblProjectShipment WHERE (ProjectShipmentID = @PSID)" 
        UpdateCommand="UPDATE [tblProjectShipment] SET [ProjectID] = @ProjectID, [ShipmentNo] = @ShipmentNo, [Description] = @Description, 
            [DateRequested] = @DateRequested, [DateAssigned] = @DateAssigned, [ShipToName] = @ShipToName, [ShipToAddress] = @ShipToAddress, 
            [ShipToCity] = @ShipToCity, [ShipToState] = @ShipToState, [ShipToZip] = @ShipToZip, [DateShipped] = @DateShipped, [Notes] = @Notes, 
            [FreightPaidBy] = @FreightPaidBy WHERE [ProjectShipmentID] = @PSID">
        <DeleteParameters>
            <asp:Parameter Name="ProjectShipmentID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="ShipmentNo" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DateRequested" Type="DateTime" />
            <asp:Parameter Name="DateAssigned" Type="DateTime" />
            <asp:Parameter Name="ShipToName" Type="String" />
            <asp:Parameter Name="ShipToAddress" Type="String" />
            <asp:Parameter Name="ShipToCity" Type="String" />
            <asp:Parameter Name="ShipToState" Type="String" />
            <asp:Parameter Name="ShipToZip" Type="String" />
            <asp:Parameter Name="DateShipped" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="FreightPaidBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="PSID" Type="Int32" QueryStringField="PSID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="ShipmentNo" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="DateRequested" Type="DateTime" />
            <asp:Parameter Name="DateAssigned" Type="DateTime" />
            <asp:Parameter Name="ShipToName" Type="String" />
            <asp:Parameter Name="ShipToAddress" Type="String" />
            <asp:Parameter Name="ShipToCity" Type="String" />
            <asp:Parameter Name="ShipToState" Type="String" />
            <asp:Parameter Name="ShipToZip" Type="String" />
            <asp:Parameter Name="DateShipped" Type="DateTime" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="FreightPaidBy" Type="String" />
            <asp:QueryStringParameter Name="PSID" Type="Int32" QueryStringField="PSID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="gvShipmentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
        SelectCommand="SELECT tsg.ShippingID, tsg.Date, tsg.PaidBy, tsg.TrackingNo, tsg.Cost, tsr.Name, tsg.ShipToName, tsg.ShipToAddress, tsg.ShipToCity, tsg.ShipToState, tsg.ShipToZip, tsg.Notes FROM tblShipping AS tsg LEFT OUTER JOIN tblShipper AS tsr ON tsg.ShipperID = tsr.ShipperID WHERE (tsg.ProjectShipmentID = @PSID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PSID" QueryStringField="PSID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
