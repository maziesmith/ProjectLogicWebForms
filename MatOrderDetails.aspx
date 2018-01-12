<%@ Page Title="Material Order Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MatOrderDetails.aspx.cs" Inherits="ProjectLogic.MatOrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:FormView ID="FvHeader" runat="server" DataKeyNames="OrderID" DataSourceID="FvMatOrdersSQL" RenderOuterTable="False" >
    <ItemTemplate>
        <h1>Material Order and Allocation Form</h1>
        <h2><asp:Label ID="LblProjectID" runat="server" Text='<%# Eval("ProjectID") %>'/> - <asp:Label ID="LblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'/>
        </h2>
        <table>
            <tr>
                <td>
                    <b>Order ID:</b>
                </td>
                <td>
                    <asp:Label ID="LblOrderID" runat="server" Text='<%# Eval("OrderID") %>'/>
                </td>
                <td>
                    <b>Ordered By:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DdlOrderedBy" runat="server" Enabled="false" DataSourceID="DdlOrderedBySQL" AppendDataBoundItems="true"
                                      DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("OrderedByEmpID") %>'>
                        <asp:ListItem Text="<--Select Employee-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <b>Reason:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DdlReason" runat="server" Enabled="false" DataSourceID="DdlReasonSQL" AppendDataBoundItems="true"
                                      DataTextField="Description" DataValueField="ReasonID" SelectedValue='<%# Bind("ReasonID") %>'>
                        <asp:ListItem Text="<--Select Reason-->" Value=""/>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Order Date:</b>
                </td>
                <td>
                    <asp:Label ID="LblOrderDate" runat="server" Text='<%# Bind("OrderDate", "{0:d}") %>'/>
                    </td>
                <td>
                    <b>Date Needed:</b>
                </td>
                <td>
                    <asp:Label ID="LblDateNeeded" runat="server" Text='<%# Bind("DateNeeded", "{0:d}") %>'/>
                </td>
            </tr>
        </table>
        <asp:LinkButton ID="LbEdit" runat="server" CausesValidation="false" CssClass="NoPrint" CommandName="Edit" Text="Edit"/>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:Label ID="TxtNotes" runat="server" Visible="false" Text='<%# Bind("Notes") %>'/>
        <h1>Material Order and Allocation Form</h1>
        <h2><asp:Label ID="LblProjectID" runat="server" Text='<%# Eval("ProjectID") %>'/> - <asp:Label ID="LblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'/>
        </h2>
        <table>
            <tr>
                <td>
                    <b>Order ID:</b>
                </td>
                <td>
                    <asp:Label ID="LblOrderID" runat="server" Text='<%# Eval("OrderID") %>'/>
                </td>
                <td>
                    <b>Ordered By:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DdlOrderedBy" runat="server" AutoPostBack="true" DataSourceID="DdlOrderedBySQL" AppendDataBoundItems="true"
                                      DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("OrderedByEmpID") %>'>
                        <asp:ListItem Text="<--Select Employee-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <b>Reason:</b>
                </td>
                <td>
                    <asp:DropDownList ID="DdlReason" runat="server" AutoPostBack="True" DataSourceID="DdlReasonSQL" AppendDataBoundItems="true"
                                      DataTextField="Description" DataValueField="ReasonID" SelectedValue='<%# Bind("ReasonID") %>'>
                        <asp:ListItem Text="<--Select Reason-->" Value=""/>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Order Date:</b>
                </td>
                <td>
                    <asp:TextBox ID="TxtOrderDate" runat="server" CssClass="DateBox" Text='<%# Bind("OrderDate", "{0:d}") %>'/>
                    <asp:CompareValidator id="OrderDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtOrderDate"
                                          ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                </td>
                <td>
                    <b>Date Needed:</b>
                </td>
                <td>
                    <asp:TextBox ID="TxtDateNeeded" runat="server" CssClass="DateBox" Text='<%# Bind("DateNeeded", "{0:d}") %>'/>
                    <asp:CompareValidator id="DateNeededValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDateNeeded"
                                          ErrorMessage="Please enter a valid date.">
                    </asp:CompareValidator>
                </td>
            </tr>
        </table>
        <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"/>
        &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
    </EditItemTemplate>

</asp:FormView>
<br/>
<b>Sheet Goods</b>
<asp:GridView ID="GvSheetGoods" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" DataKeyNames="SheetID"
              DataSourceID="GvSheetGoodsSQL" OnRowCommand="GvSheet_RowCommand" OnRowUpdating="GvSheet_RowUpdating" CssClass="gridview">
<EditRowStyle BackColor="LightYellow"/>
<Columns>
    <asp:TemplateField ShowHeader="False" HeaderStyle-BackColor="Silver" ControlStyle-CssClass="NoPrint">
        <ItemTemplate>
            <asp:LinkButton ID="LbEditSheet" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
            &nbsp;<asp:LinkButton ID="LbDeleteSheet" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete"/>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:LinkButton ID="LbSaveSheet" runat="server" CausesValidation="true" CommandName="Update" Text="Save"/>
            &nbsp;<asp:LinkButton ID="LbCancelSheet" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"/>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:LinkButton ID="LbNewSheet" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Save"/>
        </FooterTemplate>
    </asp:TemplateField>
    <asp:TemplateField Visible="false">
        <ItemTemplate>
            <asp:Label ID="LblSheetID" runat="server" Text='<%# Eval("SheetID") %>'/>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:Label ID="LblSheetID" runat="server" Text='<%# Eval("SheetID") %>'/>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:Label ID="LblSheetID" runat="server" Text='<%# Eval("SheetID") %>'/>
        </FooterTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Mat Name" SortExpression="SheetName" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:TextBox ID="TxtSheetName" runat="server" CssClass="DateBox" Text='<%# Bind("SheetName") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtSheetName" runat="server" CssClass="DateBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblSheetName" runat="server" Text='<%# Bind("SheetName") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Total Needed" SortExpression="TotalNeeded" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:Label ID="LblSheetTotal" runat="server" Text='<%# Eval("TotalNeeded") %>'></asp:Label>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:Label ID="LblSheetTotal" runat="server" Text=""></asp:Label>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblSheetTotal" runat="server" Text='<%# Bind("TotalNeeded") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Vendor" SortExpression="VendorID" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlVendor" runat="server" AutoPostBack="True" DataSourceID="DdlVendorSQL" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("VendorID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlVendor" runat="server" AutoPostBack="True" DataSourceID="DdlVendorSQL" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlVendor" runat="server" DataSourceID="DdlVendorSQL" Enabled="false" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Eval("VendorID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Sheet Size" SortExpression="SheetSize" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:TextBox ID="TxtSheetSize" runat="server" CssClass="DateBox" Text='<%# Bind("SheetSize") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtSheetSize" runat="server" CssClass="DateBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblSheetSize" runat="server" Text='<%# Bind("SheetSize") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Thickness" SortExpression="ThicknessID" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" AutoPostBack="True" DataSourceID="DdlThicknessSQL" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("ThicknessID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" AutoPostBack="True" DataSourceID="DdlThicknessSQL" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlThicknessSQL" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("ThicknessID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Core" SortExpression="CoreID" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" AutoPostBack="True" DataSourceID="DdlCoreSQL" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("CoreID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" AutoPostBack="True" DataSourceID="DdlCoreSQL" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlCoreSQL" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Eval("CoreID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Color" SortExpression="Color" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("Color") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblColor" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Cust Color Code" SortExpression="CustColorCode" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:TextBox ID="TxtCustColorCode" runat="server" CssClass="DateBox" Text='<%# Bind("CustColorCode") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtCustColorCode" runat="server" CssClass="DateBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblCustColorCode" runat="server" Text='<%# Bind("CustColorCode") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Quoted Cost" SortExpression="CostFromEstimate" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
        <EditItemTemplate>
            <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblCost" runat="server" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
<EmptyDataTemplate>
    <table>
        <tr style="background-color: silver">
            <th class="NoPrint"></th>
            <th>Mat Name</th>
            <th>Total Needed</th>
            <th>Vendor</th>
            <th>Sheet Size</th>
            <th>Thickness</th>
            <th>Core</th>
            <th>Color</th>
            <th>Cust Color Code</th>
            <th>Quoted Cost</th>
        </tr>
        <tr>
            <td class="NoPrint">
                <asp:LinkButton ID="LbSheetEmpty" runat="server" CommandName="EmptyInsert" Text="Save"/>
            </td>
            <td>
                <asp:TextBox ID="TxtSheetName" runat="server" CssClass="DateBox" Text='<%# Bind("SheetName") %>'/>
            </td>
            <td></td>
            <td>
                <asp:DropDownList ID="DdlVendor" runat="server" DataSourceID="DdlVendorSQL" AppendDataBoundItems="True"
                                  DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("VendorID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtSheetSize" runat="server" CssClass="DateBox" Text='<%# Bind("SheetSize") %>'/>
            </td>
            <td>
                <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlThicknessSQL" AppendDataBoundItems="True"
                                  DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("ThicknessID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlCoreSQL" AppendDataBoundItems="True"
                                  DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("CoreID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("Color") %>'/>
            </td>
            <td>
                <asp:TextBox ID="TxtCustColorCode" runat="server" CssClass="DateBox" Text='<%# Bind("CustColorCode") %>'/>
            </td>
            <td>
                <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'/>
            </td>
        </tr>
    </table>
</EmptyDataTemplate>
</asp:GridView>
<br/>
<b>Support Materials</b>
<asp:GridView ID="GvSupportMats" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" DataKeyNames="ExtrusionID"
              DataSourceID="GvSupportMatsSQL" OnRowCommand="GvSupport_RowCommand" OnRowUpdating="GvSupport_RowUpdating" CssClass="gridview">
    <EditRowStyle BackColor="LightYellow"/>
    <Columns>
        <asp:TemplateField ShowHeader="False" HeaderStyle-BackColor="Silver" ControlStyle-CssClass="NoPrint">
            <ItemTemplate>
                <asp:LinkButton ID="LbSupportEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
                &nbsp;<asp:LinkButton ID="LbSupportDelete" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete"/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LbSupportSave" runat="server" CausesValidation="true" CommandName="Update" Text="Save"/>
                &nbsp;<asp:LinkButton ID="LbSupportCancel" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:LinkButton ID="LbSupportNew" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Save"/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="LblSupportID" runat="server" Text='<%# Eval("ExtrusionID") %>'/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="LblSupportID" runat="server" Text='<%# Eval("ExtrusionID") %>'/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="LblSupportID" runat="server" Text='<%# Eval("ExtrusionID") %>'/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mat Name" SortExpression="ExtrusionName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtSupportName" runat="server" CssClass="DateBox" Text='<%# Bind("ExtrusionName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtSupportName" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblSupportName" runat="server" Text='<%# Bind("ExtrusionName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Needed" SortExpression="TotalNeeded" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:Label ID="LblSupportTotal" runat="server" Text='<%# Eval("TotalNeeded") %>'></asp:Label>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="LblSupportTotal" runat="server" Text=""></asp:Label>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblSupportTotal" runat="server" Text='<%# Bind("TotalNeeded") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Part&nbsp;#" SortExpression="PartNumID" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:DropDownList ID="DdlPartNum" runat="server" AutoPostBack="True" DataSourceID="DdlPartNumSQL" AppendDataBoundItems="true"
                                  DataTextField="PartNumDesc" DataValueField="PartNumID" SelectedValue='<%# Bind("PartNumID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DdlPartNum" runat="server" AutoPostBack="True" DataSourceID="DdlPartNumSQL" AppendDataBoundItems="true"
                                  DataTextField="PartNumDesc" DataValueField="PartNumID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </FooterTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DdlPartNum" runat="server" DataSourceID="DdlPartNumSQL" AppendDataBoundItems="true"
                                  DataTextField="PartNumDesc" DataValueField="PartNumID" SelectedValue='<%# Eval("PartNumID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Finish" SortExpression="FinishID" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:DropDownList ID="DdlFinish" runat="server" AutoPostBack="True" DataSourceID="DdlFinishSQL" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="FinishID" SelectedValue='<%# Bind("FinishID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DdlFinish" runat="server" AutoPostBack="True" DataSourceID="DdlFinishSQL" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="FinishID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </FooterTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DdlFinish" runat="server" DataSourceID="DdlFinishSQL" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="FinishID" SelectedValue='<%# Eval("FinishID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Color" SortExpression="Color" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("Color") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblColor" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Notes" SortExpression="Notes" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtNotes" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quoted Cost" SortExpression="CostFromEstimate" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblCost" runat="server" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        <table>
            <tr style="background-color: silver">
                <th class="NoPrint"></th>
                <th>Mat Name</th>
                <th>Total Needed</th>
                <th>Part #</th>
                <th>Finish</th>
                <th>Color</th>
                <th>Notes</th>
                <th>Quoted Cost</th>
            </tr>
            <tr>
                <td class="NoPrint">
                    <asp:LinkButton ID="LbSupportEmpty" runat="server" CausesValidation="true" CommandName="EmptyInsert" Text="Save"/>
                </td>
                <td>
                    <asp:TextBox ID="TxtSupportName" runat="server" CssClass="DateBox" Text='<%# Bind("SheetName") %>'/>
                </td>
                <td></td>
                <td>
                    <asp:DropDownList ID="DdlPartNum" runat="server" AutoPostBack="True" DataSourceID="DdlPartNumSQL" AppendDataBoundItems="True"
                                      DataTextField="PartNumDesc" DataValueField="PartNumID" SelectedValue='<%# Bind("PartNumID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DdlFinish" runat="server" AutoPostBack="True" DataSourceID="DdlFinishSQL" AppendDataBoundItems="True"
                                      DataTextField="Description" DataValueField="FinishID" SelectedValue='<%# Bind("FinishID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("Color") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtNotes" runat="server" Text='<%# Bind("Notes") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'/>
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
</asp:GridView>
<br/>
<b>Misc Materials</b>
<asp:GridView ID="GvMiscMats" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" DataKeyNames="MiscID"
              DataSourceID="GvMiscMatsSQL" OnRowCommand="GvMisc_RowCommand" OnRowUpdating="GvMisc_RowUpdating" CssClass="gridview">
    <EditRowStyle BackColor="LightYellow"/>
    <Columns>
        <asp:TemplateField ShowHeader="false" HeaderStyle-BackColor="Silver" ControlStyle-CssClass="NoPrint">
            <ItemTemplate>
                <asp:LinkButton ID="LbEditMisc" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit"/>
                &nbsp;<asp:LinkButton ID="LbDeleteMisc" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete"/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LbSaveMisc" runat="server" CausesValidation="true" CommandName="Update" Text="Save"/>
                &nbsp;<asp:LinkButton ID="LbCancelMisc" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:LinkButton ID="LbNewMisc" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Save"/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="LblMiscID" runat="server" Text='<%# Eval("MiscID") %>'/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="LblMiscID" runat="server" Text='<%# Eval("MiscID") %>'/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="LblMiscID" runat="server" Text='<%# Eval("MiscID") %>'/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mat Name" SortExpression="MiscName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtMiscName" runat="server" CssClass="DateBox" Text='<%# Bind("MiscName") %>' AutoPostBack="True"></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtMiscName" runat="server" CssClass="DateBox" AutoPostBack="True"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblMiscName" runat="server" Text='<%# Bind("MiscName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Needed" SortExpression="TotalNeeded" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:Label ID="LblTotal" runat="server" Text='<%# Eval("TotalNeeded") %>'></asp:Label>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="LblTotal" runat="server" Text=""></asp:Label>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblTotal" runat="server" Text='<%# Bind("TotalNeeded") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Item Desc" SortExpression="ItemDesc" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtDesc" runat="server" Text='<%# Bind("ItemDesc") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtDesc" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblDesc" runat="server" Text='<%# Bind("ItemDesc") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Size" SortExpression="Size" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtSize" runat="server" Text='<%# Bind("Size") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtSize" CssClass="DateBox" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblSize" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Alloy" SortExpression="Alloy" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtAlloy" runat="server" Text='<%# Bind("Alloy") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtAlloy" CssClass="DateBox" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblAlloy" runat="server" Text='<%# Bind("Alloy") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Finish Color" SortExpression="FinishColor" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("FinishColor") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblColor" runat="server" Text='<%# Bind("FinishColor") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quoted Cost" SortExpression="CostFromEstimate" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblCost" runat="server" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        <table>
            <tr style="background-color: silver">
                <th class="NoPrint"></th>
                <th>Mat Name</th>
                <th>Total Needed</th>
                <th>Item Desc</th>
                <th>Size</th>
                <th>Alloy</th>
                <th>Finish Color</th>
                <th>Quoted Cost</th>
            </tr>
            <tr>
                <td class="NoPrint">
                    <asp:LinkButton ID="LbMiscEmpty" runat="server" CausesValidation="true" CommandName="EmptyInsert" Text="Save"/>
                </td>
                <td>
                    <asp:TextBox ID="TxtMiscName" runat="server" CssClass="DateBox" Text='<%# Bind("MiscName") %>'/>
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="TxtDesc" runat="server" Text='<%# Bind("ItemDesc") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtSize" runat="server" CssClass="DateBox" Text='<%# Bind("Size") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtAlloy" runat="server" CssClass="DateBox" Text='<%# Bind("Alloy") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtColor" runat="server" CssClass="DateBox" Text='<%# Bind("FinishColor") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtCost" runat="server" CssClass="DateBox" Text='<%# Bind("CostFromEstimate", "${0:n2}") %>'/>
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
</asp:GridView>
<br/>
<b>Material Allocation</b>
<asp:GridView ID="GvMatAllocation" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" DataKeyNames="MatAllocationID"
              DataSourceID="GvMatAllocationSQL" OnRowCommand="GvMatAlloc_RowCommand" OnRowUpdating="GvMatAlloc_RowUpdating" CssClass="gridview">
    <EditRowStyle BackColor="LightYellow"/>
    <Columns>
        <asp:TemplateField ShowHeader="False" HeaderStyle-BackColor="Silver" ControlStyle-CssClass="NoPrint">
            <ItemTemplate>
                <asp:LinkButton ID="LbEditMatAlloc" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
                &nbsp;<asp:LinkButton ID="LbDeleteMatAlloc" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete"/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LbSaveMatAlloc" runat="server" CausesValidation="true" CommandName="Update" Text="Save"/>
                &nbsp;<asp:LinkButton ID="LbCancelMatAlloc" runat="server" CausesValidation="false" CommandName="Cancel" Text="Cancel"/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:LinkButton ID="LbNewMatAlloc" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Save"/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField Visible="false">
            <ItemTemplate>
                <asp:Label ID="LblMatAllocID" runat="server" Text='<%# Eval("MatAllocationID") %>'/>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="LblMatAllocID" runat="server" Text='<%# Eval("MatAllocationID") %>'/>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:Label ID="LblMatAllocID" runat="server" Text='<%# Eval("MatAllocationID") %>'/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Zone Name" SortExpression="ZoneName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtZoneName" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Release Desc" SortExpression="ReleaseName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtReleaseDesc" runat="server" Text='<%# Bind("ReleaseName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtReleaseDesc" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblReleaseDesc" runat="server" Text='<%# Bind("ReleaseName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="MTO&nbsp;By" SortExpression="MTOByName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtMTOBy" runat="server" CssClass="DateBox" Text='<%# Bind("MTOByName") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtMTOBy" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblMTOBy" runat="server" Text='<%# Bind("MTOByName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mat Name" SortExpression="MatName" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:DropDownList ID="DdlMatName" runat="server" AutoPostBack="True" DataSourceID="DdlMatNameSQL" AppendDataBoundItems="true"
                                  DataTextField="MatName" DataValueField="MatName" SelectedValue='<%# Bind("MatName") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DdlMatName" runat="server" AutoPostBack="True" DataSourceID="DdlMatNameSQL" AppendDataBoundItems="true"
                                  DataTextField="MatName" DataValueField="MatName">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </FooterTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DdlMatName" runat="server" DataSourceID="DdlMatNameSQL" Enabled="false" AppendDataBoundItems="true"
                                  DataTextField="MatName" DataValueField="MatName" SelectedValue='<%# Bind("MatName") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Lin Inch" SortExpression="LinInch" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtLinInch" runat="server" CssClass="DateBox" Text='<%# Bind("LinInch") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtLinInch" runat="server" CssClass="DateBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblLinInch" runat="server" Text='<%# Bind("LinInch") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Mat Qty" SortExpression="MTOMatQty" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtMatQty" runat="server" CssClass="NumBox" Text='<%# Bind("MTOMatQty") %>' AutoPostBack="True"></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtMatQty" runat="server" CssClass="NumBox NoPrint" AutoPostBack="True"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblMatQty" runat="server" Text='<%# Bind("MTOMatQty") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Overage Qty" SortExpression="MTOOverageQty" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtOverageQty" runat="server" CssClass="NumBox" Text='<%# Bind("MTOOverageQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtOverageQty" runat="server" CssClass="NumBox NoPrint"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblOverageQty" runat="server" Text='<%# Bind("MTOOverageQty") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Usage Desc" SortExpression="UsageDesc" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtUsageDesc" runat="server" Text='<%# Bind("UsageDesc") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtUsageDesc" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblUsageDesc" runat="server" Text='<%# Bind("UsageDesc") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Usage Qty" SortExpression="UsageQty" ItemStyle-HorizontalAlign="Right" HeaderStyle-BackColor="Silver">
            <EditItemTemplate>
                <asp:TextBox ID="TxtUsageQty" runat="server" CssClass="NumBox" Text='<%# Bind("UsageQty") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtUsageQty" runat="server" CssClass="NumBox NoPrint"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblUsageQty" runat="server" Text='<%# Bind("UsageQty") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        <table>
            <tr style="background-color: silver">
                <th class="NoPrint"></th>
                <th>Zone Name</th>
                <th>Release Desc</th>
                <th>MTO By</th>
                <th>Mat Name</th>
                <th>Lin Inch</th>
                <th>Mat Qty</th>
                <th>Overage Qty</th>
                <th>Usage Desc</th>
                <th>Usage Qty</th>
            </tr>
            <tr>
                <td class="NoPrint">
                    <asp:LinkButton ID="LbMatAllocEmpty" runat="server" CausesValidation="true" CommandName="EmptyInsert" Text="Save"/>
                </td>
                <td>
                    <asp:TextBox ID="TxtZoneName" runat="server" CssClass="DateBox" Text='<%# Bind("ZoneName") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtReleaseDesc" runat="server" Text='<%# Bind("ReleaseName") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtMTOBy" runat="server" CssClass="DateBox" Text='<%# Bind("MTOByName") %>'/>
                </td>
                <td>
                    <asp:DropDownList ID="DdlMatName" runat="server" AutoPostBack="True" DataSourceID="DdlMatNameSQL" AppendDataBoundItems="True"
                                      DataTextField="MatName" DataValueField="MatName" SelectedValue='<%# Bind("MatName") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtLinInch" runat="server" CssClass="DateBox" Text='<%# Bind("LinInch") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtMatQty" runat="server" CssClass="NumBox" Text='<%# Bind("MTOMatQty") %>'/>
                </td>
                <td>
                    <asp:Textbox ID="TxtOverageQty" runat="server" CssClass="NumBox" Text='<%# Bind("MTOOverageQty") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtUsageDesc" runat="server" Text='<%# Bind("UsageDesc") %>'/>
                </td>
                <td>
                    <asp:TextBox ID="TxtUsageQty" runat="server" CssClass="NumBox" Text='<%# Bind("UsageQty") %>'/>
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>
</asp:GridView>
<asp:FormView ID="FvFooter" runat="server" DataKeyNames="OrderID" DataSourceID="FvMatOrdersSQL"  OnItemCommand="FvFooter_OnItemCommand" RenderOuterTable="False">
    <ItemTemplate>
        <br/>
        <b>Notes</b>
        <br/>
        <asp:Label ID="TxtNotes" runat="server" BorderStyle="Solid" BorderWidth="1" Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
        <br/>
        <asp:LinkButton ID="LbEditNotes" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="Edit" Text="Edit"/>
        <br/>
        <br/>
        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CssClass="NoPrint" CommandName="DeleteOrder" Text="Delete"/>
        &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="True" CssClass="NoPrint" CommandName="NewOrder" Text="New Order"/>
        &nbsp;<asp:Button ID="EmailButton" runat="server" CausesValidation="True" CssClass="NoPrint" CommandName="Email" Text="Email"/>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:Label ID="LblOrderID" runat="server" Visible="false" Text='<%# Eval("OrderID") %>'/>
        <asp:Label ID="LblOrderedBy" runat="server" Visible="false" Text='<%# Bind("OrderedByEmpID") %>'/>
        <asp:Label ID="LblReason" runat="server" Visible="false" Text='<%# Bind("ReasonID") %>'/>
        <asp:Label ID="LblOrderDate" runat="server" Visible="false" Text='<%# Bind("OrderDate", "{0:MM/dd/yyyy}") %>'/>
        <asp:Label ID="LblDateNeeded" runat="server" Visible="false" Text='<%# Bind("DateNeeded", "{0:MM/dd/yyyy}") %>'/>
        <br/>
        <b>Notes</b>
        <br/>
        <asp:TextBox ID="TxtNotes" runat="server" CssClass="TextArea" TextMode="MultiLine" Rows="5" Text='<%# Bind("Notes") %>'/>
        <br/>
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Save"/>
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
    </EditItemTemplate>
</asp:FormView>

<asp:SqlDataSource ID="GvSheetGoodsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT mos.SheetID, mos.OrderID, mos.SheetName, mos.VendorID, mos.ThicknessID, mos.Color, mos.SheetSize, 
                mos.CustColorCode, mos.CostFromEstimate, SUM(ma.MTOMatQty) + SUM(ma.MTOOverageQty) AS TotalNeeded, mos.CoreID 
            FROM tblMatOrderSheet AS mos 
            LEFT OUTER JOIN tblMatAllocation AS ma ON mos.OrderID = ma.OrderID AND mos.SheetName = ma.MatName 
            WHERE mos.OrderID = @OrderID
            GROUP BY mos.SheetID, mos.OrderID, mos.SheetName, mos.VendorID, mos.ThicknessID, mos.Color, mos.SheetSize, mos.CustColorCode, mos.CostFromEstimate, mos.CoreID"
                   DeleteCommand="DELETE FROM tblMatOrderSheet WHERE SheetID = @SheetID"
                   InsertCommand="INSERT INTO tblMatOrderSheet (OrderID, SheetName, VendorID, ThicknessID, Color, SheetSize, CustColorCode, CostFromEstimate, CoreID) 
                        VALUES (@OrderID, @SheetName, @VendorID, @ThicknessID, @Color, @SheetSize, @CustColorCode, @CostFromEstimate, @CoreID)"
                   UpdateCommand="UPDATE tblMatOrderSheet SET SheetName = @SheetName, VendorID = @VendorID, ThicknessID = @ThicknessID,
                            Color = @Color, SheetSize = @SheetSize, CustColorCode = @CustColorCode, CostFromEstimate = @CostFromEstimate, CoreID = CoreID
                        WHERE SheetID = @SheetID">
    <SelectParameters>

        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="SheetID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
        <asp:Parameter Name="SheetName" Type="String"/>
        <asp:Parameter Name="VendorID" Type="Int32"/>
        <asp:Parameter Name="ThicknessID" Type="Int32"/>
        <asp:Parameter Name="Color" Type="String"/>
        <asp:Parameter Name="SheetSize" Type="String"/>
        <asp:Parameter Name="CustColorCode" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
        <asp:Parameter Name="CoreID" Type="Int32"/>
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="SheetName" Type="String"/>
        <asp:Parameter Name="VendorID" Type="Int32"/>
        <asp:Parameter Name="ThicknessID" Type="Int32"/>
        <asp:Parameter Name="Color" Type="String"/>
        <asp:Parameter Name="SheetSize" Type="String"/>
        <asp:Parameter Name="CustColorCode" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
        <asp:Parameter Name="CoreID" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="FvMatOrdersSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT mo.OrderID, mo.ProjectID, p.ProjectName, mo.OrderedByEmpID, emp.Name, mo.OrderDate, mo.DateNeeded, mo.ReasonID, mor.Description, mo.Notes 
            FROM tblMatOrder AS mo 
            LEFT OUTER JOIN tblMatOrderReason AS mor ON mo.ReasonID = mor.ReasonID 
            INNER JOIN tblProject AS p ON mo.ProjectID = p.ProjectID 
            LEFT OUTER JOIN tblEmployee AS emp ON mo.OrderedByEmpID = emp.EmployeeID
            WHERE mo.OrderID = @OrderID"
                   DeleteCommand="DELETE FROM tblMatOrder WHERE OrderID = @OrderID"
                   InsertCommand="INSERT INTO tblMatOrder (OrderDate, ProjectID) VALUES (@OrderDate, @ProjectID); 
                        SELECT @NewOrderID = SCOPE_IDENTITY()"
                   UpdateCommand="UPDATE tblMatOrder SET OrderDate = @OrderDate, OrderedByEmpID = @OrderedByEmpID, 
                        DateNeeded = @DateNeeded, ReasonID = @ReasonID, Notes = @Notes
                        WHERE OrderID = @OrderID"
                    OnInserted="FvMatOrdersSQL_OnInserted">
    <SelectParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderDate" Type="DateTime"/>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Direction ="Output" Name="NewOrderID" Type="Int32" DefaultValue="0"/>
    </InsertParameters>
    <UpdateParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
        <asp:Parameter Name="OrderDate" Type="DateTime"/>
        <asp:Parameter Name="OrderedByEmpID" Type="Int32"/>
        <asp:Parameter Name="DateNeeded" Type="DateTime"/>
        <asp:Parameter Name="ReasonID" Type="Int32"/>
        <asp:Parameter Name="Notes" Type="String"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="GvSupportMatsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT moe.ExtrusionID, moe.OrderID, moe.ExtrusionName, moe.PartNumID, moe.FinishID, moe.Color, moe.Notes, moe.CostFromEstimate, SUM(ma.MTOMatQty) + SUM(ma.MTOOverageQty) AS TotalNeeded
            FROM dbo.tblMatOrderExtrusion AS moe 
            LEFT OUTER JOIN dbo.tblMatAllocation AS ma ON moe.OrderID = ma.OrderID AND moe.ExtrusionName = ma.MatName
            WHERE moe.OrderID = @OrderID
            GROUP BY moe.ExtrusionID, moe.OrderID, moe.ExtrusionName, moe.PartNumID, moe.FinishID, moe.Color, moe.Notes, moe.CostFromEstimate"
                   DeleteCommand="DELETE FROM tblMatOrderExtrusion WHERE ExtrusionID = @ExtrusionID"
                   InsertCommand="INSERT INTO tblMatOrderExtrusion (OrderID, ExtrusionName, PartNumID, FinishID, Color, Notes, CostFromEstimate) 
                        VALUES (@OrderID, @ExtrusionName, @PartNumID, @FinishID, @Color, @Notes, @CostFromEstimate)"
                   UpdateCommand="UPDATE tblMatOrderExtrusion SET ExtrusionName = @ExtrusionName, PartNumID = @PartNumID, FinishID = @FinishID, Color = @Color,
                        Notes = @Notes, CostFromEstimate = @CostFromEstimate WHERE ExtrusionID = @ExtrusionID">
    <SelectParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="ExtrustionID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>

        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
        <asp:Parameter Name="ExtrusionName" Type="String"/>
        <asp:Parameter Name="PartNumID" Type="Int32"/>
        <asp:Parameter Name="FinishID" Type="Int32"/>
        <asp:Parameter Name="Color" Type="String"/>
        <asp:Parameter Name="Notes" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
    </InsertParameters>
    <UpdateParameters>

        <asp:Parameter Name="ExtrusionName" Type="String"/>
        <asp:Parameter Name="PartNumID" Type="Int32"/>
        <asp:Parameter Name="FinishID" Type="Int32"/>
        <asp:Parameter Name="Color" Type="String"/>
        <asp:Parameter Name="Notes" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="GvMiscMatsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT mom.MiscID, mom.OrderID, mom.MiscName, mom.ItemDesc, mom.Size, mom.Alloy, mom.FinishColor, mom.CostFromEstimate, SUM(ma.MTOMatQty) + SUM(ma.MTOOverageQty) AS TotalNeeded
            FROM dbo.tblMatOrderMisc AS mom 
            LEFT OUTER JOIN dbo.tblMatAllocation AS ma ON mom.OrderID = ma.OrderID AND mom.MiscName = ma.MatName
            WHERE mom.OrderID = @OrderID
            GROUP BY mom.MiscID, mom.OrderID, mom.MiscName, mom.ItemDesc, mom.Size, mom.Alloy, mom.FinishColor, mom.CostFromEstimate"
                   DeleteCommand="DELETE FROM tblMatOrderMisc WHERE MiscID = @MiscID"
                   InsertCommand="INSERT INTO tblMatOrderMisc (OrderID, MiscName, ItemDesc, Size, Alloy, FinishColor, CostFromEstimate)
                        VALUES (@OrderID, @MiscName, @ItemDesc, @Size, @Alloy, @FinishColor, @CostFromEstimate)"
                   UpdateCommand="UPDATE tblMatOrderMisc SET MiscName = @MiscName, ItemDesc = @ItemDesc, Size = @Size, Alloy = @Alloy, 
                        FinishColor = @FinishColor, CostFromEstimate = @CostFromEstimate WHERE MiscID = @MiscID">
    <SelectParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="MiscID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
        <asp:Parameter Name="MiscName" Type="String"/>
        <asp:Parameter Name="ItemDesc" Type="String"/>
        <asp:Parameter Name="Size" Type="String"/>
        <asp:Parameter Name="Alloy" Type="String"/>
        <asp:Parameter Name="FinishColor" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="MiscName" Type="String"/>
        <asp:Parameter Name="ItemDesc" Type="String"/>
        <asp:Parameter Name="Size" Type="String"/>
        <asp:Parameter Name="Alloy" Type="String"/>
        <asp:Parameter Name="FinishColor" Type="String"/>
        <asp:Parameter Name="CostFromEstimate" Type="Decimal"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="GvMatAllocationSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT MatAllocationID, OrderID, ZoneName, ReleaseName, MTOByName, MatName, MTOMatQty, MTOOverageQty, DamagedQty, UsageDesc, UsageQty, LinInch
            FROM dbo.tblMatAllocation
            WHERE OrderID = @OrderID
            ORDER BY ZoneName, MatName"
                   DeleteCommand="DELETE FROM tblMatAllocation WHERE MatAllocationID = @MatAllocationID"
                   InsertCommand="INSERT INTO tblMatAllocation (OrderID, ZoneName, ReleaseName, MTOByName, MatName, MTOMatQty, MTOOverageQty, UsageDesc, UsageQty, LinInch)
                        VALUES (@OrderID, @ZoneName, @ReleaseName, @MTOByName, @MatName, @MTOMatQty, @MTOOverageQty, @UsageDesc, @UsageQty, @LinInch)"
                   UpdateCommand="UPDATE tblMatAllocation SET ZoneName = @ZoneName, ReleaseName = @ReleaseName, MTOByName = @MTOByName, MatName = @MatName, MTOMatQty = @MTOMatQty,
                        MTOOverageQty = @MTOOverageQty, UsageDesc = @UsageDesc, UsageQty = @UsageQty, LinInch = @LinInch WHERE MatAllocationID = @MatAllocationID">
    <SelectParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="MatAllocationID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
        <asp:Parameter Name="ZoneName" Type="String"/>
        <asp:Parameter Name="ReleaseName" Type="String"/>
        <asp:Parameter Name="MTOByName" Type="String"/>
        <asp:Parameter Name="MatName" Type="String"/>
        <asp:Parameter Name="MTOMatQty" Type="Int32"/>
        <asp:Parameter Name="MTOOverageQty" Type="Int32"/>
        <asp:Parameter Name="UsageDesc" Type="String"/>
        <asp:Parameter Name="UsageQty" Type="Int32"/>
        <asp:Parameter Name="LinInch" Type="Decimal"/>
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ZoneName" Type="String"/>
        <asp:Parameter Name="ReleaseName" Type="String"/>
        <asp:Parameter Name="MTOByName" Type="String"/>
        <asp:Parameter Name="MatName" Type="String"/>
        <asp:Parameter Name="MTOMatQty" Type="Int32" DefaultValue="0"/>
        <asp:Parameter Name="MTOOverageQty" Type="Int32" DefaultValue="0"/>
        <asp:Parameter Name="UsageDesc" Type="String"/>
        <asp:Parameter Name="UsageQty" Type="Int32" DefaultValue="0"/>
        <asp:Parameter Name="LinInch" Type="Decimal"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlVendorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatManufacturerID], [MatManufacturerDesc] FROM [tblMatManufacturer]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlThicknessSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatThicknessID], [MatThickness] FROM [tblMatThickness]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlCoreSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatCoreID], [MatCore] FROM [tblMatCore]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlPartNumSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [PartNumID], [PartNumDesc] FROM [tblMatOrderPartNum] ORDER BY [PartNumDesc]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlFinishSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [FinishID], [Description] FROM [tblMatOrderFinish]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatNameSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT OrderID, SheetName AS MatName
                FROM dbo.tblMatOrderSheet
                WHERE OrderID=@OrderID
                UNION ALL
                SELECT OrderID, ExtrusionName AS MatName
                FROM dbo.tblMatOrderExtrusion
                WHERE OrderID=@OrderID
                UNION ALL
                SELECT OrderID, MiscName AS MatName
                FROM dbo.tblMatOrderMisc
                WHERE OrderID=@OrderID
                ORDER BY MatName">
    <SelectParameters>
        <asp:RouteParameter Name="OrderID" Type="Int32" RouteKey="OrderID"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlOrderedBySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] WHERE ([Status] = @Status) ORDER BY [Name]">
    <SelectParameters>
        <asp:Parameter DefaultValue="A" Name="Status" Type="String"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlReasonSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" SelectCommand="SELECT [ReasonID], [Description] FROM [tblMatOrderReason]"></asp:SqlDataSource>
</asp:Content>