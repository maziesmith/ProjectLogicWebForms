<%@ Page Title="Booking Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BFDetails.aspx.cs" Inherits="ProjectLogic.BFDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="fvBookingForm" runat="server" CellPadding="4" DataKeyNames="BookingFormID" DataSourceID="fvBookingFormSQL" OnItemCommand="fvBF_ItemCommand" ForeColor="#333333">
        <EditItemTemplate>
            <h1>Production Booking Form</h1><asp:Label ID="lblBFID" runat="server" Text='<%# Eval("BookingFormID") %>' Visible="false" />
            <h2><asp:Label ID="lblProjectNum" runat="server" Text='<%# Eval("ProjectID") %>' /> - <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' /></h2>
            <h3>Release <asp:Label ID="lblReleaseNum" runat="server" Text='<%# Eval("ReleaseNum") %>' /> - <asp:Label ID="lblReleaseName" runat="server" Text='<%# Eval("ReleaseDesc") %>' /></h3>
            <table border="1">
                <tr>
                    <td><b>PM: </b></td>
                    <td><asp:Label ID="lblPM" runat="server"  Text='<%# Bind("PM") %>' /></td>
                    <td><b>Modeler: </b></td>
                    <td><asp:DropDownList ID="ddlModeler" runat="server" DataSourceID="ddlEmpCADProgSQL" 
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ModelByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Date Dims Appr: </b></td>
                    <td><asp:TextBox ID="txtDateDimsAppr" runat="server" CssClass="DateBox"  Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td><b>Customer: </b></td>
                    <td><asp:Label ID="lblCustomer" runat="server"  Text='<%# Bind("Customer") %>' /></td>
                    <td><b>Design Lead: </b></td>
                    <td><asp:DropDownList ID="ddlDesignLead" runat="server" DataSourceID="ddlEmpCADProgSQL" 
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Released By PM: </b></td>
                    <td><asp:CheckBox ID="chkRelByPM" runat="server"  Checked='<%# Bind("ReleasedByPM") %>'  /></td>
                </tr>
                <tr>
                    <td><b>CreatedBy: </b></td>
                    <td><asp:TextBox ID="txtCreatedBy" runat="server"  Text='<%# Bind("CreatedBy") %>' /></td>
                    <td><b>Designer 2: </b></td>
                    <td><asp:DropDownList ID="ddlDesign2" runat="server" DataSourceID="ddlEmpCADProgSQL" 
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Rel To Prog: </b></td>
                    <td><asp:TextBox ID="txtReltoProg" runat="server" CssClass="DateBox" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td><b># Panels: </b></td>
                    <td><asp:TextBox ID="txtNumPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumPanelsThisRelease") %>' /></td>
                    <td><b>Program Lead: </b></td>
                    <td><asp:DropDownList ID="ddlProgLead" runat="server" DataSourceID="ddlEmpCADProgSQL" 
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Rel To Shop: </b></td>
                    <td><asp:TextBox ID="txtRelToShop" runat="server" CssClass="DateBox" Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><b>Programmer 2: </b></td>
                    <td><asp:DropDownList ID="ddlProg2" runat="server" DataSourceID="ddlEmpCADProgSQL" 
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Ship Date: </b></td>
                    <td><asp:TextBox ID="txtProjShipDate" runat="server" CssClass="DateBox" Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
            </table>
            <table border="0">
                <tr>
                    <td><b>Programming Source: </b></td>
                    <td>
                        <asp:DropDownList ID="ddlProgSource" runat="server" AutoPostBack="True" DataSourceID="ddlBFProgSourceSQL" 
                            DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                            <asp:ListItem Text="<--Select Source-->" Value="" />
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td><b>Programming Source Path: </b></td>
                    <td><asp:TextBox ID="ProgSourcePathTextBox" runat="server"  Text='<%# Bind("ProgSourcePath") %>' TextMode="MultiLine" CssClass="TextArea" /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="gvBFMatsLabel" runat="server" Text="Materials" Font-Bold="true" />
            <asp:GridView ID="gvBFMats" runat="server" ShowFooter="True" AutoGenerateColumns="False" DataKeyNames="MaterialID" DataSourceID="gvBFMatsSQL" OnRowCommand="gvBFMats_RowCommand">
                <EditRowStyle BackColor="LightYellow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="ButtonAdd" runat="server" CommandName="FooterInsert" Text="Save" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer" SortExpression="MatManufacturerID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>'>
                                <asp:ListItem Text="<--Select Mfr-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                                <asp:ListItem Text="<--Select Mfr-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>' Enabled="False">
                                <asp:ListItem Text="<--Select Mfr-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thickness" SortExpression="MatThicknessID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true" 
                                DataTextField="MatThickness" DataValueField="MatThicknessID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Core" SortExpression="MatCoreID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Size (HxL)" SortExpression="MatSizeID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true" 
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" SortExpression="MatFinishColor">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtColor" runat="server" Text='<%# Bind("MatFinishColor") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtColor" runat="server" Text='<%# Bind("MatFinishColor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty" SortExpression="MatQty">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("MatQty") %>' CssClass="NumBox"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="txtQty" runat="server" Text='<%# Bind("MatQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pre/Post" SortExpression="MatFinishPrePostID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true" 
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspExtra Sheets" SortExpression="MatNumExtraSheets" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MatNumExtraSheets") %>' CssClass="NumBox"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtExtra" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("MatNumExtraSheets") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="1">
                        <tr style="background-color: gray;">
                            <th></th>
                            <th>Manufacturer</th>
                            <th>Thickness</th>
                            <th>Core</th>
                            <th>Size (HxL)</th>
                            <th>Color</th>
                            <th>Qty</th>
                            <th>Pre/Post</th>
                            <th>#&nbspExtra Sheets</th>
                        </tr>
                        <tr>
                            <td><asp:LinkButton ID="btnMatsEmpty" runat="server" CommandName="EmptyInsert" Text="Insert" /></td>
                            <td><asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                    DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true" 
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="NumBox"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtExtra" runat="server" CssClass="NumBox"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>

            <table border="0">
                <tr>
                    <td><b>Brake Metal: </b></td>
                    <td><asp:CheckBox ID="SupportBrakeMetalCheckBox" runat="server" Checked='<%# Bind("SupportBrakeMetal") %>'  /></td>
                    <td><b>Extrusions: </b></td>
                    <td><asp:CheckBox ID="SupportExtrusionsCheckBox" runat="server" Checked='<%# Bind("SupportExtrusions") %>'  /></td>
                    <td><b>Fasteners: </b></td>
                    <td><asp:CheckBox ID="SupportFastenersCheckBox" runat="server" Checked='<%# Bind("SupportFasteners") %>'  /></td>
                    <td><b>Filler Strips: </b></td>
                    <td><asp:CheckBox ID="SupportFillerStripsCheckBox" runat="server" Checked='<%# Bind("SupportFillerStrips") %>'  /></td>
                    <td><b>Stiffeners: </b></td>
                    <td><asp:CheckBox ID="SupportStiffenersCheckBox" runat="server" Checked='<%# Bind("SupportStiffeners") %>'  /></td>
                    <td><b>Gasket: </b></td>
                    <td><asp:CheckBox ID="SupportGasketCheckBox" runat="server" Checked='<%# Bind("SupportGasket") %>'  /></td>
                    <td><b>Snap Covers: </b></td>
                    <td><asp:CheckBox ID="SupportSnapCoversCheckBox" runat="server" Checked='<%# Bind("SupportSnapCovers") %>'  /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="gvBFProdLabel" runat="server" Text="Production" Font-Bold="true"/>
            <asp:GridView ID="gvBFProd" runat="server" ShowFooter="True" AutoGenerateColumns="False" DataKeyNames="BFProdID" DataSourceID="gvBFProdSQL" OnRowCommand="gvBFProd_RowCommand">
                <EditRowStyle BackColor="LightYellow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbFooterInsert" runat="server" CommandName="FooterInsert" Text="Save"  />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Series" SortExpression="SeriesID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspACM Welders" SortExpression="NumACMWelders" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumACMWelders") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGluers" runat="server" Text='<%# Bind("NumACMWelders") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspAlum Welders" SortExpression="NumAlumWelders" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumAlumWelders") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRadiusGluers" runat="server" Text='<%# Bind("NumAlumWelders") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspFlat Panels" SortExpression="NumFlatPanels" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumFlatPanels") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFlatPanels" runat="server" Text='<%# Bind("NumFlatPanels") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspRadius Panels" SortExpression="NumRadPanels" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumRadPanels") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRadiusPanels" runat="server" Text='<%# Bind("NumRadPanels") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Other Description" SortExpression="OtherDesc">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtOtherDesc" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspOther" SortExpression="NumOther" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox" Text='<%# Bind("NumOther") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNumOther" runat="server" Text='<%# Bind("NumOther") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="1">
                        <tr style="background-color:gray">
                            <th></th>
                            <th>Series</th>
                            <th>#&nbspACM Welders</th>
                            <th>#&nbspAlum Welders</th>
                            <th>#&nbspFlat Panels</th>
                            <th>#&nbspRadius Panels</th>
                            <th>Other Description</th>
                            <th>#&nbspOther</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnProdEmpty" runat="server" CommandName="EmptyInsert" Text="Save" />
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                    DataTextField="Description" DataValueField="SeriesID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td><asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtOtherDesc" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox"></asp:TextBox></td>
                        </tr>
                    </table>
                    
                </EmptyDataTemplate>
            </asp:GridView>  
            <table border="0">
                <tr>
                    <td><b>Programming Complete: </b></td>
                    <td><asp:CheckBox ID="ProgrammingCompleteCheckBox" runat="server" Checked='<%# Bind("ProgrammingComplete") %>' /></td>
                    <td><b>Production Complete: </b></td>
                    <td><asp:CheckBox ID="ProductionCompleteCheckBox" runat="server" Checked='<%# Bind("ProductionComplete") %>' /></td>
                    <td><b>Typical Extrusions: </b></td>
                    <td><asp:CheckBox ID="ExtrusionTypicalCheckBox" runat="server" Checked='<%# Bind("ExtrusionTypical") %>' /></td>
                    <td><b>Non-Typical Extrusions: </b></td>
                    <td><asp:CheckBox ID="ExtrusionNonTypicalCheckBox" runat="server" Checked='<%# Bind("ExtrusionNonTypical") %>' /></td>
                </tr>
            </table>
            <br />
            <b>Notes:</b>
            <br />
            <asp:TextBox ID="NotesTextBox" runat="server" CssClass="TextArea" TextMode="MultiLine" Rows="5" 
                Text='<%# Bind("Notes") %>' />
            <br />
            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />
            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="LightYellow" />
        <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <h1>Production Booking Form</h1><asp:Label ID="lblBFID" runat="server" Text='<%# Eval("BookingFormID") %>' Visible="false" />
            <h2><asp:Label ID="lblProjectNum" runat="server" Text='<%# Eval("ProjectID") %>' /> - <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' /></h2>
            <h3>Release <asp:Label ID="lblReleaseNum" runat="server" Text='<%# Eval("ReleaseNum") %>' /> - <asp:Label ID="lblReleaseName" runat="server" Text='<%# Eval("ReleaseDesc") %>' /></h3>
            <table border="1">
                <tr>
                    <td><b>PM: </b></td>
                    <td><asp:Label ID="lblPM" runat="server"  Text='<%# Bind("PM") %>' /></td>
                    <td><b>Modeler: </b></td>
                    <td><asp:DropDownList ID="ddlModeler" runat="server" DataSourceID="ddlEmpCADProgSQL" Enabled="false"
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ModelByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Date Dims Appr: </b></td>
                    <td><asp:Label ID="lblDateDimsAppr" runat="server"  Text='<%# Bind("DateDimsApproved", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td><b>Customer: </b></td>
                    <td><asp:Label ID="lblCustomer" runat="server"  Text='<%# Bind("Customer") %>' /></td>
                    <td><b>Design Lead: </b></td>
                    <td><asp:DropDownList ID="ddlDesignLead" runat="server" DataSourceID="ddlEmpCADProgSQL" Enabled="false"
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("DesignByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Released By PM: </b></td>
                    <td><asp:CheckBox ID="chkRelByPM" runat="server"  Checked='<%# Bind("ReleasedByPM") %>' Enabled="false" /></td>
                </tr>
                <tr>
                    <td><b>CreatedBy: </b></td>
                    <td><asp:Label ID="lblCreatedBy" runat="server"  Text='<%# Bind("CreatedBy") %>' /></td>
                    <td><b>Designer 2: </b></td>
                    <td><asp:DropDownList ID="ddlDesign2" runat="server" DataSourceID="ddlEmpCADProgSQL" Enabled="false"
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Design2EmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Rel To Prog: </b></td>
                    <td><asp:Label ID="lblReltoProg" runat="server" Text='<%# Bind("ToProgDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td><b># Panels: </b></td>
                    <td><asp:Label ID="lblNumPanels" runat="server"  Text='<%# Bind("NumPanelsThisRelease") %>' /></td>
                    <td><b>Program Lead: </b></td>
                    <td><asp:DropDownList ID="ddlProgLead" runat="server" DataSourceID="ddlEmpCADProgSQL" Enabled="false"
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("ProgramByEmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Rel To Shop: </b></td>
                    <td><asp:Label ID="lblRelToShop" runat="server"  Text='<%# Bind("ActEngRelDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><b>Programmer 2: </b></td>
                    <td><asp:DropDownList ID="ddlProg2" runat="server" DataSourceID="ddlEmpCADProgSQL" Enabled="false"
                            DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Prog2EmpID") %>' AppendDataBoundItems="true">
                        <asp:ListItem Text="<--Select Employee-->" Value="" />
                        </asp:DropDownList></td>
                    <td><b>Ship Date: </b></td>
                    <td><asp:Label ID="lblProjShipDate" runat="server"  Text='<%# Bind("ActProjShipDate", "{0:MM/dd/yyyy}") %>' /></td>
                </tr>
            </table>
            <table border="0">
                <tr>
                    <td><b>Programming Source: </b></td>
                    <td>
                        <asp:DropDownList ID="ddlProgSourceView" runat="server" AutoPostBack="True" DataSourceID="ddlBFProgSourceSQL" Enabled="false"
                            DataTextField="ProgSourceDesc" DataValueField="ProgSourceID" SelectedValue='<%# Bind("ProgSourceID") %>' AppendDataBoundItems="true">
                            <asp:ListItem Text="<--Select Source-->" Value="" />
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td><b>Programming Source Path: </b></td>
                    <td><asp:Label ID="lblProgSourcePath" runat="server" Text='<%# Bind("ProgSourcePath") %>' /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="gvBFMatsLabel" runat="server" Text="Materials" Font-Bold="true" />
            <asp:GridView ID="gvBFMats" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" 
                DataKeyNames="MaterialID" DataSourceID="gvBFMatsSQL" OnRowCommand="gvBFMats_RowCommand">
                <EditRowStyle BackColor="LightYellow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ControlStyle-CssClass="NoPrint">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" runat="server" CommandName="FooterInsert" Text="Save" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Manufacturer" SortExpression="MatManufacturerID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true" 
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" AppendDataBoundItems="true"
                                DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID" SelectedValue='<%# Bind("MatManufacturerID") %>' Enabled="False">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thickness" SortExpression="MatThicknessID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID" SelectedValue='<%# Bind("MatThicknessID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Core" SortExpression="MatCoreID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID" SelectedValue='<%# Bind("MatCoreID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Size (HxL)" SortExpression="MatSizeID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID" SelectedValue='<%# Bind("MatSizeID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" SortExpression="MatFinishColor">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtColor" runat="server" Text='<%# Bind("MatFinishColor") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblColor" runat="server" Text='<%# Bind("MatFinishColor") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty" SortExpression="MatQty">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="NumBox" Text='<%# Bind("MatQty") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Bind("MatQty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pre/Post" SortExpression="MatFinishPrePostID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID" SelectedValue='<%# Bind("MatFinishPrePostID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="1">
                        <tr style="background-color: gray;">
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
                            <td><asp:LinkButton ID="lbEmptyInsert" runat="server" CssClass="NoPrint" CommandName="EmptyInsert" Text="Save" /></td>
                            <td><asp:DropDownList ID="ddlMfr" runat="server" AutoPostBack="True" DataSourceID="ddlMatMfrSQL" 
                                    DataTextField="MatManufacturerDesc" DataValueField="MatManufacturerID">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlThickness" runat="server" AutoPostBack="True" DataSourceID="ddlMatThicknessSQL" AppendDataBoundItems="true"
                                DataTextField="MatThickness" DataValueField="MatThicknessID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCore" runat="server" AutoPostBack="True" DataSourceID="ddlMatCoreSQL" AppendDataBoundItems="true"
                                DataTextField="MatCore" DataValueField="MatCoreID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="True" DataSourceID="ddlMatSizeSQL" AppendDataBoundItems="true"
                                DataTextField="MatSizeHxL" DataValueField="MatSizeID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtColor" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQty" runat="server" CssClass="NumBox"></asp:TextBox>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFinish" runat="server" AutoPostBack="True" DataSourceID="ddlMatFinishSQL" AppendDataBoundItems="true"
                                DataTextField="MatFinishPrePostDesc" DataValueField="MatFinishPrePostID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>
            <table border="0">
                <tr>
                    <td><b>Brake Metal: </b></td>
                    <td><asp:CheckBox ID="chkBrakeMetal" runat="server" Checked='<%# Bind("SupportBrakeMetal") %>' Enabled="false" /></td>
                    <td><b>Extrusions: </b></td>
                    <td><asp:CheckBox ID="chkExtrusions" runat="server" Checked='<%# Bind("SupportExtrusions") %>' Enabled="false" /></td>
                    <td><b>Fasteners: </b></td>
                    <td><asp:CheckBox ID="chkFasteners" runat="server" Checked='<%# Bind("SupportFasteners") %>' Enabled="false" /></td>
                    <td><b>Filler Strips: </b></td>
                    <td><asp:CheckBox ID="chkFillerStrips" runat="server" Checked='<%# Bind("SupportFillerStrips") %>' Enabled="false" /></td>
                    <td><b>Stiffeners: </b></td>
                    <td><asp:CheckBox ID="chkStiffeners" runat="server" Checked='<%# Bind("SupportStiffeners") %>' Enabled="false" /></td>
                    <td><b>Gasket: </b></td>
                    <td><asp:CheckBox ID="chkGaskets" runat="server" Checked='<%# Bind("SupportGasket") %>' Enabled="false" /></td>
                    <td><b>Snap Covers: </b></td>
                    <td><asp:CheckBox ID="chkSnapCovers" runat="server" Checked='<%# Bind("SupportSnapCovers") %>' Enabled="false" /></td>
                </tr>
                <tr>
                    <td><b>Other: </b></td>
                    <td colspan="13"><asp:Label ID="lblOther" runat="server" Text='<%# Bind("SupportOther") %>' /></td>
                </tr>
            </table>
            <br />
            <asp:Label ID="gvBFProdLabel" runat="server" Text="Production" Font-Bold="true"/>
            <asp:GridView ID="gvBFProd" runat="server" ShowFooter="True" FooterStyle-CssClass="NoPrint" AutoGenerateColumns="False" 
                DataKeyNames="BFProdID" DataSourceID="gvBFProdSQL" OnRowCommand="gvBFProd_RowCommand">
                <EditRowStyle BackColor="LightYellow" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ControlStyle-CssClass="NoPrint">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lbInsert" runat="server" CommandName="FooterInsert" Text="Save"  />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Series" SortExpression="SeriesID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID">
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" Enabled="false" AppendDataBoundItems="true"
                                DataTextField="Description" DataValueField="SeriesID" SelectedValue='<%# Bind("SeriesID") %>'>
                                <asp:ListItem Text="<--Select-->" Value="" />
                            </asp:DropDownList>
                        </ItemTemplate>
                        <FooterStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspFlat Panels" SortExpression="NumFlatPanels" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumFlatPanels") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFlatPanels" runat="server" Text='<%# Bind("NumFlatPanels") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspGluers" SortExpression="NumACMWelders" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumACMWelders") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblGluers" runat="server" Text='<%# Bind("NumACMWelders") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspRadius Panels" SortExpression="NumRadPanels" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumRadPanels") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRadiusPanels" runat="server" Text='<%# Bind("NumRadPanels") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspRadius Gluers" SortExpression="NumAlumWelders" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox" Text='<%# Bind("NumAlumWelders") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRadiusGLuers" runat="server" Text='<%# Bind("NumAlumWelders") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Other Description" SortExpression="OtherDesc">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtOtherDesc" runat="server" ></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblOtherDesc" runat="server" Text='<%# Bind("OtherDesc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#&nbspOther" SortExpression="NumOther" HeaderStyle-CssClass="NumBox">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox" Text='<%# Bind("NumOther") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNumOther" runat="server" Text='<%# Bind("NumOther") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <table border="1">
                        <tr style="background-color:gray">
                            <th></th>
                            <th>Series</th>
                            <th>#&nbspFlat Panels</th>
                            <th>#&nbspGluers</th>
                            <th>#&nbspRadius Panels</th>
                            <th>#&nbspRadius Gluers</th>
                            <th>Other Description</th>
                            <th>#&nbspOther</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnProdEmpty" runat="server" CssClass="NoPrint" CommandName="EmptyInsert" Text="Save" />
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSeries" runat="server" AutoPostBack="True" DataSourceID="ddlBFSeriesSQL" AppendDataBoundItems="true"
                                    DataTextField="Description" DataValueField="SeriesID">
                                    <asp:ListItem Text="<--Select-->" Value="" />
                                </asp:DropDownList>
                            </td>
                            <td><asp:TextBox ID="txtFlatPanels" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtGluers" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtRadiusPanels" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtRadiusGluers" runat="server" CssClass="NumBox"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtOtherDesc" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="txtNumOther" runat="server" CssClass="NumBox"></asp:TextBox></td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
            </asp:GridView>   
            
            <table border="0">
                <tr>
                    <td><b>Programming Complete: </b></td>
                    <td><asp:CheckBox ID="chkProgComplete" runat="server" Checked='<%# Bind("ProgrammingComplete") %>' Enabled="false" /></td>
                    <td><b>Production Complete: </b></td>
                    <td><asp:CheckBox ID="chkProdComplete" runat="server" Checked='<%# Bind("ProductionComplete") %>' Enabled="false" /></td>
                    <td><b>Typical Extrusions: </b></td>
                    <td><asp:CheckBox ID="chkExtrusionTypical" runat="server" Checked='<%# Bind("ExtrusionTypical") %>' Enabled="false" /></td>
                    <td><b>Non-Typical Extrusions: </b></td>
                    <td><asp:CheckBox ID="chkExtrusionNonTypical" runat="server" Checked='<%# Bind("ExtrusionNonTypical") %>' Enabled="false" /></td>
                </tr>
            </table>
            <br />
            <table border="0">
                <tr>
                    <td><b>Notes: </b></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblNotes" runat="server" BorderStyle="Solid" BorderWidth="1"
                Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine,"<br />") %>' /></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="EditButton" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:Button ID="DeleteButton" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="FakeDelete" Text="Delete" />
            &nbsp;<asp:Button ID="NewButton" runat="server" CssClass="NoPrint" CausesValidation="False" CommandName="New" Text="New" />
            &nbsp;<asp:Button ID="EmailButton" runat="server" CssClass="NoPrint" CausesValidation="false" CommandName="Email" Text="Email" />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="Gainsboro" ForeColor="Black" />
    </asp:FormView>
           
    
            
    <asp:SqlDataSource ID="gvBFMatsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        DeleteCommand="DELETE FROM [tblBookingFormMats] WHERE [MaterialID] = @MaterialID" 
        InsertCommand="INSERT INTO [tblBookingFormMats] ( [BookingFormID], [MatManufacturerID], [MatThicknessID], [MatCoreID], [MatSizeID], [MatFinishColor], [MatQty], [MatFinishPrePostID], [MatNumExtraSheets]) 
            VALUES ( @BookingFormID, @MatManufacturerID, @MatThicknessID, @MatCoreID, @MatSizeID, @MatFinishColor, @MatQty, @MatFinishPrePostID, @MatNumExtraSheets)" 
        SelectCommand="SELECT [MaterialID], [BookingFormID], [MatNumber], [MatManufacturerID], [MatThicknessID], [MatCoreID], [MatSizeID], [MatFinishColor], [MatQty], [MatFinishPrePostID], [MatNumExtraSheets] 
        FROM [tblBookingFormMats] 
        WHERE ([BookingFormID] = @BFID)" 
        UpdateCommand="UPDATE [tblBookingFormMats] SET  [MatNumber] = @MatNumber, [MatManufacturerID] = @MatManufacturerID, [MatThicknessID] = @MatThicknessID, [MatCoreID] = @MatCoreID, 
        [MatSizeID] = @MatSizeID, [MatFinishColor] = @MatFinishColor, [MatQty] = @MatQty, [MatFinishPrePostID] = @MatFinishPrePostID, [MatNumExtraSheets] = @MatNumExtraSheets 
        WHERE [MaterialID] = @MaterialID">
        <DeleteParameters>
            <asp:Parameter Name="MaterialID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MatManufacturerID" Type="Int32" />
            <asp:Parameter Name="MatThicknessID" Type="Int32" />
            <asp:Parameter Name="MatCoreID" Type="Int32" />
            <asp:Parameter Name="MatSizeID" Type="Int32" />
            <asp:Parameter Name="MatFinishColor" Type="String" />
            <asp:Parameter Name="MatQty" Type="Int32" />
            <asp:Parameter Name="MatFinishPrePostID" Type="Int32" />
            <asp:Parameter Name="MatNumExtraSheets" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <%-- <asp:QueryStringParameter Name="BookingFormID" Type="Int32" QueryStringField="BFID" /> --%>
            <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MatNumber" Type="Int32" />
            <asp:Parameter Name="MatManufacturerID" Type="Int32" />
            <asp:Parameter Name="MatThicknessID" Type="Int32" />
            <asp:Parameter Name="MatCoreID" Type="Int32" />
            <asp:Parameter Name="MatSizeID" Type="Int32" />
            <asp:Parameter Name="MatFinishColor" Type="String" />
            <asp:Parameter Name="MatQty" Type="Int32" />
            <asp:Parameter Name="MatFinishPrePostID" Type="Int32" />
            <asp:Parameter Name="MatNumExtraSheets" Type="Int32" />
            <asp:Parameter Name="MaterialID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
 
    <asp:SqlDataSource ID="gvBFProdSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [BFProdID], [BFID], [SeriesID], [NumACMWelders], [NumAlumWelders], [NumFlatPanels], [NumRadPanels], [OtherDesc], [NumOther] 
            FROM [tblBookingFormProd] WHERE ([BFID] = @BFID) ORDER BY [BFProdID]" 
        DeleteCommand="DELETE FROM [tblBookingFormProd] WHERE [BFProdID] = @BFProdID" 
        InsertCommand="INSERT INTO [tblBookingFormProd] ( [BFID], [SeriesID], [NumACMWelders], [NumAlumWelders], [NumFlatPanels], [NumRadPanels], [OtherDesc], [NumOther]) 
            VALUES ( @BFID, @SeriesID, @NumACMWelders, @NumAlumWelders, @NumFlatPanels, @NumRadPanels, @OtherDesc, @NumOther)" 
        UpdateCommand="UPDATE [tblBookingFormProd] SET  [SeriesID] = @SeriesID, [NumACMWelders] = @NumACMWelders, [NumAlumWelders] = @NumAlumWelders, 
            [NumFlatPanels] = @NumFlatPanels, [NumRadPanels] = @NumRadPanels, [OtherDesc] = @OtherDesc, [NumOther] = @NumOther WHERE [BFProdID] = @BFProdID">
        <DeleteParameters>
            <asp:Parameter Name="BFProdID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BFID" Type="Int32" />
            <asp:Parameter Name="SeriesID" Type="Int32" />
            <asp:Parameter Name="NumACMWelders" Type="Int32" />
            <asp:Parameter Name="NumAlumWelders" Type="Int32" />
            <asp:Parameter Name="NumFlatPanels" Type="Int32" />
            <asp:Parameter Name="NumRadPanels" Type="Int32" />
            <asp:Parameter Name="OtherDesc" Type="String" />
            <asp:Parameter Name="NumOther" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <%-- <asp:QueryStringParameter Name="BFID" Type="Int32" QueryStringField="BFID" /> --%>
            <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SeriesID" Type="Int32" />
            <asp:Parameter Name="NumACMWelders" Type="Int32" />
            <asp:Parameter Name="NumAlumWelders" Type="Int32" />
            <asp:Parameter Name="NumFlatPanels" Type="Int32" />
            <asp:Parameter Name="NumRadPanels" Type="Int32" />
            <asp:Parameter Name="OtherDesc" Type="String" />
            <asp:Parameter Name="NumOther" Type="Int32" />
            <asp:Parameter Name="BFProdID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlBFProgSourceSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [ProgSourceID], [ProgSourceDesc] FROM [tblProgSource] ORDER BY [ProgSourceDesc]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="fvBookingFormSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        DeleteCommand="DELETE FROM [tblBookingForm] WHERE [BookingFormID] = @BFID" 
        InsertCommand="INSERT INTO tblBookingForm(ProjectID, ReleaseNum, ProgSourceID, ReleaseDesc, SystemTypeID, DateDimsApproved, ActEngRelDate, ActProjShipDate, 
            NumPanelsThisRelease, ProgSourcePath, ExtrusionTypical, ExtrusionNonTypical, SupportBrakeMetal, SupportExtrusions, SupportFasteners, CreatedBy, 
            ReleasedByPM, SupportFillerStrips, SupportStiffeners, SupportGasket, SupportSnapCovers, SupportOther, Notes, ProductionComplete, ProgrammingComplete, 
            ToProgDate, ModelByEmpID, DesignByEmpID, ProgramByEmpID, Design2EmpID, Prog2EmpID) 
            VALUES (@ProjectID, @ReleaseNum, @ProgSourceID, @ReleaseDesc, @DateDimsApproved, @ActEngRelDate, @ActProjShipDate, 
            @NumPanelsThisRelease, @ProgSourcePath, @ExtrusionTypical, @ExtrusionNonTypical, @SupportBrakeMetal, @SupportExtrusions, @SupportFasteners, @CreatedBy, 
            @ReleasedByPM, @SupportFillerStrips, @SupportStiffeners, @SupportGasket, @SupportSnapCovers, @SupportOther, @Notes, @ProductionComplete, @ProgrammingComplete,
            @ToProgDate,@ModelByEmpID,@DesignByEmpID,@ProgramByEmpID,@Design2EmpID,@Prog2EmpID)" 
        SelectCommand="SELECT bf.BookingFormID, bf.ProjectID, bf.ReleaseNum, bf.ReleaseDesc, bf.DateDimsApproved, bf.ActEngRelDate, bf.ActProjShipDate, bf.NumPanelsThisRelease, 
            bf.ProgSourcePath, bf.ExtrusionTypical, bf.ExtrusionNonTypical, bf.SupportBrakeMetal, bf.SupportExtrusions, bf.SupportFasteners, bf.CreatedBy, bf.ReleasedByPM, 
            bf.SupportFillerStrips, bf.SupportStiffeners, bf.SupportGasket, bf.SupportSnapCovers, bf.SupportOther, bf.Notes, bf.ProductionComplete, bf.ProgrammingComplete, 
            bf.ProgSourceID, p.ProjectName, c.Company AS Customer, emp.Name AS PM, bf.ToProgDate, bf.ModelByEmpID, bf.DesignByEmpID, bf.ProgramByEmpID, bf.Design2EmpID, bf.Prog2EmpID 
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
            WHERE BookingFormID = @BFID">
        <DeleteParameters>
            <asp:Parameter Name="BFID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProjectID" Type="Int32" />
            <asp:Parameter Name="ReleaseNum" Type="Int32" />
            <asp:Parameter Name="ProgSourceID" Type="Int32" />
            <asp:Parameter Name="ReleaseDesc" Type="String" />
            <asp:Parameter Name="DateDimsApproved" Type="DateTime" />
            <asp:Parameter Name="ActEngRelDate" Type="DateTime" />
            <asp:Parameter Name="ActProjShipDate" Type="DateTime" />
            <asp:Parameter Name="NumPanelsThisRelease" Type="Int32" />
            <asp:Parameter Name="ProgSourcePath" Type="String" />
            <asp:Parameter Name="ExtrusionTypical" Type="Boolean" />
            <asp:Parameter Name="ExtrusionNonTypical" Type="Boolean" />
            <asp:Parameter Name="SupportBrakeMetal" Type="Boolean" />
            <asp:Parameter Name="SupportExtrusions" Type="Boolean" />
            <asp:Parameter Name="SupportFasteners" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ReleasedByPM" Type="Boolean" />
            <asp:Parameter Name="SupportFillerStrips" Type="Boolean" />
            <asp:Parameter Name="SupportStiffeners" Type="Boolean" />
            <asp:Parameter Name="SupportGasket" Type="Boolean" />
            <asp:Parameter Name="SupportSnapCovers" Type="Boolean" />
            <asp:Parameter Name="SupportOther" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ProductionComplete" Type="Boolean" />
            <asp:Parameter Name="ProgrammingComplete" Type="Boolean" />
            <asp:Parameter Name="ToProgDate" Type="DateTime" />
            <asp:Parameter Name="ModelByEmpID" Type="Int32" />
            <asp:Parameter Name="DesignByEmpID" Type="Int32" />
            <asp:Parameter Name="ProgramByEmpID" Type="Int32" />
            <asp:Parameter Name="Design2EmpID" Type="Int32" />
            <asp:Parameter Name="Prog2EmpID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReleaseNum" Type="Int32" />
            <asp:Parameter Name="ProgSourceID" Type="Int32" />
            <asp:Parameter Name="ReleaseDesc" Type="String" />
            <asp:Parameter Name="SystemTypeID" Type="Int32" />
            <asp:Parameter Name="DateDimsApproved" Type="DateTime" />
            <asp:Parameter Name="ActEngRelDate" Type="DateTime" />
            <asp:Parameter Name="ActProjShipDate" Type="DateTime" />
            <asp:Parameter Name="NumPanelsThisRelease" Type="Int32" />
            <asp:Parameter Name="ProgSourcePath" Type="String" />
            <asp:Parameter Name="ExtrusionTypical" Type="Boolean" />
            <asp:Parameter Name="ExtrusionNonTypical" Type="Boolean" />
            <asp:Parameter Name="SupportBrakeMetal" Type="Boolean" />
            <asp:Parameter Name="SupportExtrusions" Type="Boolean" />
            <asp:Parameter Name="SupportFasteners" Type="Boolean" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="ReleasedByPM" Type="Boolean" />
            <asp:Parameter Name="SupportFillerStrips" Type="Boolean" />
            <asp:Parameter Name="SupportStiffeners" Type="Boolean" />
            <asp:Parameter Name="SupportGasket" Type="Boolean" />
            <asp:Parameter Name="SupportSnapCovers" Type="Boolean" />
            <asp:Parameter Name="SupportOther" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="ProductionComplete" Type="Boolean" />
            <asp:Parameter Name="ProgrammingComplete" Type="Boolean" />
            <asp:Parameter Name="ToProgDate" Type="DateTime" />
            <asp:Parameter Name="ModelByEmpID" Type="Int32" />
            <asp:Parameter Name="DesignByEmpID" Type="Int32" />
            <asp:Parameter Name="ProgramByEmpID" Type="Int32" />
            <asp:Parameter Name="Design2EmpID" Type="Int32" />
            <asp:Parameter Name="Prog2EmpID" Type="Int32" />
            <asp:RouteParameter Name="BFID" Type="Int32" RouteKey="BFID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlBFSeriesSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [SeriesID], [Description] FROM [tblSeries] ORDER BY [Description]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlMatCoreSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [MatCoreID], [MatCore] FROM [tblMatCore] ORDER BY [MatCore]">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlMatFinishSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [MatFinishPrePostID], [MatFinishPrePostDesc] FROM [tblMatFinishPrePost] ORDER BY [MatFinishPrePostID]">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlMatMfrSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [MatManufacturerID], [MatManufacturerDesc] FROM [tblMatManufacturer] ORDER BY [MatManufacturerDesc]">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlMatSizeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [MatSizeID], [MatSizeHxL] FROM [tblMatSize] ORDER BY [MatSizeHxL]">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlMatThicknessSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT [MatThicknessID], [MatThickness] FROM [tblMatThickness] ORDER BY [MatThickness]">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ddlEmpCADProgSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT DISTINCT e.EmployeeID, e.Name FROM tblEmployee AS e INNER JOIN tblEmployeeRole AS er ON e.EmployeeID = er.EmployeeID 
            LEFT OUTER JOIN tblEmployeeType AS et ON er.EmployeeTypeID = et.EmployeeTypeID 
            WHERE (et.Description = 'CAD') OR (et.Description = 'Programmer') ORDER BY e.Name">
    </asp:SqlDataSource>
</asp:Content>
