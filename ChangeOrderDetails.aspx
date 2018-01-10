<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeOrderDetails.aspx.cs" Inherits="ProjectLogic.ChangeOrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Content/Controls.css"/>
</head>
<body>
<script>
    window.onunload = refreshParent;

    function refreshParent() {
        window.opener.location.reload();
    }
</script>
<form runat="server">
<asp:FormView ID="FvChangeOrder" runat="server" DataKeyNames="ProjectChangeOrderID" DataSourceID="FvChangeOrderSQL"
              OnItemCommand="FvChangeOrder_OnItemCommand" OnDataBound="FvChangeOrder_OnDataBound">
    <EditItemTemplate>
        <asp:Label ID="LblCOID" runat="server" Text='<%# Eval("ProjectChangeOrderID") %>' Visible="False"/>
        <div class="divTable">
            <div class="divTableBody">
                <div class="divTableRow">
                    <div class="divTableCell">Project #:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblProjectID" runat="server" Text='<%# Bind("ProjectID") %>'/>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">Shipment #:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlShipment" DataSourceID="DdlShipmentSQL" SelectedValue='<%# Bind("ProjectShipmentID") %>'
                                          DataValueField="ProjectShipmentID" DataTextField="ShipmentNo" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">C/O #:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtSeqNo" runat="server" Text='<%# Bind("SeqNo") %>'/>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">Date:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtDate" runat="server" Text='<%# Bind("Date") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Entered By:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlEnteredBy" DataSourceID="DdlEnteredBySQL" SelectedValue='<%# Bind("EnteredBy_UserID") %>'
                                          DataValueField="UserID" DataTextField="Name"/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Source:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlSource" SelectedValue='<%# Bind("Source") %>'>
                            <asp:ListItem Text="Internal" Value="Internal"/>
                            <asp:ListItem Text="External" Value="External"/>
                            <asp:ListItem Text="Field Meas" Value="Field Meas"/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Initiator:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlInitiator" DataSourceID="DdlInitiatorSQL" SelectedValue='<%# Bind("Initiator") %>'
                                          DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Reason:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlReason" DataSourceID="DdlReasonSQL" SelectedValue='<%# Bind("Reason") %>'
                                          DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Reason Notes:</div>
                    </div>
                <div class="divTableRow">
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtReasonNotes" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("ReasonNotes") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Approval Code:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="LblApprovalCode" runat="server" Text='<%# Bind("ApprovalCode") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Description:</div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">
                        <asp:TextBox ID="LblDescription" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("Description") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell"># Panels</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtNumPanels" runat="server" Text='<%# Bind("NumPanels") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Amount:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="LblAmount" runat="server" Text='<%# Bind("Amount") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Commissionable</div>
                    <div class="divTableCell">
                        <asp:CheckBox ID="ChkIsComm" runat="server" Checked='<%# Bind("IsCommissionable") %>' />
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Date Due:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtDateDue" runat="server" Text='<%# Bind("DateDue") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Date Recd:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtDateRecd" runat="server" Text='<%# Bind("DateRecd") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Status:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlStatus" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem Text="Pending" Value="P"></asp:ListItem>
                            <asp:ListItem Text="Approved" Value="A"></asp:ListItem>
                            <asp:ListItem Text="Denied" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Voided" Value="X"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div> 
        </div> 
        <br/>
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"/>
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Label ID="LblCOID" runat="server" Text='<%# Eval("ProjectChangeOrderID") %>' Visible="False"/>
        <div class="divTable">
            <div class="divTableBody">
                <div class="divTableRow">
                    <div class="divTableCell">Project #:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblProjectID" runat="server" Text='<%# Bind("ProjectID") %>'/>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">Shipment #:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlShipment" DataSourceID="DdlShipmentSQL" SelectedValue='<%# Bind("ProjectShipmentID") %>'
                                          DataValueField="ProjectShipmentID" DataTextField="ShipmentNo" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">C/O #:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblSeqNo" runat="server" Text='<%# Bind("SeqNo") %>'/>
                    </div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">Date:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblDate" runat="server" Text='<%# Bind("Date", "{0:d}") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Entered By:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlEnteredBy" DataSourceID="DdlEnteredBySQL" SelectedValue='<%# Bind("EnteredBy_UserID") %>'
                                          DataValueField="UserID" DataTextField="Name" Enabled="False"/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Source:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlSource" SelectedValue='<%# Bind("Source") %>' Enabled="False">
                            <asp:ListItem Text="Internal" Value="Internal"/>
                            <asp:ListItem Text="External" Value="External"/>
                            <asp:ListItem Text="Field Meas" Value="Field Meas"/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Initiator:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlInitiator" DataSourceID="DdlInitiatorSQL" SelectedValue='<%# Bind("Initiator") %>'
                                          DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Reason:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlReason" DataSourceID="DdlReasonSQL" SelectedValue='<%# Bind("Reason") %>'
                                          DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                            <asp:ListItem Text="" Value=""/>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Reason Notes:</div>
                    <div class="divTableCell">
                        <asp:TextBox ID="TxtReasonNotes" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("ReasonNotes") %>' Enabled="False"/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Approval Code:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblApprovalCode" runat="server" Text='<%# Bind("ApprovalCode") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Description:</div>
                </div>
                <div class="divTableRow">
                    <div class="divTableCell">
                        <asp:TextBox ID="LblDescription" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("Description") %>' Enabled="False"/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell"># Panels</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblNumPanels" runat="server" Text='<%# Bind("NumPanels") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Amount:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblAmount" runat="server" Text='<%# Bind("Amount", "{0:c}") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Commissionable</div>
                    <div class="divTableCell">
                        <asp:CheckBox ID="ChkIsComm" runat="server" Checked='<%# Bind("IsCommissionable") %>' Enabled="false"/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Date Due:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblDateDue" runat="server" Text='<%# Bind("DateDue", "{0:d}") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Date Recd:</div>
                    <div class="divTableCell">
                        <asp:Label ID="LblDateRecd" runat="server" Text='<%# Bind("DateRecd", "{0:d}") %>'/>
                    </div>
                </div>
                <div class="divTableRow ">
                    <div class="divTableCell">Status:</div>
                    <div class="divTableCell">
                        <asp:DropDownList runat="server" ID="DdlStatus" SelectedValue='<%# Bind("Status") %>' Enabled="False">
                            <asp:ListItem Text="Pending" Value="P"></asp:ListItem>
                            <asp:ListItem Text="Approved" Value="A"></asp:ListItem>
                            <asp:ListItem Text="Denied" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Voided" Value="X"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div> 
        </div> 
        <br/>
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="FakeDelete" Text="Delete"/>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="FvChangeOrderSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   DeleteCommand="DELETE FROM [tblProjectChangeOrder] WHERE [ProjectChangeOrderID] = @PCOID"
                   InsertCommand="INSERT INTO [tblProjectChangeOrder] ([ProjectID], [ProjectShipmentID], [SeqNo], [Date], [EnteredBy_UserID], [Source], [Initiator], [Reason], [ReasonNotes], 
                [ApprovalCode], [Description], [NumPanels], [Amount], [IsCommissionable], [DateDue], [DateRecd], [Status]) 
                VALUES (@ProjectID, @ProjectShipmentID, @SeqNo, @Date, @EnteredBy_UserID, @Source, @Initiator, @Reason, @ReasonNotes, 
                @ApprovalCode, @Description, @NumPanels, @Amount, @IsCommissionable, @DateDue, @DateRecd, @Status)"
                   SelectCommand="SELECT [ProjectID], [ProjectChangeOrderID], [ProjectShipmentID], [SeqNo], [Date], [EnteredBy_UserID], [Source], [Initiator], [Reason], [ReasonNotes], 
                [ApprovalCode], [Description], [NumPanels], [Amount], [IsCommissionable], [DateDue], [DateRecd], [Status] 
                FROM [tblProjectChangeOrder] WHERE ([ProjectChangeOrderID] = @PCOID)"
                   UpdateCommand="UPDATE [tblProjectChangeOrder] SET [ProjectID] = @ProjectID, [ProjectShipmentID] = @ProjectShipmentID, [SeqNo] = @SeqNo, [Date] = @Date, 
                [EnteredBy_UserID] = @EnteredBy_UserID, [Source] = @Source, [Initiator] = @Initiator, [Reason] = @Reason, [ReasonNotes] = @ReasonNotes, [ApprovalCode] = @ApprovalCode, 
                [Description] = @Description, [NumPanels] = @NumPanels, [Amount] = @Amount, [IsCommissionable] = @IsCommissionable, [DateDue] = @DateDue, [DateRecd] = @DateRecd, [Status] = @Status 
                WHERE [ProjectChangeOrderID] = @PCOID">
    <DeleteParameters>
        <asp:QueryStringParameter Name="PCOID" QueryStringField="PCOID" Type="Int32"/>
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Name="ProjectShipmentID" Type="Int32"/>
        <asp:Parameter Name="SeqNo" Type="Int32"/>
        <asp:Parameter Name="Date" Type="DateTime"/>
        <asp:Parameter Name="EnteredBy_UserID" Type="String"/>
        <asp:Parameter Name="Source" Type="String"/>
        <asp:Parameter Name="Initiator" Type="String"/>
        <asp:Parameter Name="Reason" Type="String"/>
        <asp:Parameter Name="ReasonNotes" Type="String"/>
        <asp:Parameter Name="ApprovalCode" Type="String"/>
        <asp:Parameter Name="Description" Type="String"/>
        <asp:Parameter Name="NumPanels" Type="Int32"/>
        <asp:Parameter Name="Amount" Type="Decimal"/>
        <asp:Parameter Name="IsCommissionable" Type="Boolean"/>
        <asp:Parameter Name="DateDue" Type="DateTime"/>
        <asp:Parameter Name="DateRecd" Type="DateTime"/>
        <asp:Parameter Name="Status" Type="String"/>
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="PCOID" QueryStringField="PCOID" Type="Int32"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectID" Type="Int32"/>
        <asp:Parameter Name="ProjectShipmentID" Type="Int32"/>
        <asp:Parameter Name="SeqNo" Type="Int32"/>
        <asp:Parameter Name="Date" Type="DateTime"/>
        <asp:Parameter Name="EnteredBy_UserID" Type="String"/>
        <asp:Parameter Name="Source" Type="String"/>
        <asp:Parameter Name="Initiator" Type="String"/>
        <asp:Parameter Name="Reason" Type="String"/>
        <asp:Parameter Name="ReasonNotes" Type="String"/>
        <asp:Parameter Name="ApprovalCode" Type="String"/>
        <asp:Parameter Name="Description" Type="String"/>
        <asp:Parameter Name="NumPanels" Type="Int32"/>
        <asp:Parameter Name="Amount" Type="Decimal"/>
        <asp:Parameter Name="IsCommissionable" Type="Boolean"/>
        <asp:Parameter Name="DateDue" Type="DateTime"/>
        <asp:Parameter Name="DateRecd" Type="DateTime"/>
        <asp:Parameter Name="Status" Type="String"/>
        <asp:QueryStringParameter Name="PCOID" QueryStringField="PCOID" Type="Int32"/>
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlShipmentSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT [ProjectShipmentID], [ShipmentNo] FROM [tblProjectShipment] WHERE ProjectID = 18020">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlEnteredBySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT tblUser.UserID, tblEmployee.Name FROM tblEmployee INNER JOIN tblUser ON tblEmployee.EmployeeID = tblUser.EmployeeID ORDER BY tblEmployee.Name">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlInitiatorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" SelectCommand="SELECT [FieldValue], [FieldName] FROM [tblProjectChangeOrderLookup] WHERE ([FieldName] = @FieldName)">
    <SelectParameters>
        <asp:Parameter DefaultValue="Initiator" Name="FieldName" Type="String"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlReasonSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" SelectCommand="SELECT [FieldValue], [FieldName] FROM [tblProjectChangeOrderLookup] WHERE ([FieldName] = @FieldName)">
    <SelectParameters>
        <asp:Parameter DefaultValue="Reason" Name="FieldName" Type="String"/>
    </SelectParameters>
</asp:SqlDataSource>

</form>

</body>
</html>