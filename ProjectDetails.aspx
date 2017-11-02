<%@ Page Title="Project" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="ProjectLogic.ProjectDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
		function plusminus(input) {
			var displayIcon = "img" + input;
			if ($("#" + displayIcon).attr("src") == "../images/plus.png")
			{
				$("#" + displayIcon).closest("tr")
				.after("<tr><td></td><td colspan = '100%'>" + $("#" + input)
				.html() + "</td></tr>");
				$("#" + displayIcon).attr("src", "../images/minus.png");
			} else
			{
				$("#" + displayIcon).closest("tr").next().remove();
				$("#" + displayIcon).attr("src", "../images/plus.png");
			}
		}
	</script>
	<asp:FormView ID="fvHeader" runat="server" CellPadding="4" DataKeyNames="ProjectID" DataSourceID="fvHeaderSQL">
		<ItemTemplate>
			<h1><asp:Label ID="lblProjectID" runat="server" Text='<%# Eval("ProjectID") %>' /> - <asp:Label ID="lblProjectName" runat="server" Text='<%# Eval("ProjectName") %>' /></h1>
		</ItemTemplate>   
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
	</asp:FormView>   
	<asp:Menu ID="mnuProject" runat="server" Orientation="Horizontal"  OnMenuItemClick="mnuProject_MenuItemClick" EnableViewState="false">
		<StaticMenuStyle CssClass="MenuStyle" />
		<StaticMenuItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
		<StaticSelectedStyle BackColor="Silver" />
		<Items>
			<asp:MenuItem Text="_General_" Value="0" />
			<asp:MenuItem Text="_Scope_" Value="1" />
			<asp:MenuItem Text="_CAD_" Value="2" />
			<asp:MenuItem Text="_Scan_" Value="11" />
			<asp:MenuItem Text="_PM_" Value="3" />  
			<asp:MenuItem Text="_Submittals_" Value="4" />
			<asp:MenuItem Text="Change&nbspOrders" Value="5" />
			<asp:MenuItem Text="_Timecards_" Value="6" />
			<asp:MenuItem Text="_Docs_" Value="7" />
			<asp:MenuItem Text="_Log_" Value="8" />
			<asp:MenuItem Text="_Financials_" Value="9" />
			<asp:MenuItem Text="_Tasks_" Value="10" />
			
		</Items>
	</asp:Menu>
	<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
		<asp:View ID="General" runat="server">
			<asp:FormView ID="fvGeneral" runat="server" CellPadding="4" DataKeyNames="ProjectID" DataSourceID="fvGeneralSQL" OnItemCommand="fvGeneral_ItemCommand">
				<ItemTemplate>
					<div id="wrapper">
						<div id="lside">
							<table border="1">
								<tr>
									<td>Address: </td>
									<td colspan="4"><asp:Label ID="lblProjectAddress" runat="server" Text='<%# Bind("ProjectAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip: </td>
									<td><asp:Label ID="lblProjectCity" runat="server" Text='<%# Bind("ProjectCity") %>' /></td>
									<td><asp:Label ID="lblProjectState" runat="server" Text='<%# Bind("ProjectState") %>' /></td>
									<td><asp:Label ID="lblProjectZip" runat="server" Text='<%# Bind("ProjectZip") %>' /></td>
									<td></td>
								</tr>
								<tr>
									<td>PM: </td>
									<td colspan="4"><asp:Label ID="Label7" runat="server" Text='<%# Bind("PM") %>' /></td>
								</tr>
								<tr>
									<td>Series: </td>
									<td colspan="4"><asp:Label ID="Label8" runat="server" Text='<%# Bind("Series") %>' /></td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkMultSeries" runat="server" Checked='<%# Eval("MultipleSeries") %>' /></td>
									<td colspan="4">Multiple Series project</td>
								</tr>
								<tr>
									<td>Job Type: </td>
									<td colspan="4"><asp:DropDownList ID="ddlJobType" runat="server" AutoPostBack="True"
											DataSourceID="ddlJobTypeSQL" DataTextField="JobTypeDescription" DataValueField="JobTypeID"
											SelectedValue='<%# Bind("JobTypeID") %>' />
									</td>
								</tr>
								<tr>
									<td>Status: </td>
									<td><asp:DropDownList ID="ddlProjectStatus" runat="server" AutoPostBack="True"
											DataSourceID="ddlProjStatusSQL" DataTextField="Description" DataValueField="ProjectStatusID"
											SelectedValue='<%# Bind("ProjectStatusID") %>' />
									</td>
									<td colspan="2">Date:</td>
									<td><asp:Label ID="lblStatusDate" runat="server" Text='<%# Eval("DateStatus", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>PO #: </td>
									<td colspan="4"><asp:Label ID="lblCustomerPO" runat="server" Text='<%# Eval("CustomerPO") %>' /></td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkWarrantyInfo" runat="server" Checked='<%# Eval("WarrantyInfo") %>' /></td>
									<td colspan="4">Warranty Info Requested</td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkCreditApproved" runat="server" Checked='<%# Eval("CreditApproved") %>' /></td>
									<td colspan="4">Credit Approved</td>
								</tr>
								<tr>
									<td>App Sent: </td>
									<td><asp:Label ID="lblAppSent" runat="server" Text='<%# Eval("DateCreditAppSent", "{0:MM/dd/yyyy}") %>' /></td>
									<td colspan="2">App Recd: </td>
									<td><asp:Label ID="lblAppRecd" runat="server" Text='<%# Eval("DateCreditAppRecd", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Preferred Billing: </td>
									<td><asp:DropDownList ID="ddlPreferredBilling" runat="server" AutoPostBack="true" Enabled="false"
										DataSourceID="ddlPreferredBillingSQL" DataValueField="PreferredBilling" DataTextField="PreferredBilling"
										SelectedValue='<%# Bind("PreferredBilling") %>' /></td>
									<td colspan="2"># Shop Drawings</td>
									<td><asp:Label ID="lblNumShopDwgs" runat="server" Text='<%# Eval("NumShopDrawings") %>' /> </td>
								</tr>
								<tr>
									<td>Owner Name: </td>
									<td colspan="4"><asp:Label ID="lblOwnerName" runat="server" Text='<%# Eval("OwnerName") %>' /></td>
								</tr>
								<tr>
									<td>Owner Address: </td>
									<td colspan="4"><asp:Label ID="lblOwnerAddress" runat="server" Text='<%# Eval("OwnerAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip:</td>
									<td><asp:Label ID="lblOwnerCity" runat="server" Text='<%# Eval("OwnerCity") %>' /></td>
									<td><asp:Label ID="lblOwnerState" runat="server" Text='<%# Eval("OwnerState") %>' /></td>
									<td><asp:Label ID="lblOwnerZip" runat="server" Text='<%# Eval("OwnerZip") %>' /></td>
									<td></td>
								</tr>
								<tr>
									<td>Deliv Date/Notes: </td>
									<td><asp:Label ID="lblDateDelivery" runat="server" Text='<%# Eval("DateDelivery", "{0:MM/dd/yyyy}") %>' /></td>
									<td colspan="3"><asp:Label ID="lblDeliveryNotes" runat="server" Text='<%# Eval("DeliveryNotes") %>' /></td>
								</tr>
								<tr>
									<td>Delivery Address:</td>
									<td colspan="4"><asp:Label ID="lblDeliveryAddress" runat="server" Text='<%# Eval("DeliveryAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip: </td>
									<td><asp:Label ID="lblDeliveryCity" runat="server" Text='<%# Eval("DeliveryCity") %>' /></td>
									<td><asp:Label ID="lblDeliveryState" runat="server" Text='<%# Eval("DeliveryState") %>' /></td>
									<td><asp:Label ID="lblDeliveryZip" runat="server" Text='<%# Eval("DeliveryZip") %>' /></td>
									<td></td>
								</tr>
							</table>
						</div> <!-- end div left -->
						<div id="rside">
							<table border="1">
								<tr>
									<td>Customer:</td>
									<td colspan="3"><asp:Label ID="CustomerLabel" runat="server" Text='<%# Bind("Customer") %>' /></td>
								</tr>
								<tr>
									<td>Contact:</td>
									<td colspan="3"><asp:Label ID="CustContactLabel" runat="server" Text='<%# Bind("CustContact") %>' /></td>
								</tr>
								<tr>
									<td>Address 1:</td>
									<td colspan="3"><asp:Label ID="CustAddr1Label" runat="server" Text='<%# Bind("CustAddr1") %>' /></td>
								</tr>
								<tr>
									<td>Address 2:</td>
									<td colspan="3"><asp:Label ID="CustAddr2Label" runat="server" Text='<%# Bind("CustAddr2") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip:</td>
									<td><asp:Label ID="CustCityLabel" runat="server" Text='<%# Bind("CustCity") %>' /></td>
									<td><asp:Label ID="CustStateLabel" runat="server" Text='<%# Bind("CustState") %>' /></td>
									<td><asp:Label ID="CustZipLabel" runat="server" Text='<%# Bind("CustZip") %>' /></td>
								</tr>
							</table>
							<asp:LinkButton ID="lbEditCust" runat="server" CausesValidation="true" CssClass="NoPrint" CommandName="EditCust" Text="Edit Customer" />
							<br />
							<asp:Label ID="lblNotes1" runat="server" Text="Notes:" />
							<br />
							<asp:Label ID="lblNotes2" runat="server" BorderStyle="Solid" BorderWidth="1"
								Text='<%# Eval("Notes").ToString().Replace(Environment.NewLine,"<br />") %>' />
						</div> <!-- end div right -->
					</div> <!-- end div wrapper -->
				<asp:Button ID="EditButton" runat="server" CausesValidation="True" CssClass="NoPrint" CommandName="Edit" Text="Edit" />
				</ItemTemplate>

				<EditItemTemplate>
					<div id="wrapper">
						<div id="lside">
							<table border="1">
								<tr>
									<td>Address: </td>
									<td colspan="4"><asp:TextBox ID="txtProjectAddress" runat="server" CssClass="LongBox" Text='<%# Bind("ProjectAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip: </td>
									<td><asp:TextBox ID="txtProjectCity" runat="server" CssClass="DateBox" Text='<%# Bind("ProjectCity") %>' /></td>
									<td><asp:TextBox ID="txtProjectState" runat="server" CssClass="NumBox" Text='<%# Bind("ProjectState") %>' /></td>
									<td><asp:TextBox ID="txtProjectZip" runat="server" CssClass="DateBox" Text='<%# Bind("ProjectZip") %>' /></td>
									<td></td>
								</tr>
								<tr>
									<td>PM: </td>
									<td colspan="4">
										<asp:DropDownList ID="ddlPM" runat="server" AutoPostBack="True" AppendDataBoundItems="true"
											DataSourceID="ddlPMEmployeeSQL" DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("PMEmpID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Series: </td>
									<td colspan="4">
										<asp:DropDownList ID="ddlSeries" runat="server" DataSourceID="ddlSeriesSQL" DataTextField="Description" DataValueField="SeriesID" 
											SelectedValue='<%# Bind("SeriesID") %>'>
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkMultSeries" runat="server" Checked='<%# Bind("MultipleSeries") %>' /></td>
									<td colspan="4">Multiple Series project</td>
								</tr>
								<tr>
									<td>Job Type: </td>
									<td colspan="4"><asp:DropDownList ID="ddlJobType" runat="server" AutoPostBack="True"
											DataSourceID="ddlJobTypeSQL" DataTextField="JobTypeDescription" DataValueField="JobTypeID"
											SelectedValue='<%# Bind("JobTypeID") %>' />
									</td>
								</tr>
								<tr>
									<td>Status: </td>
									<td><asp:DropDownList ID="ddlProjectStatus" runat="server" AutoPostBack="True" DataSourceID="ddlProjStatusSQL" 
											DataTextField="Description" DataValueField="ProjectStatusID" SelectedValue='<%# Bind("ProjectStatusID") %>' /></td>
									
									<td colspan="2">Date:</td>
									<td><asp:TextBox ID="txtStatusDate" runat="server" CssClass="DateBox" Text='<%# Bind("DateStatus", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>PO #: </td>
									<td colspan="4"><asp:TextBox ID="txtCustomerPO" runat="server" CssClass="DateBox" Text='<%# Bind("CustomerPO") %>' /></td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkWarrantyInfo" runat="server" Checked='<%# Bind("WarrantyInfo") %>' /></td>
									<td colspan="4">Warranty Info Requested</td>
								</tr>
								<tr>
									<td style="text-align:right"><asp:CheckBox ID="chkCreditApproved" runat="server" Checked='<%# Bind("CreditApproved") %>' /></td>
									<td colspan="4">Credit Approved</td>
								</tr>
								<tr>
									<td>App Sent: </td>
									<td><asp:TextBox ID="txtAppSent" runat="server" CssClass="DateBox" Text='<%# Bind("DateCreditAppSent", "{0:MM/dd/yyyy}") %>' /></td>
									<td colspan="2">App Recd: </td>
									<td><asp:TextBox ID="txtAppRecd" runat="server" CssClass="DateBox" Text='<%# Bind("DateCreditAppRecd", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Preferred Billing: </td>
									<td><asp:DropDownList ID="ddlPreferredBilling" runat="server" AutoPostBack="true" DataSourceID="ddlPreferredBillingSQL" 
										DataValueField="PreferredBilling" DataTextField="PreferredBilling" SelectedValue='<%# Bind("PreferredBilling") %>' /></td>
									<td colspan="2"># Shop Drawings</td>
									<td><asp:TextBox ID="txtNumShopDwgs" runat="server" CssClass="NumBox" Text='<%# Bind("NumShopDrawings") %>' /> </td>
								</tr>
								<tr>
									<td>Owner Name: </td>
									<td colspan="4"><asp:TextBox ID="txtOwnerName" CssClass="LongBox" runat="server" Text='<%# Bind("OwnerName") %>' /></td>
								</tr>
								<tr>
									<td>Owner Address: </td>
									<td colspan="4"><asp:TextBox ID="txtOwnerAddress" runat="server" CssClass="LongBox" Text='<%# Bind("OwnerAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip:</td>
									<td><asp:TextBox ID="txtOwnerCity" runat="server" CssClass="DateBox" Text='<%# Bind("OwnerCity") %>' /></td>
									<td><asp:TextBox ID="txtOwnerState" runat="server" CssClass="NumBox" Text='<%# Bind("OwnerState") %>' /></td>
									<td><asp:TextBox ID="txtOwnerZip" runat="server" CssClass="DateBox" Text='<%# Bind("OwnerZip") %>' /></td>
									<td></td>
								</tr>
								<tr>
									<td>Deliv Date/Notes: </td>
									<td><asp:TextBox ID="txtDateDelivery" runat="server" CssClass="DateBox" Text='<%# Bind("DateDelivery", "{0:MM/dd/yyyy}") %>' /></td>
									<td colspan="3"><asp:TextBox ID="txtDeliveryNotes" runat="server" Text='<%# Bind("DeliveryNotes") %>' /></td>
								</tr>
								<tr>
									<td>Delivery Address:</td>
									<td colspan="4"><asp:TextBox ID="txtDeliveryAddress" runat="server" CssClass="LongBox" Text='<%# Bind("DeliveryAddress") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip: </td>
									<td><asp:TextBox ID="txtDeliveryCity" runat="server" CssClass="DateBox" Text='<%# Bind("DeliveryCity") %>' /></td>
									<td><asp:TextBox ID="txtDeliveryState" runat="server" CssClass="NumBox" Text='<%# Bind("DeliveryState") %>' /></td>
									<td><asp:TextBox ID="txtDeliveryZip" runat="server" CssClass="DateBox" Text='<%# Bind("DeliveryZip") %>' /></td>
									<td></td>
								</tr>
							</table>
						</div> <!-- end div left -->
						<div id="rside">
							<table border="1">
								<tr>
									<td>Customer:</td>
									<td colspan="4"><asp:Label ID="CustomerLabel" runat="server" Text='<%# Bind("Customer") %>' /></td>
								</tr>
								<tr>
									<td>Contact:</td>
									<td colspan="4"><asp:Label ID="CustContactLabel" runat="server" Text='<%# Bind("CustContact") %>' /></td>
								</tr>
								<tr>
									<td>Address 1:</td>
									<td colspan="4"><asp:Label ID="CustAddr1Label" runat="server" Text='<%# Bind("CustAddr1") %>' /></td>
								</tr>
								<tr>
									<td>Address 2:</td>
									<td colspan="4"><asp:Label ID="CustAddr2Label" runat="server" Text='<%# Bind("CustAddr2") %>' /></td>
								</tr>
								<tr>
									<td>City/ST/Zip:</td>
									<td><asp:Label ID="CustCityLabel" runat="server" Text='<%# Bind("CustCity") %>' /></td>
									<td><asp:Label ID="CustStateLabel" runat="server" Text='<%# Bind("CustState") %>' /></td>
									<td><asp:Label ID="CustZipLabel" runat="server" Text='<%# Bind("CustZip") %>' /></td>
								</tr>
							</table>
							<asp:LinkButton ID="lbEditCust" runat="server" CausesValidation="true" CssClass="NoPrint" CommandName="EditCust" Text="Edit Customer" />
							<br />
							<asp:Label ID="lblNotes1" runat="server" Text="Notes:" />
							<br />
							<asp:TextBox ID="txtNotes" runat="server" CssClass="TextArea" TextMode="MultiLine" Rows="5" Text='<%# Bind("Notes") %>' />
						</div> <!-- end div right -->
					</div> <!-- end div wrapper -->
				<asp:Button ID="SaveButton" runat="server" CausesValidation="True" CssClass="NoPrint" CommandName="Save" Text="Save" />
					&nbsp<asp:Button ID="CancelButton" runat="server" CausesValidation="False" CssClass="NoPrint" CommandName="Cancel" Text="Cancel" />
			
				</EditItemTemplate>
			</asp:FormView>
		</asp:View>
		<asp:View ID="Scope" runat="server">
			<asp:FormView ID="fvScope" runat="server" DataKeyNames="ProjectID" DataSourceID="fvScopeSQL" OnItemCommand="fvScope_ItemCommand">
				<ItemTemplate>
					
					<div id="wrapper">
						<div id="lside">
							<table border="1">
								<tr>
									<td>Meeting Date:</td>
									<td><asp:Label ID="lblMeetingDate" runat="server" Text='<%# Bind("Scope_DateMeeting", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Meeting Time:</td>
									<td><asp:Label ID="lblMeetingTime" runat="server" Text='<%# Bind("Scope_TimeMeeting") %>' /></td>
								</tr>
								<tr>
									<td>PM:</td>
									<td>
										<asp:DropDownList ID="ddlPM" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="false" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_PM_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>CA:</td>
									<td>
										<asp:DropDownList ID="ddlCA" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_CA_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Estimator:</td>
									<td>
										<asp:DropDownList ID="ddlEstimator" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_Estimator_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>CAD:</td>
									<td>
										<asp:DropDownList ID="ddlCAD" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_CAD_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Others:</td>
									<td><asp:Label ID="lblOthers" runat="server" Text='<%# Bind("Scope_Others") %>' /></td>
								</tr>
							</table>
						</div><!-- end div left -->
						<div id="rside">
							<table border="1">
								<tr>
									<td>#&nbspPanels:</td>
									<td><asp:Label ID="lblNumPanels" runat="server" Text='<%# Bind("NumPanels") %>' /></td>
								</tr>
								<tr>
									<td>Sq. Footage:</td>
									<td><asp:Label ID="lblPanelSqFt" runat="server" Text='<%# Bind("PanelSqFt") %>' /></td>
								</tr>
								<tr>
									<td>Begin Qtr/Yr:</td>
									<td>
										<asp:DropDownList ID="ddlBeginQtr" runat="server" SelectedValue='<%# Bind("Scope_BeginQtr") %>'>
											<asp:ListItem Text="<--Select-->" Value="" />
											<asp:ListItem>1</asp:ListItem>
											<asp:ListItem>2</asp:ListItem>
											<asp:ListItem>3</asp:ListItem>
											<asp:ListItem>4</asp:ListItem>
										</asp:DropDownList>&nbsp;
										<asp:TextBox ID="txtBeginYear" runat="server" CssClass="NumBox" Text='<%# Eval("Scope_BeginYear") %>' />
									</td>
								</tr>
								<tr>
									<td>End Qtr/Yr:</td>
									<td>
										<asp:DropDownList ID="ddlEndQtr" runat="server" SelectedValue='<%# Bind("Scope_EndQtr") %>'>
											<asp:ListItem Text="<--Select-->" Value="" />
											<asp:ListItem>1</asp:ListItem>
											<asp:ListItem>2</asp:ListItem>
											<asp:ListItem>3</asp:ListItem>
											<asp:ListItem>4</asp:ListItem>
										</asp:DropDownList>&nbsp;
										<asp:TextBox ID="txtEndYear" runat="server" CssClass="NumBox" Text='<%# Eval("Scope_EndYear") %>' />
									</td>
								</tr>
								<tr>
									<td>RSM:</td>
									<td>
										<asp:DropDownList ID="ddlRSM" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_RSM_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Sales Rep:</td>
									<td>
										<asp:DropDownList ID="ddlSalesRep" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_SalesRep_ID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Team Lead:</td>
									<td>
										<asp:DropDownList ID="ddlTeamLead" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_TeamLead_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
							</table>
						</div><!-- end div right -->
					</div><!-- end div wrapper -->
					<table border="1">
						<tr>
							<td>#&nbspShipments:</td>
							<td><asp:TextBox ID="txtNumShipments" runat="server" CssClass="NumBox" Text='<%# Bind("Scope_NumReleases") %>' /></td>
							<td>C/O Releases:</td>
							<td><asp:TextBox ID="txtCOReleases" runat="server" Enabled="False" CssClass="NumBox" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>Release Notes:</td>
							<td><asp:TextBox ID="txtReleaseNotes" runat="server" CssClass="LongBox" Enabled="False" Text='<%# Bind("Scope_ReleaseNotes") %>' /></td>
						</tr>
						<tr>
							<td>Notes:</td>
							<td><asp:TextBox ID="txtShippingNotes" runat="server" CssClass="TextArea" Enabled="False" TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_ShippingNotes") %>' /></td>
						</tr>
						<tr>
							<td>Internal Notes:</td>
							<td><asp:TextBox ID="txtInternalNotes" runat="server" CssClass="TextArea" Enabled="False" TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_InternalNotes") %>' /></td>
						</tr>
						<tr>
							<td>Warranty:</td>
							<td>
								<asp:DropDownList ID="ddlWarranty" runat="server" DataSourceID="ddlWarrantySQL" AppendDataBoundItems="true" Enabled="False"
									DataTextField="Warranty" DataValueField="Warranty" SelectedValue='<%# Bind("Scope_WarrantyStd") %>'>
									<asp:ListItem Text="<--Select Warranty-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>Color Notes:</td>
							<td><asp:TextBox ID="txtColorNotes" runat="server" CssClass="TextArea" Enabled="False" TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_Warranty") %>' /></td>
						</tr>
					</table>
					
					
					<br />
					<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
				</ItemTemplate>
				<EditItemTemplate>
				   <div id="wrapper">
						<div id="lside">
							<table border="1">
								<tr>
									<td>Meeting Date:</td>
									<td><asp:TextBox ID="txtMeetingDate" runat="server" CssClass="DateBox" Text='<%# Bind("Scope_DateMeeting", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Meeting Time:</td>
									<td><asp:TextBox ID="txtMeetingTime" runat="server" CssClass="DateBox" Text='<%# Bind("Scope_TimeMeeting") %>' /></td>
								</tr>
								<tr>
									<td>PM:</td>
									<td>
										<asp:DropDownList ID="ddlPM" runat="server" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_PM_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>CA:</td>
									<td>
										<asp:DropDownList ID="ddlCA" runat="server" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_CA_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Estimator:</td>
									<td>
										<asp:DropDownList ID="ddlEstimator" runat="server" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_Estimator_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>CAD:</td>
									<td>
										<asp:DropDownList ID="ddlCAD" runat="server" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_CAD_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Others:</td>
									<td><asp:TextBox ID="lblOthers" runat="server" Text='<%# Bind("Scope_Others") %>' /></td>
								</tr>
							</table>
						</div><!-- end div left -->
						<div id="rside">
							<table border="1">
								<tr>
									<td>#&nbspPanels:</td>
									<td><asp:TextBox ID="txtNumPanels" runat="server" CssClass="NumBox" Text='<%# Bind("NumPanels") %>' /></td>
								</tr>
								<tr>
									<td>Sq. Footage:</td>
									<td><asp:TextBox ID="txtPanelSqFt" runat="server" CssClass="NumBox" Text='<%# Bind("PanelSqFt") %>' /></td>
								</tr>
								<tr>
									<td>Begin Qtr/Yr:</td>
									<td>
										<asp:DropDownList ID="ddlBeginQtr" runat="server" SelectedValue='<%# Bind("Scope_BeginQtr") %>'>
											<asp:ListItem Text="<--Select-->" Value="" />
											<asp:ListItem>1</asp:ListItem>
											<asp:ListItem>2</asp:ListItem>
											<asp:ListItem>3</asp:ListItem>
											<asp:ListItem>4</asp:ListItem>
										</asp:DropDownList>&nbsp;
										<asp:TextBox ID="txtBeginYear" runat="server" CssClass="NumBox" Text='<%# Bind("Scope_BeginYear") %>' />
									</td>
								</tr>
								<tr>
									<td>End Qtr/Yr:</td>
									<td>
										<asp:DropDownList ID="ddlEndQtr" runat="server" SelectedValue='<%# Bind("Scope_EndQtr") %>'>
											<asp:ListItem Text="<--Select-->" Value="" />
											<asp:ListItem>1</asp:ListItem>
											<asp:ListItem>2</asp:ListItem>
											<asp:ListItem>3</asp:ListItem>
											<asp:ListItem>4</asp:ListItem>
										</asp:DropDownList>&nbsp;
										<asp:TextBox ID="txtEndYear" runat="server" CssClass="NumBox" Text='<%# Bind("Scope_EndYear") %>' />
									</td>
								</tr>
								<tr>
									<td>RSM:</td>
									<td>
										<asp:DropDownList ID="ddlRSM" runat="server" DataSourceID="ddlAllEmployeeSQL"  AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_RSM_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Sales Rep:</td>
									<td>
										<asp:DropDownList ID="ddlSalesRep" runat="server" DataSourceID="ddlAllEmployeeSQL"  AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_SalesRep_ID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>Team Lead:</td>
									<td>
										<asp:DropDownList ID="ddlTeamLead" runat="server" DataSourceID="ddlAllEmployeeSQL"  AppendDataBoundItems="True"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_TeamLead_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
							</table>
						</div><!-- end div right -->
					</div><!-- end div wrapper -->
					<table border="1">
						<tr>
							<td>#&nbspShipments:</td>
							<td><asp:TextBox ID="txtNumShipments" runat="server" CssClass="NumBox" Text='<%# Bind("Scope_NumReleases") %>' /></td>
							<td>C/O Releases:</td>
							<td><asp:TextBox ID="txtCOReleases" runat="server" Enabled="False" CssClass="NumBox" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>Release Notes:</td>
							<td><asp:TextBox ID="txtReleaseNotes" runat="server" CssClass="TextArea"  Text='<%# Bind("Scope_ReleaseNotes") %>' /></td>
						</tr>
						<tr>
							<td>Notes:</td>
							<td><asp:TextBox ID="txtShippingNotes" runat="server" CssClass="TextArea"  TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_ShippingNotes") %>' /></td>
						</tr>
						<tr>
							<td>Internal Notes:</td>
							<td><asp:TextBox ID="txtInternalNotes" runat="server" CssClass="TextArea"  TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_InternalNotes") %>' /></td>
						</tr>
						<tr>
							<td>Warranty:</td>
							<td>
								<asp:DropDownList ID="ddlWarranty" runat="server" DataSourceID="ddlWarrantySQL" AppendDataBoundItems="true" 
									DataTextField="Warranty" DataValueField="Warranty" SelectedValue='<%# Bind("Scope_WarrantyStd") %>'>
									<asp:ListItem Text="<--Select Warranty-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>Color Notes:</td>
							<td><asp:TextBox ID="txtColorNotes" runat="server" CssClass="TextArea" TextMode="MultiLine" Rows="5" Text='<%# Bind("Scope_Warranty") %>' /></td>
						</tr>
					</table>
					<br />
					<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
					&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
				</EditItemTemplate>
			</asp:FormView>
			
		</asp:View>
		<asp:View ID="CAD" runat="server">
			
			<asp:FormView ID="fvCAD" runat="server" DataKeyNames="ProjectID" DataSourceID="fvCADSQL" OnItemCommand="fvCAD_ItemCommand">
				<ItemTemplate>
					<table border="1">
						<tr>
							<td>Project Name:</td>
							<td><asp:Label ID="lblProjectName" runat="server" Text='<%# Bind("ProjectName") %>' /></td>
						</tr>
						<tr>
							<td>CAD Assigned:</td>
							<td>
								<asp:DropDownList ID="ddlCADEmployee" runat="server" DataSourceID="ddlAllEmployeeSQL" Enabled="False" AppendDataBoundItems="true"
									DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("CAD_EmployeeID") %>'>
									<asp:ListItem Text="<--Select Employee-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>CAD Status:</td>
							<td>
								<asp:DropDownList ID="ddlCADStatus" runat="server" DataSourceID="ddlCADStatusSQL" Enabled="False" AppendDataBoundItems="True"
									DataTextField="Description" DataValueField="ProjectCADStatusID">
									<asp:ListItem Text="<--Select-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>CAD #</td>
							<td><asp:Label ID="lblCADNum" runat="server" Text='<%# Bind("CAD_Num") %>' /></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td>Delivery Date:</td>
							<td><asp:Label ID="lblDateDelivery" runat="server" Text='<%# Bind("DateDelivery", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Rec'd:</td>
							<td><asp:Label ID="lblDateRecd" runat="server" Text='<%# Bind("CAD_DateRecd", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Est Send:</td>
							<td><asp:Label ID="lblDateEstSent" runat="server" Text='<%# Bind("CAD_DateEst", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Act Sent:</td>
							<td><asp:Label ID="lblDateActSent" runat="server" Text='<%# Bind("CAD_DateSent", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Handoff:</td>
							<td><asp:Label ID="lblDateHandoff" runat="server" Text='<%# Bind("CAD_DateHandoff", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td>Est Hrs:</td>
							<td><asp:Label ID="lblEstHrs" runat="server" Text='<%# Bind("CAD_EstHours") %>' /></td>
						</tr>
						<tr>
							<td>Act Hrs:</td>
							<td><asp:TextBox ID="txtActHrs" runat="server" CssClass="NumBox" Enabled="False" /></td>
						</tr>
						<tr>
							<td>Remaining Hrs:</td>
							<td><asp:TextBox ID="txtRemainingHrs" runat="server" CssClass="NumBox" Enabled="False" /></td>
						</tr>
						<tr>
							<td># Shop Drawings:</td>
							<td><asp:Label ID="lblNumShops" runat="server" Text='<%# Bind("NumShopDrawings") %>' /></td>
						</tr>
					</table>
					<table border="0">
						<tr>
							<td>Notes:</td>
						</tr>
						<tr>
							<td><asp:TextBox ID="txtNotes" runat="server" CssClass="TextArea" TextMode="Multiline" Rows="5" Text='<%# Eval("CAD_Notes") %>' /></td>
						</tr>
					</table>
					
					<br />
					<asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
				</ItemTemplate>
				<EditItemTemplate>
					<table border="1">
						<tr>
							<td>Project Name:</td>
							<td><asp:Label ID="lblProjectName" runat="server" Text='<%# Bind("ProjectName") %>' /></td>
						</tr>
						<tr>
							<td>CAD Assigned:</td>
							<td>
								<asp:DropDownList ID="ddlCADEmployee" runat="server" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
									DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("CAD_EmployeeID") %>'>
									<asp:ListItem Text="<--Select Employee-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>CAD Status:</td>
							<td>
								<asp:DropDownList ID="ddlCADStatus" runat="server" DataSourceID="ddlCADStatusSQL" AppendDataBoundItems="True"
									DataTextField="Description" DataValueField="ProjectCADStatusID">
									<asp:ListItem Text="<--Select-->" Value="" />
								</asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td>CAD #</td>
							<td><asp:TextBox ID="txtCADNum" runat="server" CssClass="NumBox" Text='<%# Bind("CAD_Num") %>' /></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td>Delivery Date:</td>
							<td><asp:TextBox ID="txtDateDelivery" runat="server" CssClass="DateBox" Text='<%# Bind("DateDelivery", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Rec'd:</td>
							<td><asp:TextBox ID="txtDateRecd" runat="server" CssClass="DateBox" Text='<%# Bind("CAD_DateRecd", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Est Send:</td>
							<td><asp:TextBox ID="txtDateEstSent" runat="server" CssClass="DateBox" Text='<%# Bind("CAD_DateEst", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Act Sent:</td>
							<td><asp:TextBox ID="txtDateActSent" runat="server" CssClass="DateBox" Text='<%# Bind("CAD_DateSent", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
						<tr>
							<td>Date Handoff:</td>
							<td><asp:TextBox ID="txtDateHandoff" runat="server" CssClass="DateBox" Text='<%# Bind("CAD_DateHandoff", "{0:MM/dd/yyyy}") %>' /></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td>Est Hrs:</td>
							<td><asp:TextBox ID="lblEstHrs" runat="server" CssClass="NumBox" Text='<%# Bind("CAD_EstHours") %>' /></td>
						</tr>
						<tr>
							<td>Act Hrs:</td>
							<td><asp:TextBox ID="txtActHrs" runat="server" CssClass="NumBox" Enabled="False" /></td>
						</tr>
						<tr>
							<td>Remaining Hrs:</td>
							<td><asp:TextBox ID="txtRemainingHrs" runat="server" CssClass="NumBox" Enabled="False" /></td>
						</tr>
						<tr>
							<td># Shop Drawings:</td>
							<td><asp:TextBox ID="txtNumShops" runat="server" CssClass="NumBox" Text='<%# Bind("NumShopDrawings") %>' /></td>
						</tr>
					</table>
					<table border="0">
						<tr>
							<td>Notes:</td>
						</tr>
						<tr>
							<td><asp:TextBox ID="txtNotes" runat="server" CssClass="TextArea" TextMode="Multiline" Rows="5" Text='<%# Bind("CAD_Notes") %>' /></td>
						</tr>
					</table>
					<br />
					<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
					&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
				</EditItemTemplate>

			</asp:FormView>
		</asp:View>
		<asp:View ID="PM" runat="server">
			<asp:FormView ID="fvPM" runat="server" CellPadding="4" DataKeyNames="ProjectID" DataSourceID="fvPMSQL" OnItemCommand="fvPM_ItemCommand" OnDataBound="fvPM_DataBound">
				<ItemTemplate>
					<div id="wrapper">
						<div id="lside">
							<table>
								<tr>
									<td>Project Manager:</td>
									<td colspan="2">
										<asp:DropDownList ID="ddlPM" runat="server" AutoPostBack="true" DataSourceID="ddlAllEmPloyeeSQL" Enabled="False"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Scope_PM_EmployeeID") %>'>
										</asp:DropDownList>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>MTO Complete:</td>
									<td><asp:TextBox ID="txtMTOComplete" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("MTO_Complete", "{0:MM/dd/yyyy}") %>' /></td>
									<td>Reviewed By:</td>
									<td>
										<asp:DropDownList ID="ddlReviewedBy" runat="server" AutoPostBack="true" Enabled="False" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("Shops_Reviewed_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
								</tr>
								<tr>
									<td>MTO Assigned To:</td>
									<td>
										<asp:DropDownList ID="ddlMTOAssignedTo" runat="server" AutoPostBack="true" Enabled="False" DataSourceID="ddlAllEmployeeSQL" AppendDataBoundItems="true"
											DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("MTO_Complete_EmployeeID") %>'>
											<asp:ListItem Text="<--Select Employee-->" Value="" />
										</asp:DropDownList>
									</td>
									<td>Shops Reviewed:</td>
									<td><asp:TextBox ID="txtShopsReviewed" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Shops_Reviewed", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Mat'l Approved:</td>
									<td><asp:TextBox ID="txtMatlApproved" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("PM_DateMatlApproved", "{0:MM/dd/yyyy}") %>' /></td>
									<td>Shops Sent:</td>
									<td><asp:TextBox ID="txtShopsSent" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("CAD_DateSent", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Mat'l Ordered:</td>
									<td><asp:TextBox ID="txtMatlOrdered" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("PM_DateMatlOrderComplete", "{0:MM/dd/yyyy}") %>' /></td>
									<td>Shops Received:</td>
									<td><asp:TextBox ID="txtShopsReceived" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Shops_Recd", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>ESD From Vendor:</td>
									<td><asp:TextBox ID="txtESDFromVendor" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("PM_ESD_ShopDrawings", "{0:MM/dd/yyyy}") %>' /></td>
									<td>Shops Resubmitted:</td>
									<td><asp:TextBox ID="txtShopsRevised" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Shops_Revised", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
								<tr>
									<td>Mat'l Received</td>
									<td><asp:TextBox ID="txtMatlRecd" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("PM_DateMatlRecd", "{0:MM/dd/yyyy}") %>' /></td>
									<td>Shops Approved:</td>
									<td><asp:TextBox ID="txtShopsApproved" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("PM_DateShopsApproved", "{0:MM/dd/yyyy}") %>' /></td>
								</tr>
							</table>
						</div> <!-- end div left -->
						<div id="rside">
							<table border="1">
								<tr>
									<td>Bid Panels:</td>
									<td><asp:TextBox ID="txtBidPanels" runat="server" CssClass="DateBox AlignRight" Enabled="false"  /></td>
								</tr>
								<tr>
									<td>Released To Date:</td>
									<td><asp:TextBox ID="txtRelToDate" runat="server" CssClass="DateBox AlignRight" Enabled="False" /></td>
								</tr>
								<tr>
									<td>Panels Remain:</td>
									<td><asp:TextBox ID="txtPanelsRemain" runat="server" CssClass="DateBox AlignRight" Enabled="False" /></td>
								</tr>
							</table>
							<br />
							<table>
								<tr>
									<td><asp:Button ID="btnBaselines" runat="server" CommandName="Baselines" Text="Baselines" /></td>
								</tr>
								<tr>
									<td><asp:Button ID="btnBookingForm" runat="server" CommandName="BookingForm" Text="Booking Form" /></td>
								
									<td><asp:Button ID="btnMatOrder" runat="server" CommandName="MatOrder" Text="Mat Orders" /></td>
								</tr>
							</table>
						</div> <!-- end div right -->
					</div> <!-- end div wrapper -->
				</ItemTemplate>
			</asp:FormView>
			<br />
			Shipments:
			<asp:GridView ID="gvPMShipment" runat="server" AutoGenerateColumns="False" OnRowDataBound="GvPMShipment_RowDataBound" OnDataBound="GvPMShipment_DataBound"
				DataKeyNames="ProjectShipmentID" DataSourceID="gvPMShipmentSQL" AllowPaging="True" PageSize="5">
				<Columns>
					<asp:TemplateField >
						<ItemTemplate>
							<a href="JavaScript:plusminus('div<%# Eval("ProjectShipmentID") %>');">
								<img alt="Shipments" id="imgdiv<%# Eval ("ProjectShipmentID") %>" src="../images/plus.png" />
							</a>
							<div id="div<%# Eval("ProjectShipmentID") %>" style="display:none;">
								<asp:GridView ID="gvPMShipmentSub" runat="server" AutoGenerateColumns="False" DataKeyNames="ShippingID" >
									<Columns>
										<asp:TemplateField HeaderText="Date">
											<ItemTemplate>
												<asp:Label ID="lblDate" runat="server" CssClass="AlignRight" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>' />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Paid By">
											<ItemTemplate>
												<asp:DropDownList ID="ddlPaidBy" runat="server" SelectedValue='<%# Bind("PaidBy") %>'>
													<asp:ListItem Text="<--Select-->" Value="" />
													<asp:ListItem Text="MDSI" Value="M" />
													<asp:ListItem Text="Customer" Value="C" />
												</asp:DropDownList>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Tracking #">
											<ItemTemplate>
												<asp:Label ID="lblTrackingNo" runat="server" Text='<%# Bind("TrackingNo") %>' />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Cost">
											<ItemTemplate>
												<asp:Label ID="lblCost" runat="server" CssClass=" CurrencyBox" Text='<%# Bind("Cost","${0:f2}") %>' />
											</ItemTemplate>
										</asp:TemplateField>
									</Columns>
								</asp:GridView>
							</div>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Shipment #" SortExpression="ShipmentNo">
						<ItemTemplate>
							<a href="/ProjectLogic/ShipmentDetails?PSID=<%# Eval("ProjectShipmentID") %>" target="popup">
							<asp:Label ID="lblShipmentNo" runat="server" Text='<%# Bind("ShipmentNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<ItemTemplate>
							<asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date Req'd" SortExpression="DateRequested">
						<ItemTemplate>
							<asp:Label ID="lblDateReqd" runat="server" CssClass=" AlignRight" Text='<%# Bind("DateRequested", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date Shipped" SortExpression="DateShipped">
						<ItemTemplate>
							<asp:Label ID="lblDateShipped" runat="server" CssClass=" AlignRight" Text='<%# Bind("DateShipped", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
				<PagerTemplate>
					<div id="wrapper">
						<div id="lside">
							<asp:Label ID="lblMessage" runat="server" Text="Select a page: " />
							<asp:DropDownList ID="ddlPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ShipmentPagerDDL_SelectedIndexChanged" />
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
			<br />
			Releases:
			<asp:GridView ID="gvPMRelease" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectReleaseID" DataSourceID="gvPMReleaseSQL" 
				AllowPaging="True" PageSize="5" OnDataBound="GvPMRelease_DataBound">
				<Columns>
					<asp:TemplateField HeaderText="Shipment #" SortExpression="ShipmentNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ShipmentNo") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("ShipmentNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Release #" SortExpression="ReleaseNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReleaseNo") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Release Date" SortExpression="DateRelease">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateRelease", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("DateRelease", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Panels" SortExpression="NumPanels">
						<EditItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Eval("NumPanels") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("NumPanels") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="# Columns" SortExpression="NumColumns">
						<EditItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Eval("NumColumns") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("NumColumns") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
				<PagerTemplate>
					<div id="wrapper">
						<div id="lside">
							<asp:Label ID="lblMessage" runat="server" Text="Select a page: " />
							<asp:DropDownList ID="ddlPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ReleasePagerDDL_SelectedIndexChanged" />
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
		</asp:View>
		<asp:View ID="Submittals" runat="server">
			<asp:GridView ID="gvSubmittals" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectSubmittalID" ShowFooter="true" 
				DataSourceID="gvSubmittalsSQL" OnRowCommand="gvSubmittals_RowCommand" OnRowUpdating="gvSubmittals_RowUpdating">
				<Columns>
					<asp:TemplateField ShowHeader="False">
						<EditItemTemplate>
							<asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
							&nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="txtDate" runat="server" CssClass="DateBox" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="DateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDate"
								ErrorMessage="Please enter a valid date."></asp:CompareValidator>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtDate" runat="server" CssClass="DateBox" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="DateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDate"
								ErrorMessage="Please enter a valid date."></asp:CompareValidator>
						</FooterTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Type" SortExpression="ProjectSubmittalTypeID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditSubmittalType" runat="server" CssClass="DDL150" AutoPostBack="True" DataSourceID="ddlProjectSubmittalType" 
								DataTextField="Description" DataValueField="ProjectSubmittalTypeID"  SelectedValue='<%# Bind("ProjectSubmittalTypeID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlSubmittalType" runat="server" CssClass="DDL150" AutoPostBack="True" DataSourceID="ddlProjectSubmittalType" 
								DataTextField="Description" DataValueField="ProjectSubmittalTypeID"  SelectedValue='<%# Bind("ProjectSubmittalTypeID") %>'>
							</asp:DropDownList>
						</FooterTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlSubmittalType" runat="server" CssClass="DDL150" DataSourceID="ddlProjectSubmittalType"  Enabled="false"
								DataTextField="Description" DataValueField="ProjectSubmittalTypeID" SelectedValue='<%# Bind("ProjectSubmittalTypeID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<EditItemTemplate>
							<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</FooterTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Reason" SortExpression="ProjectSubmittalReasonID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditSubmittalReason" runat="server" AutoPostBack="True" DataSourceID="ddlProjectSubmittalReasonSQL" 
								DataTextField="Description" DataValueField="ProjectSubmittalReasonID" SelectedValue='<%# Bind("ProjectSubmittalReasonID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlSubmittalReason" runat="server" AutoPostBack="True" DataSourceID="ddlProjectSubmittalReasonSQL" 
								DataTextField="Description" DataValueField="ProjectSubmittalReasonID" SelectedValue='<%# Bind("ProjectSubmittalReasonID") %>'>
							</asp:DropDownList>
						</FooterTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlSubmittalReason" runat="server" AutoPostBack="True" Enabled="false" DataSourceID="ddlProjectSubmittalReasonSQL" 
								DataTextField="Description" DataValueField="ProjectSubmittalReasonID" SelectedValue='<%# Bind("ProjectSubmittalReasonID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Manufacturer" SortExpression="Manufacturer">
						<EditItemTemplate>
							<asp:TextBox ID="txtManufacturer" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtManufacturer" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:TextBox>
						</FooterTemplate>
						<ItemTemplate>
							<asp:Label ID="lblManufacturer" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="#" SortExpression="NumCopies">
						<EditItemTemplate>
							<asp:TextBox ID="txtNumCopies" runat="server" CssClass="NumBox" Text='<%# Bind("NumCopies") %>'></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtNumCopies" runat="server" CssClass="NumBox" Text='<%# Bind("NumCopies") %>'></asp:TextBox>
						</FooterTemplate>
						<ItemTemplate>
							<asp:Label ID="lblNumCopies" runat="server" Text='<%# Bind("NumCopies") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</asp:View>
		<asp:View ID="ChangeOrders" runat="server">
			<asp:GridView ID="gvChangeOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectChangeOrderID" DataSourceID="gvChangeOrdersSQL">
				<Columns>
					<asp:TemplateField HeaderText="#" SortExpression="SeqNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SeqNo") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("SeqNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Source" SortExpression="Source">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Source") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("Source") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Amount" SortExpression="Amount">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox4" runat="server" Style="text-align:right" Text='<%# Bind("Amount", "{0:c}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Style="text-align:right" Text='<%# Bind("Amount", "{0:c}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Due" SortExpression="DateDue">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateDue", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("DateDue", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Rec'd" SortExpression="DateRecd">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DateRecd", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("DateRecd", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Status" SortExpression="Status">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlCOStatus" runat="server" AutoPostBack="True" DataSourceID="ddlCOStatusSQL" 
								DataTextField="COStatusDesc" DataValueField="COStatusAbbr" SelectedValue='<%# Bind("Status") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlCOStatus" runat="server" AutoPostBack="True" DataSourceID="ddlCOStatusSQL" Enabled="false"
								DataTextField="COStatusDesc" DataValueField="COStatusAbbr" SelectedValue='<%# Bind("Status") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</asp:View>
		<asp:View ID="Timecards" runat="server">
			<asp:GridView ID="gvTimeCards" runat="server" AutoGenerateColumns="False" DataKeyNames="TimecardID" DataSourceID="gvTimeCardsSQL" 
				AllowPaging="True" PageSize="20">
				<PagerSettings PreviousPageText="Prev" NextPageText="Next" Mode="NumericFirstLast" PageButtonCount="10" />
				<Columns>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Employee" SortExpression="EmployeeID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditTCEmployee" runat="server" AutoPostBack="True" 
								DataSourceID="ddlAllEmployeeSQL" DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlTCEmployee" runat="server" AutoPostBack="True" enabled="false"
								DataSourceID="ddlAllEmployeeSQL" DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Rel#" SortExpression="ReleaseNo">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReleaseNo") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("ReleaseNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Task" SortExpression="TimeCardTaskID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditTask" runat="server" AutoPostBack="True" DataSourceID="TimeCardTaskSQL" 
								DataTextField="Description" DataValueField="TimecardTaskID" SelectedValue='<%# Bind("TimeCardTaskID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlTask" runat="server" AutoPostBack="True" DataSourceID="TimeCardTaskSQL" enabled="false"
								DataTextField="Description" DataValueField="TimecardTaskID" SelectedValue='<%# Bind("TimeCardTaskID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Hours" SortExpression="Hours">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Hours") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("Hours") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="#&nbspPanels" SortExpression="NumPanels">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("NumPanels") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("NumPanels") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="#&nbspSheets" SortExpression="NumSheets">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("NumSheets") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("NumSheets") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Notes" SortExpression="Notes">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
			<asp:DataList ID="lstTotalHours" runat="server" DataSourceID="TCTotalHoursSQL">
				<ItemTemplate>
					Total Hours: 
					<asp:Label ID="TotalHoursLabel" runat="server" Text='<%# Eval("TotalHours") %>' />
					<br />
					<br />
				</ItemTemplate>
			</asp:DataList>
		</asp:View>
		<asp:View ID="Docs" runat="server">
			<asp:GridView ID="gvDocuments" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False" DataKeyNames="ProjectDocumentID" DataSourceID="gvDocumentSQL">
				<PagerSettings PreviousPageText="Prev" NextPageText="Next" Mode="NumericFirstLast" PageButtonCount="10" />
				<Columns>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Type" SortExpression="ProjectDocumentTypeID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditDocType" runat="server" AutoPostBack="True" DataSourceID="ddlDocTypeSQL" 
								DataTextField="Description" DataValueField="ProjectDocumentTypeID" SelectedValue='<%# Bind("ProjectDocumentTypeID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlDocType" runat="server" AutoPostBack="True" DataSourceID="ddlDocTypeSQL" enabled="false"
								DataTextField="Description" DataValueField="ProjectDocumentTypeID" SelectedValue='<%# Bind("ProjectDocumentTypeID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</asp:View>
		<asp:View ID="Log" runat="server">
			<asp:GridView ID="gvLog" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProjectLogID" DataSourceID="gvLogSQL">
				<Columns>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Type" SortExpression="LogTypeID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlLogType" runat="server" AutoPostBack="True" DataSourceID="ddlLogTypeSQL" 
								DataTextField="Description" DataValueField="LogTypeID" SelectedValue='<%# Bind("LogTypeID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlLogType" runat="server" AutoPostBack="True" DataSourceID="ddlLogTypeSQL" enabled="false"
								DataTextField="Description" DataValueField="LogTypeID" SelectedValue='<%# Bind("LogTypeID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Subject" SortExpression="Subject">
						<EditItemTemplate>
							<asp:TextBox ID="txtSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Employee" SortExpression="EmployeeID">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlLogEmp" runat="server" AutoPostBack="True" DataSourceID="ddlAllEmployeeSQL" 
								DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlLogEmp" runat="server" AutoPostBack="True" DataSourceID="ddlAllEmployeeSQL" enabled="false"
								DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</asp:View>
		<asp:View ID="Financials" runat="server">
			<table>
				<tr>
					<th colspan="2">Contract/CO:</th>
					<th colspan="2">Freight:</th>
					<th colspan="2">Customer:</th>
					<th colspan="2">Commissions:</th>
				</tr>
				<tr>
					<td>Total:</td>
					<td><asp:TextBox ID="txtTotalContractPrice" runat="server"/></td>
					<td>Total Cust:</td>
					<td><asp:TextBox ID="txtTotalFreight" runat="server" /></td>
					<td>Total:</td>
					<td><asp:TextBox ID="txtTotalCustInvoiced" runat="server" /></td>
					<td>Due:</td>
					<td><asp:TextBox ID="txtCommissionsDue" runat="server" /></td>
				</tr>
				<tr>
					<td>Invoiced:</td>
					<td><asp:TextBox ID="txtContractInvoiced" runat="server" /></td>
					<td>Invoiced:</td>
					<td><asp:TextBox ID="txtInvoicedFreight" runat="server" /></td>
					<td>Paid:</td>
					<td><asp:TextBox ID="txtCustomerPaid" runat="server" /></td>
					<td>Paid:</td>
					<td><asp:TextBox ID="txtCommissionsPaid" runat="server" /></td>
				</tr>
				<tr>
					<td>Balance:</td>
					<td><asp:TextBox ID="txtContractBalance" runat="server" /></td>
					<td>Balance:</td>
					<td><asp:TextBox ID="txtFreightBalance" runat="server" /></td>
					<td>Balance:</td>
					<td><asp:TextBox ID="txtCustomerBalance" runat="server" /></td>
					<td>Balance:</td>
					<td><asp:TextBox ID="txtCommissionsBalance" runat="server" /></td>
				</tr>
			</table>
			<br />
			<asp:GridView ID="gvFinancial" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceNo" DataSourceID="gvFinancialSQL">
				<Columns>
					<asp:TemplateField HeaderText="Invoice&nbsp#" SortExpression="InvoiceNo">
						<EditItemTemplate>
							<asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Eval("InvoiceNo") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("InvoiceNo") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Date" SortExpression="Date">
						<EditItemTemplate>
							<asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Amount" SortExpression="AmtInvoice">
						<EditItemTemplate>
							<asp:TextBox ID="txtAmtInvoice" runat="server" Text='<%# Bind("AmtInvoice", "{0:c}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblAmtInvoice" runat="server" Text='<%# Bind("AmtInvoice", "{0:c}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Mat'l" SortExpression="AmtMaterial">
						<EditItemTemplate>
							<asp:TextBox ID="txtAmtMaterial" runat="server" Text='<%# Bind("AmtMaterial", "{0:c}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblAmtMaterial" runat="server" Text='<%# Bind("AmtMaterial", "{0:c}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Other" SortExpression="AmtOther">
						<EditItemTemplate>
							<asp:TextBox ID="txtAmtOther" runat="server" Text='<%# Bind("AmtOther", "{0:c}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblAmtOther" runat="server" Text='<%# Bind("AmtOther", "{0:c}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Freight" SortExpression="AmtFreight">
						<EditItemTemplate>
							<asp:TextBox ID="txtAmtFreight" runat="server" Text='<%# Bind("AmtFreight", "{0:c}") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblAmtFreight" runat="server" Text='<%# Bind("AmtFreight", "{0:c}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Paid">
						<EditItemTemplate>
							<asp:TextBox ID="txtPaid" runat="server"></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblPaid" runat="server"></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Entered&nbspBy" SortExpression="EnteredBy">
						<EditItemTemplate>
							<asp:TextBox ID="txtEnteredBy" runat="server" Text='<%# Bind("EnteredBy") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblEnteredBy" runat="server" Text='<%# Bind("EnteredBy") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Description" SortExpression="Description">
						<EditItemTemplate>
							<asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</asp:View>
		<asp:View ID="Tasks" runat="server">
			<div id="wrapper">
				<div id="lside">
					<br />
					<br />
					<asp:BulletedList ID="blInstructions" runat="server">
						<asp:ListItem>To create new task, enter Release #, Task Code, Status, Priority, and Due Date. Then click Insert.</asp:ListItem>
						<asp:ListItem>To edit an existing task, click on Edit, then make any necessary changes, then click Update.</asp:ListItem>
						<asp:ListItem>NOTE: When a status is changed to Complete, the task will no longer be visible.</asp:ListItem>
					</asp:BulletedList>
				</div> <!-- end div left -->
				<div id="rside">
					<asp:Label ID="lblTaskCodeLegend" runat="server" Text="Task Code Legend"></asp:Label>
					<div style="height: 100px; width:225px; overflow:auto; border: 1px solid">
						<asp:DataList ID="lstTaskCode" runat="server" DataKeyField="TaskCodeID" DataSourceID="lstTaskCodeSQL">
							<ItemTemplate>
								<tr style="background-color:white;">
									<td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
									<td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
								</tr>
							</ItemTemplate>
							<AlternatingItemTemplate>
								<tr style="background-color:silver;">
									<td><asp:Label ID="lblTaskCode" runat="server" Text='<%# Eval("TaskCodeAbbr") %>' width="50" /></td>
									<td><asp:Label ID="lblTaskName" runat="server" Text='<%# Eval("TaskCodeName") %>' width="150" /></td>
								</tr>
							</AlternatingItemTemplate>
						</asp:DataList>
					</div> <!-- end div datalist -->
				</div> <!-- end div right -->
			</div> <!-- end div wrapper -->
			<asp:GridView ID="gvProjectTask" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataSourceID="gvProjectTaskSQL" 
				OnRowCommand="gvProjectTask_RowCommand" OnRowUpdating="gvProjectTask_RowUpdating">
				<Columns>
					<asp:TemplateField  ShowHeader="False" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:LinkButton ID="lbUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
							&nbsp;<asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
						</ItemTemplate>
						<FooterTemplate>
							<asp:LinkButton ID="lbInsert" runat="server" CausesValidation="true" CommandName="FooterInsert" Text="Save"></asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="TaskID" SortExpression="TaskID" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:Label ID="lblTaskIDEdit" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblTaskID" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:Label ID="lblNewTaskID" runat="server" Text='<%# Bind("TaskID") %>'></asp:Label>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Employee" SortExpression="ProjectName" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditEmployee" runat="server"  AutoPostBack="true" DataSourceID="ddlActiveEmployeeSQL" 
									DataTextField="Name" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>'>
									</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlEmployee" runat="server"  AutoPostBack="true" DataSourceID="ddlActiveEmployeeSQL" Enabled="false"
									DataTextField="Name" DataValueField="EmployeeID"  SelectedValue='<%# Bind("EmployeeID") %>'>
									</asp:DropDownList>
						</ItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlEmployee" runat="server"  AutoPostBack="true" DataSourceID="ddlActiveEmployeeSQL" AppendDataBoundItems="true"
								DataTextField="Name" DataValueField="EmployeeID"  SelectedValue='<%# Bind("EmployeeID") %>'>
								<asp:ListItem Text="<--Select Employee-->" Value="" />
							</asp:DropDownList>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Release&nbsp#" SortExpression="ReleaseID" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:TextBox ID="txtReleaseID" runat="server" Text='<%# Bind("ReleaseID") %>'></asp:TextBox>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblReleaseID" runat="server" Text='<%# Bind("ReleaseID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtReleaseID" runat="server" Width="50" Text='<%# Bind("ReleaseID") %>'></asp:TextBox>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Task Code" SortExpression="TaskCodeAbbr" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:Label ID="lblEditTaskCode" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblTaskCode" runat="server" Text='<%# Bind("TaskCodeAbbr") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlTaskCode" runat="server" AutoPostBack="True" 
								DataSourceID="lstTaskCodeSQL" DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
							</asp:DropDownList>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Status" SortExpression="TaskStatusID" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlTaskStatusSQL" 
								DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlTaskStatusSQL" enabled="false"
								DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlTaskStatus" runat="server" AutoPostBack="True" DataSourceID="ddlTaskStatusSQL" 
								DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
							</asp:DropDownList>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Priority" SortExpression="TaskPriorityID" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:DropDownList ID="ddlEditPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
								DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
							</asp:DropDownList>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" enabled="false"
								DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
							</asp:DropDownList>
						</ItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
								DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
							</asp:DropDownList>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Due Date" SortExpression="DueDate" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:TextBox ID="txtDueDate" CssClass="DateBox" runat="server" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="DueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDueDate"
								ErrorMessage="Please enter a valid date.">
							</asp:CompareValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblDueDate" runat="server" CssClass="DateBox" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtDueDate" CssClass="DateBox" runat="server"  Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="DueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDueDate"
								ErrorMessage="Please enter a valid date.">
							</asp:CompareValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Notes" SortExpression="Notes" HeaderStyle-BackColor="Silver">
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
					<asp:TemplateField HeaderText="Date Complete" SortExpression="CompDate" HeaderStyle-BackColor="Silver">
						<EditItemTemplate>
							<asp:TextBox ID="txtCompDate" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="CompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtCompDate"
								ErrorMessage="Please enter a valid date.">
							</asp:CompareValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="lblCompDate" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtCompDate" CssClass="DateBox" runat="server" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
							<asp:CompareValidator id="CompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtCompDate"
								ErrorMessage="Please enter a valid date.">
							</asp:CompareValidator>
						</FooterTemplate>
					</asp:TemplateField>
				</Columns>
				<EmptyDataTemplate>
					<table border="1">
							<tr style="background-color:silver">
								<th></th>
								<th>Task ID</th>
								<th>Employee</th>
								<th>Release&nbsp#</th>
								<th>Task Code</th>
								<th>Status</th>
								<th>Priority</th>
								<th>Due Date</th>
								<th>Notes</th>
								<th>Date Complete</th>
							</tr>
							<tr>
								<td>
									<asp:LinkButton ID="lbTaskEmpty" runat="server" CommandName="EmptyInsert" Text="Save" />
								</td>
								<td>
								
								</td>
								<td><asp:DropDownList ID="ddlEmployee" runat="server"  AutoPostBack="true" DataSourceID="ddlActiveEmployeeSQL" AppendDataBoundItems="true"
									DataTextField="Name" DataValueField="EmployeeID"  SelectedValue='<%# Bind("EmployeeID") %>'>
									<asp:ListItem Text="<--Select Employee-->" Value="" />
									</asp:DropDownList></td>
							
								<td><asp:TextBox ID="txtReleaseID" runat="server" CssClass="NumBox" AutoPostBack="true" Text='<%# Bind("ReleaseID") %>'></asp:TextBox></td>
								<td><asp:DropDownList ID="ddlTaskCode" runat="server" AutoPostBack="True" DataSourceID="lstTaskCodeSQL" 
									DataTextField="TaskCodeAbbr" DataValueField="TaskCodeID">
										</asp:DropDownList></td>
								<td><asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" DataSourceID="ddlTaskStatusSQL" 
											DataTextField="TaskStatusName" DataValueField="TaskStatusID" SelectedValue='<%# Bind("TaskStatusID") %>'>
									</asp:DropDownList></td>
								<td><asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" DataSourceID="ddlPrioritySQL" 
											DataTextField="TaskPriorityName" DataValueField="TaskPriorityID" SelectedValue='<%# Bind("TaskPriorityID") %>'>
									</asp:DropDownList></td>
								<td><asp:TextBox ID="txtDueDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("DueDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
									<asp:CompareValidator id="EmptyDueDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDueDate"
										ErrorMessage="Please enter a valid date."></asp:CompareValidator>
								</td>
								<td><asp:TextBox ID="txtNotes" runat="server" AutoPostBack="true" Text='<%# Bind("Notes") %>'></asp:TextBox></td>
								<td><asp:TextBox ID="txtCompDate" CssClass="DateBox" runat="server" AutoPostBack="true" Text='<%# Bind("CompDate", "{0:MM/dd/yyyy}") %>'></asp:TextBox>
									<asp:CompareValidator id="EmptyCompDateValidator" runat="server" Display="Dynamic" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtCompDate"
										ErrorMessage="Please enter a valid date."></asp:CompareValidator>
								</td>
							</tr>
						</table>
				</EmptyDataTemplate>
			</asp:GridView>
		</asp:View>
		<asp:View ID="Scan" runat="server">
			Scan Tab
		</asp:View>
	</asp:MultiView>
			
		   
		
		
	<asp:SqlDataSource ID="fvHeaderSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, 
			emp.Name AS PM, s.Description AS Series, ps.Description AS ProjectStatus, c.Company AS Customer, 
			c.Contact AS CustContact, c.Address1 AS CustAddr1, c.Address2 AS CustAddr2, c.City AS CustCity, 
			c.State AS CustState, c.Zip AS CustZip, p.Notes 
		FROM tblProject p 
		INNER JOIN tblEmployee emp ON p.Scope_PM_EmployeeID = emp.EmployeeID 
		INNER JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID 
		INNER JOIN tblSeries s ON p.SeriesID = s.SeriesID 
		INNER JOIN tblCustomer c ON p.CustomerID = c.CustomerID 
		WHERE (p.ProjectID = @ProjectID)" >
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="fvGeneralSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT p.ProjectID, p.ProjectName, p.ProjectAddress, p.ProjectCity, p.ProjectState, p.ProjectZip, p.DateSold,
			p.MultipleSeries, p.JobTypeID, emp.Name AS PM, s.Description AS Series, p.ProjectStatusID, p.DateStatus, p.CustomerPO,
			p.WarrantyInfo, p.CreditApproved, p.DateCreditAppSent, p.DateCreditAppRecd, p.PreferredBilling, p.NumShopDrawings, 
			c.Company AS Customer, c.Contact AS CustContact, c.Address1 AS CustAddr1, c.Address2 AS CustAddr2, c.City AS CustCity, 
			c.State AS CustState, c.Zip AS CustZip, p.OwnerName, p.OwnerAddress, p.OwnerCity, p.OwnerState, p.OwnerZip, p.DateDelivery,
			p.DeliveryNotes, p.DeliveryAddress, p.DeliveryCity, p.DeliveryState, p.DeliveryZip, p.Notes, p.Scope_PM_EmployeeID as PMEmpID, p.SeriesID 
		FROM tblProject p 
		INNER JOIN tblEmployee emp ON p.Scope_PM_EmployeeID = emp.EmployeeID 
		INNER JOIN tblProjectStatus ps ON p.ProjectStatusID = ps.ProjectStatusID 
		INNER JOIN tblSeries s ON p.SeriesID = s.SeriesID 
		INNER JOIN tblCustomer c ON p.CustomerID = c.CustomerID
		INNER JOIN tblJobType jt ON p.JobTypeID = jt.JobTypeID 
		WHERE (p.ProjectID = @ProjectID)" 
		UpdateCommand="UPDATE [tblProject] 
			SET [ProjectName] = @ProjectName, 
				[ProjectAddress] = @ProjectAddress, 
				[ProjectCity] = @ProjectCity, 
				[ProjectState] = @ProjectState, 
				[ProjectZip] = @ProjectZip,
				[DateSold] = @DateSold,
				[SeriesID] = @SeriesID,
				[MultipleSeries] = @MultipleSeries,
				[JobTypeID] = @JobTypeID,
				[ProjectStatusID] = @ProjectStatusID,
				[DateStatus] = @DateStatus,
				[CustomerPO] = @CustomerPO,
				[WarrantyInfo] = @WarrantyInfo,
				[CreditApproved] = @CreditApproved,
				[DateCreditAppSent] = @DateCreditAppSent,
				[DateCreditAppRecd] = @DateCreditAppRecd,
				[PreferredBilling] = @PreferredBilling,
				[NumShopDrawings] = @NumShopDrawings,
				[OwnerName] = @OwnerName,
				[OwnerAddress] = @OwnerAddress,
				[OwnerCity] = @OwnerCity,
				[OwnerState] = @OwnerState,
				[OwnerZip] = @OwnerZip,
				[DateDelivery] = @DateDelivery,
				[DeliveryNotes] = @DeliveryNotes,
				[DeliveryAddress] = @DeliveryAddress,
				[DeliveryCity] = @DeliveryCity,
				[DeliveryState] = @DeliveryState,
				[DeliveryZip] = @DeliveryZip,
				[Notes] = @Notes,
				[Scope_PM_EmployeeID] = @PMEmpID
			WHERE [ProjectID] = @original_ProjectID">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ProjectName" Type="String" />
			<asp:Parameter Name="ProjectAddress" Type="String" />
			<asp:Parameter Name="ProjectCity" Type="String" />
			<asp:Parameter Name="ProjectState" Type="String" />
			<asp:Parameter Name="ProjectZip" Type="String" />
			<asp:Parameter Name="original_ProjectID" Type="Int32" />
			<asp:Parameter Name="DateSold" Type="String" />
			<asp:Parameter Name="SeriesID" Type="Int32" />
			<asp:Parameter Name="MultipleSeries" Type="Boolean" />
			<asp:Parameter Name="JobTypeID" Type="Int32" />
			<asp:Parameter Name="ProjectStatusID" Type="Int32" />
			<asp:Parameter Name="DateStatus" Type="String" />
			<asp:Parameter Name="CustomerPO" Type="String" />
			<asp:Parameter Name="WarrantyInfo" Type="Boolean" />
			<asp:Parameter Name="CreditApproved" Type="Boolean" />
			<asp:Parameter Name="DateCreditAppSent" Type="String" />
			<asp:Parameter Name="DateCreditAppRecd" Type="String" />
			<asp:Parameter Name="PreferredBilling" Type="String" />
			<asp:Parameter Name="NumShopDrawings" Type="Int32" />
			<asp:Parameter Name="OwnerName" Type="String" />
			<asp:Parameter Name="OwnerAddress" Type="String" />
			<asp:Parameter Name="OwnerCity" Type="String" />
			<asp:Parameter Name="OwnerState" Type="String" />
			<asp:Parameter Name="OwnerZip" Type="String" />
			<asp:Parameter Name="DateDelivery" Type="String" />
			<asp:Parameter Name="DeliveryNotes" Type="String" />
			<asp:Parameter Name="DeliveryAddress" Type="String" />
			<asp:Parameter Name="DeliveryCity" Type="String" />
			<asp:Parameter Name="DeliveryState" Type="String" />
			<asp:Parameter Name="DeliveryZip" Type="String" />
			<asp:Parameter Name="Notes" Type="String" />
			<asp:Parameter Name="PMEmpID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvProjectTaskSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
				SelectCommand="SELECT tt.TaskID, tt.EmployeeID, tt.ProjectID, tt.ReleaseID, tt.TaskStatusID, tt.TaskPriorityID, tt.DueDate,
						tt.Notes, tt.CompDate, p.ProjectName, tc.TaskCodeAbbr 
					FROM tblTaskTracker tt 
					INNER JOIN tblProject p ON tt.ProjectID = p.ProjectID 
					INNER JOIN tblTaskCode tc ON tt.TaskCodeID = tc.TaskCodeID 
					INNER JOIN tblTaskStatus ts on tt.TaskStatusID = ts.TaskStatusID
					WHERE tt.ProjectID = @ProjectID AND ts.TaskStatusType <> 'Z' 
					ORDER BY ts.TaskStatusType, tt.TaskPriorityID, tt.DueDate"
				InsertCommand="INSERT INTO [tblTaskTracker] 
					([EmployeeID], [ProjectID], [ReleaseID], [TaskCodeID], [TaskStatusID], [TaskPriorityID], [DueDate], [Notes], [CompDate])
					VALUES (@EmployeeID, @ProjectID, @ReleaseID, @TaskCodeID, @TaskStatusID, @TaskPriorityID, @DueDate, @Notes, @CompDate)"
				UpdateCommand="UPDATE [tblTaskTracker] SET  [EmployeeID] = @EmployeeID, [TaskStatusID] = @TaskStatusID, [TaskPriorityID] = @TaskPriorityID, 
								[DueDate] = @DueDate, [Notes] = @Notes, [CompDate] = @CompDate WHERE [TaskID] = @TaskID"
				DeleteCommand="DELETE FROM [tblTaskTracker] WHERE [TaskID] = @TaskID">
				
				<SelectParameters>
					<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
				</SelectParameters>
				<InsertParameters>
					<asp:Parameter Name="EmployeeID" Type="Int32" />
					<asp:Parameter Name="ProjectID" Type="Int32" />
					<asp:Parameter Name="ReleaseID" Type="Int32" />
					<asp:Parameter Name="TaskCodeID" Type="Int32" />
					<asp:Parameter Name="TaskStatusID" Type="Int32" />
					<asp:Parameter Name="TaskPriorityID" Type="Int32" />
					<asp:Parameter Name="DueDate" Type="DateTime" />
					<asp:Parameter Name="Notes" Type="String" />
					<asp:Parameter Name="CompDate" Type="DateTime" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="EmployeeID" Type="Int32" />
					<asp:Parameter Name="TaskID" Type="Int32" />
					<asp:Parameter Name="TaskStatusID" Type="Int32" />
					<asp:Parameter Name="TaskPriorityID" Type="Int32" />
					<asp:Parameter Name="DueDate" Type="DateTime" />
					<asp:Parameter Name="Notes" Type="String" />
					<asp:Parameter Name="CompDate" Type="DateTime" />
				</UpdateParameters>
				<DeleteParameters>
					<asp:Parameter Name="TaskID" Type="Int32" />
				</DeleteParameters>
			</asp:SqlDataSource>

	<asp:SqlDataSource ID="lstTaskCodeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [TaskCodeID], [TaskCodeAbbr], [TaskCodeName] FROM [tblTaskCode] WHERE ([TaskCodeStatus] = @TaskCodeStatus) ORDER BY [TaskCodeAbbr]">
		<SelectParameters>
			<asp:Parameter DefaultValue="True" Name="TaskCodeStatus" Type="Boolean" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlActiveEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] WHERE ([Status] = 'A') ORDER BY [Name]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlTaskStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [TaskStatusID], [TaskStatusName] FROM [tblTaskStatus] ORDER BY [TaskStatusType], [TaskStatusName]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlPrioritySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [TaskPriorityID], [TaskPriorityName] FROM [tblTaskPriority] ORDER BY [TaskPriorityID]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlJobTypeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [JobTypeID], [JobTypeDescription] FROM [tblJobType] WHERE ([Active] = @Active)">
		<SelectParameters>
			<asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlProjStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectStatusID], [Description] FROM [tblProjectStatus]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlPreferredBillingSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT DISTINCT [PreferredBilling] FROM [tblProject] ORDER BY [PreferredBilling]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvSubmittalsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT ps.ProjectSubmittalID, 
			ps.ProjectID, 
			ps.Date, 
			ps.ProjectSubmittalTypeID,
			pst.Description AS ProjectSubmittalType_Description, 
			ps.NumCopies, 
			ps.Manufacturer, 
			ps.Description, 
			ps.ProjectSubmittalReasonID,
			psr.Description AS ProjectSubmittalReason_Description
			FROM tblProjectSubmittal ps
			INNER JOIN tblProjectSubmittalReason psr ON ps.ProjectSubmittalReasonID = psr.ProjectSubmittalReasonID
			INNER JOIN tblProjectSubmittalType pst ON ps.ProjectSubmittalTypeID = pst.ProjectSubmittalTypeID
			WHERE (ps.ProjectID = @ProjectID) ORDER BY ps.Date"
		UpdateCommand="UPDATE tblProjectSubmittal 
			SET [Date] = @Date, 
				[ProjectSubmittalTypeID] = @ProjectSubmittalTypeID, 
				[Description] = @Description,
				[ProjectSubmittalReasonID] = @ProjectSubmittalReasonID,        
				[Manufacturer] = @Manufacturer, 
				[NumCopies] = @NumCopies
			WHERE [ProjectSubmittalID] = @ProjectSubmittalID"
		InsertCommand="INSERT INTO tblProjectSubmittal
			([ProjectSubmittalID], [ProjectID], [Date], [ProjectSubmittalTypeID], [NumCopies], [Manufacturer], [Description], [ProjectSubmittalReasonID])
			VALUES (@ProjectSubmittalID, @ProjectID, @Date, @ProjectSubmittalTypeID, @NumCopies, @Manufacturer, @Description, @ProjectSubmittalReasonID)"
		DeleteCommand="DELETE FROM tblProjectSubmittal WHERE [ProjectSubmittalID] = @ProjectSubmittalID">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ProjectSubmittalID" Type="Int32" />
			<asp:Parameter Name="Date" Type="String" />
			<asp:Parameter Name="ProjectSubmittalTypeID" Type="Int32" />
			<asp:Parameter Name="NumCopies" Type="Int32" />
			<asp:Parameter Name="Manufacturer" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="ProjectSubmittalReasonID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="ProjectSubmittalID" Type="Int32" />
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
			<asp:Parameter Name="Date" Type="String" />
			<asp:Parameter Name="ProjectSubmittalTypeID" Type="Int32" />
			<asp:Parameter Name="NumCopies" Type="Int32" />
			<asp:Parameter Name="Manufacturer" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="ProjectSubmittalReasonID" Type="Int32" />
		</InsertParameters>
		<DeleteParameters>
			<asp:Parameter Name="ProjectSubmittalID" Type="Int32" />
		</DeleteParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlProjectSubmittalReasonSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectSubmittalReasonID], [Description] FROM [tblProjectSubmittalReason]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlProjectSubmittalType" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectSubmittalTypeID], [Description] FROM [tblProjectSubmittalType]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ChangeOrdersSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectChangeOrderID], [ProjectID], [Date], [Description], [Amount], [DateDue], [DateRecd], [Status], [ApprovalCode], 
			[EnteredBy_UserID], [SeqNo], [Source], [Initiator], [Reason], [ReasonNotes], [NumPanels], [IsCommissionable], [ProjectShipmentID] 
			FROM [tblProjectChangeOrder] 
			WHERE ([ProjectID] = @ProjectID) 
			ORDER BY [SeqNo], [Date] DESC">
		<SelectParameters>
			<asp:QueryStringParameter Name="ProjectID" QueryStringField="PID" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvChangeOrdersSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectChangeOrderID], [SeqNo], [Date], [Source], [Amount], [DateDue], [DateRecd], [Status], [Description] 
		FROM [tblProjectChangeOrder] 
		WHERE ([ProjectID] = @ProjectID)">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlCOStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [COStatusAbbr], [COStatusDesc] FROM [tblProjectChangeOrderStatus]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvTimeCardsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [TimecardID], [Date], [EmployeeID], [ReleaseNo], [TimeCardTaskID], [Hours], [NumPanels], [NumSheets], [Notes] 
		FROM [tblTimecard] 
		WHERE ([ProjectID] = @ProjectID) 
		ORDER BY [Date] DESC, [TimecardID]">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="TimeCardTaskSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [TimecardTaskID], [Description] FROM [tblTimecardTask]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlAllEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [EmployeeID], [Name] FROM [tblEmployee] ORDER BY [Name]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="TCTotalHoursSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT SUM(Hours) AS TotalHours FROM tblTimecard WHERE (ProjectID = @ProjectID)">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvDocumentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectDocumentID], [Description], [ProjectDocumentTypeID], [Date] 
		FROM [tblProjectDocument] 
		WHERE ([ProjectID] = @ProjectID) 
		ORDER BY [Date] DESC">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlDocTypeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectDocumentTypeID], [Description] FROM [tblProjectDocumentType] ORDER BY [Description]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvLogSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectLogID], [Date], [LogTypeID], [Subject], [EmployeeID] 
		FROM [tblProjectLog] 
		WHERE ([ProjectID] = @ProjectID) 
		ORDER BY [Date] DESC">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlLogTypeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [LogTypeID], [Description] FROM [tblLogType]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvFinancialSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [InvoiceNo], [Date], [AmtInvoice], [AmtMaterial], [AmtOther], [AmtFreight], [EnteredBy], [Description] 
		FROM [tblInvoice] 
		WHERE ([ProjectID] = @ProjectID) 
		ORDER BY [InvoiceNo]">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="fvPMSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectID], 
			[Scope_PM_EmployeeID], 
			[MTO_Complete], 
			[MTO_Complete_EmployeeID], 
			[PM_DateMatlApproved], 
			[PM_DateMatlOrderComplete], 
			[PM_ESD_ShopDrawings], 
			[PM_DateMatlRecd], 
			[Shops_Reviewed_EmployeeID], 
			[Shops_Reviewed], 
			[CAD_DateSent], 
			[Shops_Recd], 
			[Shops_Revised], 
			[PM_DateShopsApproved] 
		FROM [tblProject] 
		WHERE ([ProjectID] = @ProjectID)">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" Type="Int32" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlPMEmployeeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT e.EmployeeID, e.Name FROM tblEmployee AS e INNER JOIN 
		tblEmployeeRole AS er ON e.EmployeeID = er.EmployeeID INNER JOIN 
		tblEmployeeType AS et ON er.EmployeeTypeID = et.EmployeeTypeID 
		WHERE (et.Description = 'Project Manager') 
		ORDER BY e.Name">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlSeriesSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [SeriesID], [Description] FROM [tblSeries] WHERE ([Active] = @Active) ORDER BY [Description]">
		<SelectParameters>
			<asp:Parameter DefaultValue="True" Name="Active" Type="Boolean" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="fvScopeSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectID], [Scope_DateMeeting], [Scope_TimeMeeting], [Scope_PM_EmployeeID], [Scope_CA_EmployeeID], [Scope_Estimator_EmployeeID], 
			[Scope_CAD_EmployeeID], [Scope_Others], [Scope_NumReleases], [Scope_ReleaseNotes], [Scope_ShippingNotes], [Scope_Warranty], [Scope_WarrantyStd], 
			[Scope_TeamLead_EmployeeID], [NumPanels], [PanelSqFt], [Scope_BeginQtr], [Scope_BeginYear], [Scope_EndQtr], [Scope_EndYear], [Scope_InternalNotes], 
			[Scope_RSM_EmployeeID], [Scope_SalesRep_ID] FROM [tblProject] 
		WHERE ([ProjectID] = @ProjectID)" 
		UpdateCommand="UPDATE [tblProject] SET [Scope_DateMeeting] = @Scope_DateMeeting, [Scope_TimeMeeting] = @Scope_TimeMeeting, [Scope_PM_EmployeeID] = @Scope_PM_EmployeeID, 
			[Scope_CA_EmployeeID] = @Scope_CA_EmployeeID, [Scope_Estimator_EmployeeID] = @Scope_Estimator_EmployeeID, [Scope_CAD_EmployeeID] = @Scope_CAD_EmployeeID, 
			[Scope_Others] = @Scope_Others, [Scope_NumReleases] = @Scope_NumReleases, [Scope_ReleaseNotes] = @Scope_ReleaseNotes, [Scope_ShippingNotes] = @Scope_ShippingNotes, 
			[Scope_Warranty] = @Scope_Warranty, [Scope_WarrantyStd] = @Scope_WarrantyStd, [Scope_TeamLead_EmployeeID] = @Scope_TeamLead_EmployeeID, 
			[NumPanels] = @NumPanels, [PanelSqFt] = @PanelSqFt, [Scope_BeginQtr] = @Scope_BeginQtr, [Scope_BeginYear] = @Scope_BeginYear, 
			[Scope_EndQtr] = @Scope_EndQtr, [Scope_EndYear] = @Scope_EndYear, [Scope_InternalNotes] = @Scope_InternalNotes, [Scope_RSM_EmployeeID] = @Scope_RSM_EmployeeID, 
			[Scope_SalesRep_ID] = @Scope_SalesRep_ID 
		WHERE [ProjectID] = @original_ProjectID)">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" RouteKey="ProjectID" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="Scope_DateMeeting" Type="DateTime" />
			<asp:Parameter Name="Scope_TimeMeeting" Type="String" />
			<asp:Parameter Name="Scope_PM_EmployeeID" Type="Int32" />
			<asp:Parameter Name="Scope_CA_EmployeeID" Type="Int32" />
			<asp:Parameter Name="Scope_Estimator_EmployeeID" Type="Int32" />
			<asp:Parameter Name="Scope_CAD_EmployeeID" Type="Int32" />
			<asp:Parameter Name="Scope_Others" Type="String" />
			<asp:Parameter Name="Scope_NumReleases" Type="Byte" />
			<asp:Parameter Name="Scope_ReleaseNotes" Type="String" />
			<asp:Parameter Name="Scope_ShippingNotes" Type="String" />
			<asp:Parameter Name="Scope_Warranty" Type="String" />
			<asp:Parameter Name="Scope_WarrantyStd" Type="String" />
			<asp:Parameter Name="Scope_TeamLead_EmployeeID" Type="Int32" />
			<asp:Parameter Name="NumPanels" Type="Int32" />
			<asp:Parameter Name="PanelSqFt" Type="Int32" />
			<asp:Parameter Name="Scope_BeginQtr" Type="String" />
			<asp:Parameter Name="Scope_BeginYear" Type="String" />
			<asp:Parameter Name="Scope_EndQtr" Type="String" />
			<asp:Parameter Name="Scope_EndYear" Type="String" />
			<asp:Parameter Name="Scope_InternalNotes" Type="String" />
			<asp:Parameter Name="Scope_RSM_EmployeeID" Type="Int32" />
			<asp:Parameter Name="Scope_SalesRep_ID" Type="Int32" />
			<asp:Parameter Name="original_ProjectID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="fvCADSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectID], [ProjectName], [CAD_EmployeeID], [CAD_StatusID], [CAD_Num], [CAD_DateRecd], [CAD_DateEst], [CAD_DateSent], [CAD_DateHandoff], [CAD_EstHours], [DateDelivery], [NumShopDrawings], [CAD_Notes] FROM [tblProject] WHERE ([ProjectID] = @ProjectID)" DeleteCommand="DELETE FROM [tblProject] WHERE [ProjectID] = @ProjectID" InsertCommand="INSERT INTO [tblProject] ([ProjectID], [ProjectName], [CAD_EmployeeID], [CAD_StatusID], [CAD_Num], [CAD_DateRecd], [CAD_DateEst], [CAD_DateSent], [CAD_DateHandoff], [CAD_EstHours], [DateDelivery], [NumShopDrawings], [CAD_Notes]) VALUES (@ProjectID, @ProjectName, @CAD_EmployeeID, @CAD_StatusID, @CAD_Num, @CAD_DateRecd, @CAD_DateEst, @CAD_DateSent, @CAD_DateHandoff, @CAD_EstHours, @DateDelivery, @NumShopDrawings, @CAD_Notes)" UpdateCommand="UPDATE [tblProject] SET [ProjectName] = @ProjectName, [CAD_EmployeeID] = @CAD_EmployeeID, [CAD_StatusID] = @CAD_StatusID, [CAD_Num] = @CAD_Num, [CAD_DateRecd] = @CAD_DateRecd, [CAD_DateEst] = @CAD_DateEst, [CAD_DateSent] = @CAD_DateSent, [CAD_DateHandoff] = @CAD_DateHandoff, [CAD_EstHours] = @CAD_EstHours, [DateDelivery] = @DateDelivery, [NumShopDrawings] = @NumShopDrawings, [CAD_Notes] = @CAD_Notes WHERE [ProjectID] = @ProjectID">
		<DeleteParameters>
			<asp:Parameter Name="ProjectID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="ProjectID" Type="Int32" />
			<asp:Parameter Name="ProjectName" Type="String" />
			<asp:Parameter Name="CAD_EmployeeID" Type="Int32" />
			<asp:Parameter Name="CAD_StatusID" Type="Int32" />
			<asp:Parameter Name="CAD_Num" Type="String" />
			<asp:Parameter Name="CAD_DateRecd" Type="DateTime" />
			<asp:Parameter Name="CAD_DateEst" Type="DateTime" />
			<asp:Parameter Name="CAD_DateSent" Type="DateTime" />
			<asp:Parameter Name="CAD_DateHandoff" Type="DateTime" />
			<asp:Parameter Name="CAD_EstHours" Type="Decimal" />
			<asp:Parameter Name="DateDelivery" Type="DateTime" />
			<asp:Parameter Name="NumShopDrawings" Type="Int32" />
			<asp:Parameter Name="CAD_Notes" Type="String" />
		</InsertParameters>
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" RouteKey="ProjectID" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ProjectName" Type="String" />
			<asp:Parameter Name="CAD_EmployeeID" Type="Int32" />
			<asp:Parameter Name="CAD_StatusID" Type="Int32" />
			<asp:Parameter Name="CAD_Num" Type="String" />
			<asp:Parameter Name="CAD_DateRecd" Type="DateTime" />
			<asp:Parameter Name="CAD_DateEst" Type="DateTime" />
			<asp:Parameter Name="CAD_DateSent" Type="DateTime" />
			<asp:Parameter Name="CAD_DateHandoff" Type="DateTime" />
			<asp:Parameter Name="CAD_EstHours" Type="Decimal" />
			<asp:Parameter Name="DateDelivery" Type="DateTime" />
			<asp:Parameter Name="NumShopDrawings" Type="Int32" />
			<asp:Parameter Name="CAD_Notes" Type="String" />
			<asp:Parameter Name="ProjectID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlWarrantySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [Warranty] FROM [tblWarranty] ORDER BY [Warranty]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="ddlCADStatusSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ProjectCADStatusID], [Description] FROM [tblProjectCADStatus] ORDER BY [Description]">
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvPMShipmentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		DeleteCommand="DELETE FROM [tblProjectShipment] WHERE [ProjectShipmentID] = @ProjectShipmentID" 
		InsertCommand="INSERT INTO [tblProjectShipment] ([ProjectID], [ShipmentNo], [Description], [DateRequested], [DateShipped]) 
			VALUES (@ProjectID, @ShipmentNo, @Description, @DateRequested, @DateShipped)" 
		SelectCommand="SELECT [ProjectShipmentID], [ProjectID], [ShipmentNo], [Description], [DateRequested], [DateShipped] 
			FROM [tblProjectShipment] 
			WHERE ([ProjectID] = @ProjectID) ORDER BY [ShipmentNo]" 
		UpdateCommand="UPDATE [tblProjectShipment] SET [ProjectID] = @ProjectID, [ShipmentNo] = @ShipmentNo, [Description] = @Description, 
			[DateRequested] = @DateRequested, [DateShipped] = @DateShipped WHERE [ProjectShipmentID] = @ProjectShipmentID">
		<DeleteParameters>
			<asp:Parameter Name="ProjectShipmentID" Type="Int32" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="ProjectID" Type="Int32" />
			<asp:Parameter Name="ShipmentNo" Type="Int32" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="DateRequested" Type="DateTime" />
			<asp:Parameter Name="DateShipped" Type="DateTime" />
		</InsertParameters>
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" RouteKey="ProjectID" Type="Int32" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ProjectID" Type="Int32" />
			<asp:Parameter Name="ShipmentNo" Type="Int32" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="DateRequested" Type="DateTime" />
			<asp:Parameter Name="DateShipped" Type="DateTime" />
			<asp:Parameter Name="ProjectShipmentID" Type="Int32" />
		</UpdateParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvPMShipmentSubSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT [ShippingID], [Date], [PaidBy], [TrackingNo], [Cost] FROM [tblShipping] WHERE ([ProjectID] = @ProjectID)">
		<SelectParameters>
			<asp:Parameter Name="ProjectID" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="gvPMReleaseSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
		SelectCommand="SELECT tpr.ProjectReleaseID, tpr.ProjectID, tps.ShipmentNo, tpr.ReleaseNo, tpr.Description, tpr.DateRelease, 
			(SELECT SUM(Qty) AS Expr1 FROM tblProjectReleaseWork AS tprw WHERE (ProjectReleaseID = tpr.ProjectReleaseID)) AS NumPanels, 
			(SELECT SUM(QtyPanels) AS Expr1 FROM tblModule WHERE (ProjectReleaseID = tpr.ProjectReleaseID)) AS NumColumns FROM tblProjectRelease AS tpr 
			LEFT OUTER JOIN tblProjectShipment AS tps ON tpr.ProjectShipmentID = tps.ProjectShipmentID WHERE (tpr.ProjectID = @ProjectID)">
		<SelectParameters>
			<asp:RouteParameter Name="ProjectID" RouteKey="ProjectID" />
		</SelectParameters>
	</asp:SqlDataSource>

</asp:Content>
