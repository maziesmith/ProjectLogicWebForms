<%@ Page Title="Booking Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BFDetails.aspx.cs" Inherits="ProjectLogic.BfDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<asp:FormView ID="FvHeader" runat="server" DataKeyNames="BookingFormID" DataSourceID="FvBookingFormSQL" OnItemCommand="FvBF_ItemCommand" RenderOuterTable="False">
<EditItemTemplate>
    <h1>Production Booking Form</h1><asp:Label ID="LblBFID" runat="server" Text='<%# Eval("BookingFormID") %>' Visible="false"/>
    <h2>
        <asp:Label ID="LblProjectNum" runat="server" Text='<%# Eval("ProjectID") %>'/> - <asp:Label ID="LblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'/>
    </h2>
    <h3>
        Release <asp:Label ID="LblReleaseNum" runat="server" Text='<%# Eval("ReleaseNum") %>'/> - <asp:Label ID="LblReleaseName" runat="server" Text='<%# Eval("ReleaseDesc") %>'/>
    </h3>
    <table>
        <tr>
            <td>
                <b>PM: </b>
            </td>
            <td>
                <asp:Label ID="LblPM" runat="server" Text='<%# Bind("PM") %>'/>
            </td>
            <td>
                <b>Modeler: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlModeler" runat="server" DataSourceID="DdlEmpCADProgSQL"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ModeLbyEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Date Dims Appr: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtDateDimsAppr" runat="server" CssClass="DateBox" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td>
                <b>Customer: </b>
            </td>
            <td>
                <asp:Label ID="LblCustomer" runat="server" Text='<%# Bind("Customer") %>'/>
            </td>
            <td>
                <b>Design Lead: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlDesignLead" runat="server" DataSourceID="DdlEmpCADProgSQL"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Released By PM: </b>
            </td>
            <td>
                <asp:CheckBox ID="ChkReLbyPM" runat="server" Checked='<%# Bind("ReleasedByPM") %>'/>
            </td>
        </tr>
        <tr>
            <td>
                <b>CreatedBy: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtCreatedBy" runat="server" Text='<%# Bind("CreatedBy") %>'/>
            </td>
            <td>
                <b>Designer 2: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlDesign2" runat="server" DataSourceID="DdlEmpCADProgSQL"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Rel To Prog: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtReltoProg" runat="server" CssClass="DateBox" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td>
                <b># Panels: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtNumPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            </td>
            <td>
                <b>Program Lead: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProgLead" runat="server" DataSourceID="DdlEmpCADProgSQL"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Rel To Shop: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtRelToShop" runat="server" CssClass="DateBox" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <b>Programmer 2: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProg2" runat="server" DataSourceID="DdlEmpCADProgSQL"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Ship Date: </b>
            </td>
            <td>
                <asp:TextBox ID="TxtProjShipDate" runat="server" CssClass="DateBox" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <b>Programming Source: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProgSource" runat="server" DataSourceID="DdLbFProgSourceSQL"
                                  DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Source-->" Value=""/>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <b>Programming Source Path: </b>
            </td>
            <td>
                <asp:TextBox ID="ProgSourcePathTextBox" runat="server" Text='<%# Bind("ProgSourcePath") %>' TextMode="MultiLine" CssClass="TextArea"/>
            </td>
        </tr>
    </table>
    <div>
        <asp:CheckBox ID="ChkProgComplete" runat="server" Visible="False" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkProdComplete" runat="server" Visible="False" Checked='<%# Bind("ProductionComplete") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusionTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusionNonTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false"/>
        <asp:Label ID="LblNotes" runat="server" Visible="False" Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
    </div>
    <div>
        <asp:CheckBox ID="ChkBrakeMetal" runat="server" Visible="False" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusions" runat="server" Visible="False" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkFasteners" runat="server" Visible="False" Checked='<%# Bind("SupportFasteners") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkFillerStrips" runat="server" Visible="False" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkStiffeners" runat="server" Visible="False" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkGaskets" runat="server" Visible="False" Checked='<%# Bind("SupportGasket") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkSnapCovers" runat="server" Visible="False" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false"/>
        <asp:Label ID="LblOther" runat="server" Visible="False" Text='<%# Bind("SupportOther") %>'/>
    </div>
    <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"/>
    &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
</EditItemTemplate>

<ItemTemplate>
    <h1>Production Booking Form</h1><asp:Label ID="LblBFID" runat="server" Text='<%# Eval("BookingFormID") %>' Visible="false"/>
    <h2>
        <asp:Label ID="LblProjectID" runat="server" Text='<%# Eval("ProjectID") %>'/> - <asp:Label ID="LblProjectName" runat="server" Text='<%# Eval("ProjectName") %>'/>
    </h2>
    <h3>
        Release <asp:Label ID="LblReleaseNum" runat="server" Text='<%# Eval("ReleaseNum") %>'/> - <asp:Label ID="LblReleaseName" runat="server" Text='<%# Eval("ReleaseDesc") %>'/>
    </h3>
    <table>
        <tr>
            <td>
                <b>PM: </b>
            </td>
            <td>
                <asp:Label ID="LblPM" runat="server" Text='<%# Bind("PM") %>'/>
            </td>
            <td>
                <b>Modeler: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlModeler" runat="server" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ModeLbyEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Date Dims Appr: </b>
            </td>
            <td>
                <asp:Label ID="LblDateDimsAppr" runat="server" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td>
                <b>Customer: </b>
            </td>
            <td>
                <asp:Label ID="LblCustomer" runat="server" Text='<%# Bind("Customer") %>'/>
            </td>
            <td>
                <b>Design Lead: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlDesignLead" runat="server" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Released By PM: </b>
            </td>
            <td>
                <asp:CheckBox ID="ChkReLbyPM" runat="server" Checked='<%# Bind("ReleasedByPM") %>' Enabled="false"/>
            </td>
        </tr>
        <tr>
            <td>
                <b>CreatedBy: </b>
            </td>
            <td>
                <asp:Label ID="LblCreatedBy" runat="server" Text='<%# Bind("CreatedBy") %>'/>
            </td>
            <td>
                <b>Designer 2: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlDesign2" runat="server" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Rel To Prog: </b>
            </td>
            <td>
                <asp:Label ID="LblReltoProg" runat="server" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td>
                <b># Panels: </b>
            </td>
            <td>
                <asp:Label ID="LblNumPanels" runat="server" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            </td>
            <td>
                <b>Program Lead: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProgLead" runat="server" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Rel To Shop: </b>
            </td>
            <td>
                <asp:Label ID="LblRelToShop" runat="server" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <b>Programmer 2: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProg2" runat="server" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                                  DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Employee-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <b>Ship Date: </b>
            </td>
            <td>
                <asp:Label ID="LblProjShipDate" runat="server" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <b>Programming Source: </b>
            </td>
            <td>
                <asp:DropDownList ID="DdlProgSourceView" runat="server" AutoPostBack="True" DataSourceID="DdLbFProgSourceSQL" Enabled="false"
                                  DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                    <asp:ListItem Text="<--Select Source-->" Value=""/>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>
                <b>Programming Source Path: </b>
            </td>
            <td>
                <asp:Label ID="LblProgSourcePath" runat="server" Text='<%# Bind("ProgSourcePath") %>'/>
            </td>
        </tr>
    </table>
    <div>
        <asp:CheckBox ID="ChkProgComplete" runat="server" Visible="False" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkProdComplete" runat="server" Visible="False" Checked='<%# Bind("ProductionComplete") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusionTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusionNonTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false"/>
        <asp:Label ID="LblNotes" runat="server" Visible="False" Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
    </div>
    <div>
        <asp:CheckBox ID="ChkBrakeMetal" runat="server" Visible="False" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkExtrusions" runat="server" Visible="False" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkFasteners" runat="server" Visible="False" Checked='<%# Bind("SupportFasteners") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkFillerStrips" runat="server" Visible="False" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkStiffeners" runat="server" Visible="False" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkGaskets" runat="server" Visible="False" Checked='<%# Bind("SupportGasket") %>' Enabled="false"/>
        <asp:CheckBox ID="ChkSnapCovers" runat="server" Visible="False" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false"/>
        <asp:Label ID="LblOther" runat="server" Visible="False" Text='<%# Bind("SupportOther") %>'/>
    </div>
    <asp:LinkButton ID="EditHeader" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="Edit" Text="Edit Header"/>
</ItemTemplate>

</asp:FormView>
<br/>
<br/>
<asp:Label ID="LblGvBFMats" runat="server" Text="Materials" Font-Bold="true"/>
<asp:GridView ID="GvBFMats" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False"
              DataKeyNames="MaterialID" DataSourceID="GvBFMatsSQL" OnRowCommand="GvBFMats_RowCommand" CssClass="gridview" 
    ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" >

<Columns>
    <asp:TemplateField ShowHeader="False" ControlStyle-CssClass="NoPrint">
        <EditItemTemplate>
            <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
            &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
        </EditItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="LbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
            &nbsp;<asp:LinkButton ID="LbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
        </ItemTemplate>
        <FooterTemplate>
            <asp:LinkButton ID="LbInsert" runat="server" CommandName="FooterInsert" Text="Save"/>
        </FooterTemplate>

        <ControlStyle CssClass="NoPrint"></ControlStyle>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Manufacturer" SortExpression="MatManufacturerID">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlMfr" runat="server" DataSourceID="DdlMatMfrSQL" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlMfr" runat="server" DataSourceID="DdlMatMfrSQL" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlMfr" runat="server" DataSourceID="DdlMatMfrSQL" AppendDataBoundItems="true"
                              DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>' Enabled="False">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Thickness" SortExpression="MatThicknessID">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlMatThicknessSQL" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlMatThicknessSQL" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlMatThicknessSQL" enabled="false" AppendDataBoundItems="true"
                              DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Core" SortExpression="MatCoreID">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlMatCoreSQL" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlMatCoreSQL" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlMatCoreSQL" Enabled="false" AppendDataBoundItems="true"
                              DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Size (HxL)" SortExpression="MatSizeID">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlSize" runat="server" DataSourceID="DdlMatSizeSQL" AppendDataBoundItems="true"
                              DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlSize" runat="server" DataSourceID="DdlMatSizeSQL" AppendDataBoundItems="true"
                              DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlSize" runat="server" DataSourceID="DdlMatSizeSQL" Enabled="false" AppendDataBoundItems="true"
                              DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Color" SortExpression="MatFinishColor">
        <EditItemTemplate>
            <asp:TextBox ID="TxtColor" runat="server" Text='<%# Bind("MatFinishColor") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtColor" runat="server"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblColor" runat="server" Text='<%# Bind("MatFinishColor") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Qty" SortExpression="MatQty" ItemStyle-HorizontalAlign="Right">
        <EditItemTemplate>
            <asp:TextBox ID="TxtQty" runat="server" CssClass="NumBox" Text='<%# Bind("MatQty") %>'></asp:TextBox>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:TextBox ID="TxtQty" runat="server" CssClass="NumBox"></asp:TextBox>
        </FooterTemplate>
        <ItemTemplate>
            <asp:Label ID="LblQty" runat="server" Text='<%# Bind("MatQty") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Pre/Post" SortExpression="MatFinishPrePostID">
        <EditItemTemplate>
            <asp:DropDownList ID="DdlFinish" runat="server" DataSourceID="DdlMatFinishSQL" AppendDataBoundItems="true"
                              DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </EditItemTemplate>
        <FooterTemplate>
            <asp:DropDownList ID="DdlFinish" runat="server" DataSourceID="DdlMatFinishSQL" AppendDataBoundItems="true"
                              DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </FooterTemplate>
        <ItemTemplate>
            <asp:DropDownList ID="DdlFinish" runat="server" DataSourceID="DdlMatFinishSQL" Enabled="false" AppendDataBoundItems="true"
                              DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                <asp:ListItem Text="<--Select-->" Value=""/>
            </asp:DropDownList>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
<EmptyDataTemplate>
    <table>
        <tr style="background-color: gray; color:white">
            <th></th>
            <th>Manufacturer</th>
            <th>Thickness</th>
            <th>Core</th>
            <th>Size (HxL)</th>
            <th>Color</th>
            <th>Qty</th>
            <th>Pre/Post</th>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LbEmptyInsert" runat="server" CssClass="NoPrint" CommandName="EmptyInsert" Text="Save"/>
            </td>
            <td>
                <asp:DropDownList ID="DdlMfr" runat="server" DataSourceID="DdlMatMfrSQL" AppendDataBoundItems="True"
                                  DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                    <asp:ListItem Text="<--Select Mfr-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DdlThickness" runat="server" DataSourceID="DdlMatThicknessSQL" AppendDataBoundItems="true"
                                  DataTextField="MatThickness" DataValueField="MatThicknessID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DdlCore" runat="server" DataSourceID="DdlMatCoreSQL" AppendDataBoundItems="true"
                                  DataTextField="MatCore" DataValueField="MatCoreID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DdlSize" runat="server" DataSourceID="DdlMatSizeSQL" AppendDataBoundItems="true"
                                  DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
            <td>
                <asp:TextBox ID="TxtColor" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="TxtQty" runat="server" CssClass="NumBox"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="DdlFinish" runat="server" DataSourceID="DdlMatFinishSQL" AppendDataBoundItems="true"
                                  DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</EmptyDataTemplate>

<FooterStyle CssClass="NoPrint" BackColor="#CCCCCC"></FooterStyle>
<HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White"/>
<PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"/>
<RowStyle BackColor="White"/>
<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>

</asp:GridView>
<asp:FormView runat="server" ID="FvMaterials" DataKeyNames="BookingFormID" DataSourceID="FvBookingFormSQL" OnItemCommand="FvBF_ItemCommand" RenderOuterTable="False">

    <ItemTemplate>
        <table>
            <tr>
                <td>
                    <b>Brake Metal: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkBrakeMetal" runat="server" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkExtrusions" runat="server" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Fasteners: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkFasteners" runat="server" Checked='<%# Bind("SupportFasteners") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Filler Strips: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkFillerStrips" runat="server" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Stiffeners: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkStiffeners" runat="server" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Gasket: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkGaskets" runat="server" Checked='<%# Bind("SupportGasket") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Snap Covers: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkSnapCovers" runat="server" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Other: </b>
                </td>
                <td colspan="13">
                    <asp:Label ID="LblOther" runat="server" Text='<%# Bind("SupportOther") %>'/>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label ID="LblModelByEmpID" Visible="False" Text='<%# Bind("ModeLbyEmpID") %>' runat="server"/>

            <asp:Label ID="LblDateDimsAppr" runat="server" Visible="False" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblCustomer" runat="server" Visible="False" Text='<%# Bind("Customer") %>'/>
            <asp:DropDownList ID="DdlDesignLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:CheckBox ID="ChkReLbyPM" runat="server" Visible="False" Checked='<%# Bind("ReleasedByPM") %>' Enabled="false"/>
            <asp:Label ID="LblCreatedBy" runat="server" Visible="False" Text='<%# Bind("CreatedBy") %>'/>
            <asp:DropDownList ID="DdlDesign2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblReltoProg" runat="server" Visible="False" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblNumPanels" runat="server" Visible="False" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            <asp:DropDownList ID="DdlProgLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblRelToShop" runat="server" Visible="False" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProg2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProjShipDate" runat="server" Visible="False" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProgSourceView" runat="server" Visible="False" AutoPostBack="True" DataSourceID="DdLbFProgSourceSQL" Enabled="false"
                              DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Source-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProgSourcePath" runat="server" Visible="False" Text='<%# Bind("ProgSourcePath") %>'/>
        </div>
        <div>
            <asp:CheckBox ID="ChkProgComplete" runat="server" Visible="False" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkProdComplete" runat="server" Visible="False" Checked='<%# Bind("ProductionComplete") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusionTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusionNonTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false"/>
            <asp:Label ID="LblNotes" runat="server" Visible="False" Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
        </div>
        <asp:LinkButton ID="EditMats" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="Edit" Text="Edit Materials"/>
    </ItemTemplate>
    <EditItemTemplate>
        <table>
            <tr>
                <td>
                    <b>Brake Metal: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkBrakeMetal" runat="server" Checked='<%# Bind("SupportBrakeMetal") %>'/>
                </td>
                <td>
                    <b>Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkExtrusions" runat="server" Checked='<%# Bind("SupportExtrusions") %>'/>
                </td>
                <td>
                    <b>Fasteners: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkFasteners" runat="server" Checked='<%# Bind("SupportFasteners") %>'/>
                </td>
                <td>
                    <b>Filler Strips: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkFillerStrips" runat="server" Checked='<%# Bind("SupportFillerStrips") %>'/>
                </td>
                <td>
                    <b>Stiffeners: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkStiffeners" runat="server" Checked='<%# Bind("SupportStiffeners") %>'/>
                </td>
                <td>
                    <b>Gasket: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkGasket" runat="server" Checked='<%# Bind("SupportGasket") %>'/>
                </td>
                <td>
                    <b>Snap Covers: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkSnapCovers" runat="server" Checked='<%# Bind("SupportSnapCovers") %>'/>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label ID="LblModelByEmpID" Visible="False" Text='<%# Bind("ModeLbyEmpID") %>' runat="server"/>

            <asp:Label ID="LblDateDimsAppr" runat="server" Visible="False" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblCustomer" runat="server" Visible="False" Text='<%# Bind("Customer") %>'/>
            <asp:DropDownList ID="DdlDesignLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:CheckBox ID="ChkReLbyPM" runat="server" Visible="False" Checked='<%# Bind("ReleasedByPM") %>' Enabled="false"/>
            <asp:Label ID="LblCreatedBy" runat="server" Visible="False" Text='<%# Bind("CreatedBy") %>'/>
            <asp:DropDownList ID="DdlDesign2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblReltoProg" runat="server" Visible="False" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblNumPanels" runat="server" Visible="False" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            <asp:DropDownList ID="DdlProgLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblRelToShop" runat="server" Visible="False" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProg2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProjShipDate" runat="server" Visible="False" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProgSourceView" runat="server" Visible="False" AutoPostBack="True" DataSourceID="DdLbFProgSourceSQL" Enabled="false"
                              DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Source-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProgSourcePath" runat="server" Visible="False" Text='<%# Bind("ProgSourcePath") %>'/>
        </div>
        <div>
            <asp:CheckBox ID="ChkProgComplete" runat="server" Visible="False" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkProdComplete" runat="server" Visible="False" Checked='<%# Bind("ProductionComplete") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusionTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusionNonTypical" runat="server" Visible="False" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false"/>
            <asp:Label ID="LblNotes" runat="server" Visible="False" Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
        </div>
        <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"/>
        &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
    </EditItemTemplate>
</asp:FormView>
<br/>
<br/>
<asp:Label ID="GvBFProdLabel" runat="server" Text="Production" Font-Bold="true"/>
<asp:GridView ID="GvBFProd" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False"
              DataKeyNames="BFProdID" DataSourceID="GvBFProdSQL" OnRowCommand="GvBFProd_RowCommand"  
    ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="gridview">

    <Columns>
        <asp:TemplateField ShowHeader="False" ControlStyle-CssClass="NoPrint">
            <EditItemTemplate>
                <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:LinkButton ID="LbInsert" runat="server" CommandName="FooterInsert" Text="Save"/>
            </FooterTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
            </ItemTemplate>

<ControlStyle CssClass="NoPrint"></ControlStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Series" SortExpression="SeriesID">
            <EditItemTemplate>
                <asp:DropDownList ID="DdlSeries" runat="server" DataSourceID="DdLbFSeriesSQL" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:DropDownList ID="DdlSeries" runat="server" DataSourceID="DdLbFSeriesSQL" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="SeriesID">
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </FooterTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DdlSeries" runat="server" DataSourceID="DdLbFSeriesSQL" Enabled="false" AppendDataBoundItems="true"
                                  DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                    <asp:ListItem Text="<--Select-->" Value=""/>
                </asp:DropDownList>
            </ItemTemplate>
            <FooterStyle HorizontalAlign="Left"/>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#&nbsp;Flat Panels" SortExpression="NumFlatPanels" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="NumBox">
            <EditItemTemplate>
                <asp:TextBox ID="TxtFlatPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumFlatPanels") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblFlatPanels" runat="server"  Text='<%# Bind("NumFlatPanels") %>'></asp:Label>
            </ItemTemplate>

<HeaderStyle CssClass="NumBox"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#&nbsp;Gluers" SortExpression="NumACMWelders" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="NumBox">
            <EditItemTemplate>
                <asp:TextBox ID="TxtGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumACMWelders") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtGluers" runat="server" CssClass="NumBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblGluers" runat="server"  Text='<%# Bind("NumACMWelders") %>'></asp:Label>
            </ItemTemplate>

<HeaderStyle CssClass="NumBox"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#&nbsp;Radius Panels" SortExpression="NumRadPanels" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="NumBox">
            <EditItemTemplate>
                <asp:TextBox ID="TxtRadiusPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumRadPanels") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblRadiusPanels" runat="server"  Text='<%# Bind("NumRadPanels") %>'></asp:Label>
            </ItemTemplate>

<HeaderStyle CssClass="NumBox"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#&nbsp;Radius Gluers" SortExpression="NumAlumWelders" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="NumBox">
            <EditItemTemplate>
                <asp:TextBox ID="TxtRadiusGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumAlumWelders") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblRadiusGLuers" runat="server"  Text='<%# Bind("NumAlumWelders") %>'></asp:Label>
            </ItemTemplate>

<HeaderStyle CssClass="NumBox"></HeaderStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Other Description" SortExpression="OtherDesc">
            <EditItemTemplate>
                <asp:TextBox ID="TxtOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtOtherDesc" runat="server"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="#&nbsp;Other" SortExpression="NumOther" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="NumBox">
            <EditItemTemplate>
                <asp:TextBox ID="TxtNumOther" runat="server" CssClass="NumBox" Text='<%# Bind("NumOther") %>'></asp:TextBox>
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="TxtNumOther" runat="server" CssClass="NumBox"></asp:TextBox>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Label ID="LblNumOther" runat="server" Text='<%# Bind("NumOther") %>'></asp:Label>
            </ItemTemplate>

<HeaderStyle CssClass="NumBox"></HeaderStyle>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        <table>
            <tr style="background-color: gray ; color: white">
                <th></th>
                <th>Series</th>
                <th>#&nbsp;Flat Panels</th>
                <th>#&nbsp;Gluers</th>
                <th>#&nbsp;Radius Panels</th>
                <th>#&nbsp;Radius Gluers</th>
                <th>Other Description</th>
                <th>#&nbsp;Other</th>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="BtnProdEmpty" runat="server" CssClass="NoPrint" CommandName="EmptyInsert" Text="Save"/>
                </td>
                <td>
                    <asp:DropDownList ID="DdlSeries" runat="server" DataSourceID="DdlBFSeriesSQL" AppendDataBoundItems="true"
                                      DataTextField="Description" DataValueField="SeriesID">
                        <asp:ListItem Text="<--Select-->" Value=""/>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TxtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TxtGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TxtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TxtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TxtOtherDesc" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TxtNumOther" runat="server" CssClass="NumBox"></asp:TextBox>
                </td>
            </tr>
        </table>
    </EmptyDataTemplate>

<FooterStyle CssClass="NoPrint" BackColor="#CCCCCC"></FooterStyle>
    <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
    <RowStyle BackColor="White" />
    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#808080" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#383838" />
</asp:GridView>
<asp:FormView runat="server" ID="FvFooter" DataKeyNames="BookingFormID" DataSourceID="FvBookingFormSQL" OnItemCommand="FvBF_ItemCommand" RenderOuterTable="False">

    <ItemTemplate>
        <table>
            <tr>
                <td>
                    <b>Programming Complete: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkProgComplete" runat="server" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Production Complete: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkProdComplete" runat="server" Checked='<%# Bind("ProductionComplete") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Typical Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkExtrusionTypical" runat="server" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false"/>
                </td>
                <td>
                    <b>Non-Typical Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ChkExtrusionNonTypical" runat="server" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false"/>
                </td>
            </tr>
        </table>
        <br/>
        <table>
            <tr>
                <td>
                    <b>Notes: </b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblNotes" runat="server" BorderStyle="Solid" BorderWidth="1"
                               Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine, "<br />") %>'/>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label ID="LblModelByEmpID" Text='<%# Bind("ModelByEmpID") %>' runat="server" Visible="False"/>

            <asp:Label ID="LblDateDimsAppr" runat="server" Visible="False" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblCustomer" runat="server" Visible="False" Text='<%# Bind("Customer") %>'/>
            <asp:DropDownList ID="DdlDesignLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:CheckBox ID="ChkReLbyPM" runat="server" Visible="False" Checked='<%# Bind("ReleasedByPM") %>' Enabled="false"/>
            <asp:Label ID="LblCreatedBy" runat="server" Visible="False" Text='<%# Bind("CreatedBy") %>'/>
            <asp:DropDownList ID="DdlDesign2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblReltoProg" runat="server" Visible="False" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblNumPanels" runat="server" Visible="False" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            <asp:DropDownList ID="DdlProgLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblRelToShop" runat="server" Visible="False" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProg2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProjShipDate" runat="server" Visible="False" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProgSourceView" runat="server" Visible="False" AutoPostBack="True" DataSourceID="DdLbFProgSourceSQL" Enabled="false"
                              DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Source-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProgSourcePath" runat="server" Visible="False" Text='<%# Bind("ProgSourcePath") %>'/>
        </div>

        <div>
            <asp:CheckBox ID="ChkBrakeMetal" runat="server" Visible="False" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusions" runat="server" Visible="False" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkFasteners" runat="server" Visible="False" Checked='<%# Bind("SupportFasteners") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkFillerStrips" runat="server" Visible="False" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkStiffeners" runat="server" Visible="False" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkGaskets" runat="server" Visible="False" Checked='<%# Bind("SupportGasket") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkSnapCovers" runat="server" Visible="False" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false"/>
            <asp:Label ID="LblOther" runat="server" Visible="False" Text='<%# Bind("SupportOther") %>'/>
        </div>

        <asp:LinkButton ID="EditFooter" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="Edit" Text="Edit Footer"/>
        <br/>
        <br/>
        <asp:Button ID="DeleteButton" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="DeleteForm" Text="Delete"/>
        &nbsp;<asp:Button ID="NewButton" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="NewForm" Text="New"/>
        &nbsp;<asp:Button ID="EmailButton" runat="server" CssClass="NoPrint" CausesValidation="false" CommandName="Email" Text="Email"/>
    </ItemTemplate>
    <EditItemTemplate>
        <table>
            <tr>
                <td>
                    <b>Programming Complete: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ProgrammingCompleteCheckBox" runat="server" Checked='<%# Bind("ProgrammingComplete") %>'/>
                </td>
                <td>
                    <b>Production Complete: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ProductionCompleteCheckBox" runat="server" Checked='<%# Bind("ProductionComplete") %>'/>
                </td>
                <td>
                    <b>Typical Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ExtrusionTypicalCheckBox" runat="server" Checked='<%# Bind("ExtrusionTypical") %>'/>
                </td>
                <td>
                    <b>Non-Typical Extrusions: </b>
                </td>
                <td>
                    <asp:CheckBox ID="ExtrusionNonTypicalCheckBox" runat="server" Checked='<%# Bind("ExtrusionNonTypical") %>'/>
                </td>
            </tr>
        </table>
        <br/>
        <b>Notes:</b>
        <br/>
        <asp:TextBox ID="NotesTextBox" runat="server" CssClass="TextArea" TextMode="MultiLine" Rows="5"
                     Text='<%# Bind("Notes") %>'/>
        <br/>
        <div>
            <asp:Label ID="LblModelByEmpID" Visible="False" Text='<%# Bind("ModeLbyEmpID") %>' runat="server"/>

            <asp:Label ID="LblDateDimsAppr" runat="server" Visible="False" Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblCustomer" runat="server" Visible="False" Text='<%# Bind("Customer") %>'/>
            <asp:DropDownList ID="DdlDesignLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:CheckBox ID="ChkReLbyPM" runat="server" Visible="False" Checked='<%# Bind("ReleasedByPM") %>' Enabled="false"/>
            <asp:Label ID="LblCreatedBy" runat="server" Visible="False" Text='<%# Bind("CreatedBy") %>'/>
            <asp:DropDownList ID="DdlDesign2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblReltoProg" runat="server" Visible="False" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:Label ID="LblNumPanels" runat="server" Visible="False" Text='<%# Bind("NumPanelsThisRelease") %>'/>
            <asp:DropDownList ID="DdlProgLead" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblRelToShop" runat="server" Visible="False" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProg2" runat="server" Visible="False" DataSourceID="DdlEmpCADProgSQL" Enabled="false"
                              DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Employee-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProjShipDate" runat="server" Visible="False" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>'/>
            <asp:DropDownList ID="DdlProgSourceView" runat="server" Visible="False" AutoPostBack="True" DataSourceID="DdLbFProgSourceSQL" Enabled="false"
                              DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                <asp:ListItem Text="<--Select Source-->" Value=""/>
            </asp:DropDownList>
            <asp:Label ID="LblProgSourcePath" runat="server" Visible="False" Text='<%# Bind("ProgSourcePath") %>'/>
        </div>
        <div>
            <asp:CheckBox ID="ChkBrakeMetal" runat="server" Visible="False" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkExtrusions" runat="server" Visible="False" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkFasteners" runat="server" Visible="False" Checked='<%# Bind("SupportFasteners") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkFillerStrips" runat="server" Visible="False" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkStiffeners" runat="server" Visible="False" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkGaskets" runat="server" Visible="False" Checked='<%# Bind("SupportGasket") %>' Enabled="false"/>
            <asp:CheckBox ID="ChkSnapCovers" runat="server" Visible="False" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false"/>
            <asp:Label ID="LblOther" runat="server" Visible="False" Text='<%# Bind("SupportOther") %>'/>
        </div>


        <asp:LinkButton ID="LbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"/>
        &nbsp;<asp:LinkButton ID="LbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
    </EditItemTemplate>
</asp:FormView>

<asp:SqlDataSource ID="GvBFMatsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   DeleteCommand="DELETE FROM [tblBookingFormMats] WHERE [MaterialID] = @MaterialID"
                   InsertCommand="INSERT INTO [tblBookingFormMats] ( [BookingFormID], [MatManufacturerID], [MatThicknessID], [MatCoreID], [MatSizeID], [MatFinishColor], [MatQty], [MatFinishPrePostID]) 
            VALUES ( @BookingFormID, @MatManufacturerID, @MatThicknessID, @MatCoreID, @MatSizeID, @MatFinishColor, @MatQty, @MatFinishPrePostID)"
                   SelectCommand="SELECT [MaterialID], [BookingFormID], [MatNumber], [MatManufacturerID], [MatThicknessID], [MatCoreID], [MatSizeID], [MatFinishColor], [MatQty], [MatFinishPrePostID] 
        FROM [tblBookingFormMats] 
        WHERE ([BookingFormID] = @BFID)"
                   UpdateCommand="UPDATE [tblBookingFormMats] SET  [MatNumber] = @MatNumber, [MatManufacturerID] = @MatManufacturerID, [MatThicknessID] = @MatThicknessID, [MatCoreID] = @MatCoreID, 
        [MatSizeID] = @MatSizeID, [MatFinishColor] = @MatFinishColor, [MatQty] = @MatQty, [MatFinishPrePostID] = @MatFinishPrePostID 
        WHERE [MaterialID] = @MaterialID">
    <DeleteParameters>
        <asp:Parameter Name="MaterialID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MatManufacturerID" Type="Int32"/>
        <asp:Parameter Name="MatThicknessID" Type="Int32"/>
        <asp:Parameter Name="MatCoreID" Type="Int32"/>
        <asp:Parameter Name="MatSizeID" Type="Int32"/>
        <asp:Parameter Name="MatFinishColor" Type="String"/>
        <asp:Parameter Name="MatQty" Type="Int32"/>
        <asp:Parameter Name="MatFinishPrePostID" Type="Int32"/>
    </InsertParameters>
    <SelectParameters>
        <%-- <asp:QueryStringParameter Name="BookingFormID" Type="Int32" QueryStringField="BFID" /> --%>
        <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="MatNumber" Type="Int32"/>
        <asp:Parameter Name="MatManufacturerID" Type="Int32"/>
        <asp:Parameter Name="MatThicknessID" Type="Int32"/>
        <asp:Parameter Name="MatCoreID" Type="Int32"/>
        <asp:Parameter Name="MatSizeID" Type="Int32"/>
        <asp:Parameter Name="MatFinishColor" Type="String"/>
        <asp:Parameter Name="MatQty" Type="Int32"/>
        <asp:Parameter Name="MatFinishPrePostID" Type="Int32"/>
        <asp:Parameter Name="MaterialID" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="GvBFProdSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [BFProdID], [BFID], [SeriesID], [NumACMWelders], [NumAlumWelders], [NumFlatPanels], [NumRadPanels], [OtherDesc], [NumOther] 
            FROM [tblBookingFormProd] WHERE ([BFID] = @BFID) ORDER BY [BFProdID]"
                   DeleteCommand="DELETE FROM [tblBookingFormProd] WHERE [BFProdID] = @BFProdID"
                   InsertCommand="INSERT INTO [tblBookingFormProd] ( [BFID], [SeriesID], [NumACMWelders], [NumAlumWelders], [NumFlatPanels], [NumRadPanels], [OtherDesc], [NumOther]) 
            VALUES ( @BFID, @SeriesID, @NumACMWelders, @NumAlumWelders, @NumFlatPanels, @NumRadPanels, @OtherDesc, @NumOther)"
                   UpdateCommand="UPDATE [tblBookingFormProd] SET  [SeriesID] = @SeriesID, [NumACMWelders] = @NumACMWelders, [NumAlumWelders] = @NumAlumWelders, 
            [NumFlatPanels] = @NumFlatPanels, [NumRadPanels] = @NumRadPanels, [OtherDesc] = @OtherDesc, [NumOther] = @NumOther WHERE [BFProdID] = @BFProdID">
    <DeleteParameters>
        <asp:Parameter Name="BFProdID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="BFID" Type="Int32"/>
        <asp:Parameter Name="SeriesID" Type="Int32"/>
        <asp:Parameter Name="NumACMWelders" Type="Int32"/>
        <asp:Parameter Name="NumAlumWelders" Type="Int32"/>
        <asp:Parameter Name="NumFlatPanels" Type="Int32"/>
        <asp:Parameter Name="NumRadPanels" Type="Int32"/>
        <asp:Parameter Name="OtherDesc" Type="String"/>
        <asp:Parameter Name="NumOther" Type="Int32"/>
    </InsertParameters>
    <SelectParameters>
        <%-- <asp:QueryStringParameter Name="BFID" Type="Int32" QueryStringField="BFID" /> --%>
        <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="SeriesID" Type="Int32"/>
        <asp:Parameter Name="NumACMWelders" Type="Int32"/>
        <asp:Parameter Name="NumAlumWelders" Type="Int32"/>
        <asp:Parameter Name="NumFlatPanels" Type="Int32"/>
        <asp:Parameter Name="NumRadPanels" Type="Int32"/>
        <asp:Parameter Name="OtherDesc" Type="String"/>
        <asp:Parameter Name="NumOther" Type="Int32"/>
        <asp:Parameter Name="BFProdID" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlBFProgSourceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [ProgSourceID], [ProgSourceDesc] FROM [tblProgSource] ORDER BY [ProgSourceDesc]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="FvBookingFormSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   DeleteCommand="DELETE FROM [tblBookingForm] WHERE [BookingFormID] = @BFID"
                   InsertCommand="INSERT INTO tblBookingForm(ProjectID) VALUES (@ProjectID); SELECT @NewBFID = SCOPE_IDENTITY()"
                   SelectCommand="SELECT bf.BookingFormID, bf.ProjectID, bf.ReleaseNum, bf.ReleaseDesc, bf.DateDimsApproved, bf.ActEngRelDate, bf.ActProjShipDate, bf.NumPanelsThisRelease, 
            bf.ProgSourcePath, bf.ExtrusionTypical, bf.ExtrusionNonTypical, bf.SupportBrakeMetal, bf.SupportExtrusions, bf.SupportFasteners, bf.CreatedBy, bf.ReleasedByPM, 
            bf.SupportFillerStrips, bf.SupportStiffeners, bf.SupportGasket, bf.SupportSnapCovers, bf.SupportOther, bf.Notes, bf.ProductionComplete, bf.ProgrammingComplete, 
            bf.ProgSourceID, p.ProjectName, c.Company AS Customer, emp.Name AS PM, bf.ToProgDate, bf.ModeLbyEmpID, bf.DesignByEmpID, bf.ProgramByEmpID, bf.Design2EmpID, bf.Prog2EmpID 
            FROM tblBookingForm AS bf 
            INNER JOIN tblProject AS p ON bf.ProjectID = p.ProjectID 
            INNER JOIN tblCustomer AS c ON p.CustomerID = c.CustomerID 
            INNER JOIN tblEmployee AS emp ON p.Scope_PM_EmployeeID = emp.EmployeeID WHERE (bf.BookingFormID = @BFID)"
                   UpdateCommand="UPDATE tblBookingForm SET ReleaseNum = @ReleaseNum, ProgSourceID = @ProgSourceID, ReleaseDesc = @ReleaseDesc, 
            SystemTypeID = @SystemTypeID, DateDimsApproved = @DateDimsApproved, ActEngRelDate = @ActEngRelDate, ActProjShipDate = @ActProjShipDate, 
            NumPanelsThisRelease = @NumPanelsThisRelease, ProgSourcePath = @ProgSourcePath, ExtrusionTypical = @ExtrusionTypical, 
            ExtrusionNonTypical = @ExtrusionNonTypical, SupportBrakeMetal = @SupportBrakeMetal, SupportExtrusions = @SupportExtrusions, SupportFasteners = @SupportFasteners, 
            CreatedBy = @CreatedBy, ReleasedByPM = @ReleasedByPM, SupportFillerStrips = @SupportFillerStrips, SupportStiffeners = @SupportStiffeners, 
            SupportGasket = @SupportGasket, SupportSnapCovers = @SupportSnapCovers, SupportOther = @SupportOther, Notes = @Notes, ProductionComplete = @ProductionComplete, 
            ProgrammingComplete = @ProgrammingComplete, ToProgDate = @ToProgDate, ModelByEmpID = @ModelByEmpID, DesignByEmpID = @DesignByEmpID, ProgramByEmpID = @ProgramByEmpID,
            Design2EmpID = @Design2EmpID, Prog2EmpID = @Prog2EmpID
            WHERE BookingFormID = @BFID"
                   OnInserted="FvBookingFormSQL_OnInserted">
    <DeleteParameters>
        <asp:Parameter Name="BFID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Name="NewBFID" Type="Int32" Direction="Output" DefaultValue="0"/>
    </InsertParameters>
    <SelectParameters>
        <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ReleaseNum" Type="Int32"/>
        <asp:Parameter Name="ProgSourceID" Type="Int32"/>
        <asp:Parameter Name="ReleaseDesc" Type="String"/>
        <asp:Parameter Name="SystemTypeID" Type="Int32"/>
        <asp:Parameter Name="DateDimsApproved" Type="DateTime"/>
        <asp:Parameter Name="ActEngRelDate" Type="DateTime"/>
        <asp:Parameter Name="ActProjShipDate" Type="DateTime"/>
        <asp:Parameter Name="NumPanelsThisRelease" Type="Int32"/>
        <asp:Parameter Name="ProgSourcePath" Type="String"/>
        <asp:Parameter Name="ExtrusionTypical" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="ExtrusionNonTypical" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportBrakeMetal" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportExtrusions" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportFasteners" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="CreatedBy" Type="String"/>
        <asp:Parameter Name="ReleasedByPM" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportFillerStrips" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportStiffeners" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportGasket" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportSnapCovers" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="SupportOther" Type="String"/>
        <asp:Parameter Name="Notes" Type="String"/>
        <asp:Parameter Name="ProductionComplete" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="ProgrammingComplete" Type="Boolean" DefaultValue="False"/>
        <asp:Parameter Name="ToProgDate" Type="DateTime"/>
        <asp:Parameter Name="ModeLbyEmpID" Type="Int32"/>
        <asp:Parameter Name="DesignByEmpID" Type="Int32"/>
        <asp:Parameter Name="ProgramByEmpID" Type="Int32"/>
        <asp:Parameter Name="Design2EmpID" Type="Int32"/>
        <asp:Parameter Name="Prog2EmpID" Type="Int32"/>
        <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlBFSeriesSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [SeriesID], [Description] FROM [tblSeries] ORDER BY [Description]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatCoreSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatCoreID], [MatCore] FROM [tblMatCore] ORDER BY [MatCore]">

</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatFinishSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatFinishPrePostID], [MatFinishPrePostDesc] FROM [tblMatFinishPrePost] ORDER BY [MatFinishPrePostID]">

</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatMfrSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatManufacturerID], [MatManufacturerDesc] FROM [tblMatManufacturer] ORDER BY [MatManufacturerDesc]">

</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatSizeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatSizeID], [MatSizeHxL] FROM [tblMatSize] ORDER BY [MatSizeHxL]">

</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlMatThicknessSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [MatThicknessID], [MatThickness] FROM [tblMatThickness] ORDER BY [MatThickness]">

</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlEmpCADProgSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT DISTINCT e.EmployeeID, e.Name FROM tblEmployee AS e INNER JOIN tblEmployeeRole AS er ON e.EmployeeID = er.EmployeeID 
            LEFT OUTER JOIN tblEmployeeType AS et ON er.EmployeeTypeID = et.EmployeeTypeID 
            WHERE (et.Description = 'CAD') OR (et.Description = 'Programmer') ORDER BY e.Name">
</asp:SqlDataSource>
</asp:Content>