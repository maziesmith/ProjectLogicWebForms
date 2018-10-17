<%@ Page Title="Change Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeOrderDetails.aspx.cs" Inherits="ProjectLogic.ChangeOrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--<script>
    window.onunload = refreshParent;

    function refreshParent() {
        window.opener.location.reload();
    }
</script>--%>
<asp:FormView ID="FvChangeOrder" runat="server" DataKeyNames="ProjectChangeOrderID" DataSourceID="FvChangeOrderSQL"
              OnItemCommand="FvChangeOrder_OnItemCommand" OnDataBound="FvChangeOrder_OnDataBound">
<EditItemTemplate>
    <asp:Label ID="LblCOID" runat="server" Text='<%# Eval("ProjectChangeOrderID") %>' Visible="False"/>
    <div class="divTable">
        <div class="divTableBody">
            <div class="divTableRow">
                <div class="divTableCell">Project #:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtProjectID" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("ProjectID") %>' Enabled="False"/>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">Shipment #:</div>
                <div class="divTableCell">
                    <asp:DropDownList ID="DdlShipment" runat="server" DataSourceID="DdlShipmentSQL" DataTextField="ShipmentNo" AppendDataBoundItems="true"
                        DataValueField="ProjectShipmentID" SelectedValue='<%# Bind("ProjectShipmentID") %>'>
                        <asp:ListItem Text="None" Value="" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">C/O #:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtSeqNo" runat="server" CssClass="DateBox AlignRight"  Text='<%# Bind("SeqNo") %>'/>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">Date:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtDate" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Date","{0:d}") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Entered By:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlEnteredBy" CssClass="DDL150" DataSourceID="DdlEnteredBySQL" SelectedValue='<%# Bind("EnteredBy_UserID") %>'
                                      DataValueField="UserID" DataTextField="Name"/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Source:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlSource" CssClass="DDL150" SelectedValue='<%# Bind("Source") %>'>
                        <asp:ListItem Text="" Value=""/>
                        <asp:ListItem Text="Internal" Value="Internal"/>
                        <asp:ListItem Text="External" Value="External"/>
                        <asp:ListItem Text="Field Meas" Value="Field Meas"/>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Initiator:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlInitiator" CssClass="DDL150" DataSourceID="DdlInitiatorSQL" SelectedValue='<%# Bind("Initiator") %>'
                                      DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="" Value=""/>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Reason:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlReason" CssClass="DDL150" DataSourceID="DdlReasonSQL" SelectedValue='<%# Bind("Reason") %>'
                                      DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="" Value=""/>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Reason Notes:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtReasonNotes" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("ReasonNotes") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Approval Code:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="LblApprovalCode" runat="server" CssClass="DateBox" Text='<%# Bind("ApprovalCode") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Description:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="LblDescription" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("Description") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell"># Panels</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtNumPanels" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("NumPanels") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Amount:</div>
                <div class="divTableCell">
                    $<asp:TextBox ID="TxtAmount" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("Amount","{0:n2}") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Commissionable</div>
                <div class="divTableCell">
                    <asp:CheckBox ID="ChkIsComm" runat="server" Checked='<%# Bind("IsCommissionable") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Date Due:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtDateDue" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("DateDue","{0:d}") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Date Recd:</div>
                <div class="divTableCell">
                    <asp:TextBox ID="TxtDateRecd" runat="server" CssClass="DateBox AlignRight" Text='<%# Bind("DateRecd","{0:d}") %>'/>
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
    <div class="divTable">
        <div class="divTableBody">
            <div class="divTableRow">
                <div class="divTableCell">Project #:</div>
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblProjectID" runat="server" Text='<%# Eval("ProjectID") %>'/>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">Shipment #:</div>
                <div class="divTableCell AlignRight">
                    <asp:DropDownList runat="server" ID="DdlShipment" DataSourceID="DdlShipmentSQL" SelectedValue='<%# Bind("ProjectShipmentID") %>'
                        DataValueField="ProjectShipmentID" DataTextField="ShipmentNo" Enabled="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                    
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">C/O #:</div>
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblSeqNo" runat="server" Text='<%# Bind("SeqNo") %>'/>
                </div>
            </div>
            <div class="divTableRow">
                <div class="divTableCell">Date:</div>
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("Date", "{0:d}") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Entered By:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlEnteredBy" CssClass="DDL150" DataSourceID="DdlEnteredBySQL" SelectedValue='<%# Bind("EnteredBy_UserID") %>'
                                      DataValueField="UserID" DataTextField="Name" Enabled="False"/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Source:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlSource" CssClass="DDL150" SelectedValue='<%# Bind("Source") %>' Enabled="False">
                        <asp:ListItem Text="" Value=""/>
                        <asp:ListItem Text="Internal" Value="Internal"/>
                        <asp:ListItem Text="External" Value="External"/>
                        <asp:ListItem Text="Field Meas" Value="Field Meas"/>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Initiator:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlInitiator" CssClass="DDL150" DataSourceID="DdlInitiatorSQL" SelectedValue='<%# Bind("Initiator") %>'
                                      DataValueField="FieldName" DataTextField="FieldValue" Enabled="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="" Value=""/>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Reason:</div>
                <div class="divTableCell">
                    <asp:DropDownList runat="server" ID="DdlReason" CssClass="DDL150" DataSourceID="DdlReasonSQL" SelectedValue='<%# Bind("Reason") %>'
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
                <div class="divTableCell">
                    <asp:TextBox ID="LblDescription" runat="server" CssClass="LongBox" TextMode="MultiLine" Rows="5" Text='<%# Bind("Description") %>' Enabled="False"/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell"># Panels</div>
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblNumPanels" runat="server" Text='<%# Bind("NumPanels") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Amount:</div>
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblAmount" runat="server" Text='<%# Bind("Amount","{0:c}") %>'/>
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
                <div class="divTableCell AlignRight">
                    <asp:Label ID="LblDateDue" runat="server" Text='<%# Bind("DateDue", "{0:d}") %>'/>
                </div>
            </div>
            <div class="divTableRow ">
                <div class="divTableCell">Date Recd:</div>
                <div class="divTableCell AlignRight">
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
    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/>
</ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="FvChangeOrderSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   DeleteCommand="DELETE FROM tblProjectChangeOrder WHERE ProjectChangeOrderID = @PCOID"
                   InsertCommand="INSERT INTO tblProjectChangeOrder (ProjectID, ProjectShipmentID, SeqNo, Date, EnteredBy_UserID, Source, Initiator, Reason, ReasonNotes, 
                ApprovalCode, Description, NumPanels, Amount, IsCommissionable, DateDue, DateRecd, Status) 
                VALUES (@ProjectID, @ProjectShipmentID, @SeqNo, @Date, @EnteredBy_UserID, @Source, @Initiator, @Reason, @ReasonNotes, 
                @ApprovalCode, @Description, @NumPanels, @Amount, @IsCommissionable, @DateDue, @DateRecd, @Status)"
                   SelectCommand="SELECT ProjectID, ProjectChangeOrderID, ProjectShipmentID, SeqNo, Date, EnteredBy_UserID, Source, Initiator, Reason, ReasonNotes, 
                ApprovalCode, Description, NumPanels, Amount, IsCommissionable, DateDue, DateRecd, Status 
                FROM tblProjectChangeOrder WHERE (ProjectChangeOrderID = @PCOID)"
                   UpdateCommand="UPDATE tblProjectChangeOrder SET ProjectID = @ProjectID, ProjectShipmentID = @ProjectShipmentID, SeqNo = @SeqNo, Date = @Date, 
                EnteredBy_UserID = @EnteredBy_UserID, Source = @Source, Initiator = @Initiator, Reason = @Reason, ReasonNotes = @ReasonNotes, ApprovalCode = @ApprovalCode, 
                Description = @Description, NumPanels = @NumPanels, Amount = @Amount, IsCommissionable = @IsCommissionable, DateDue = @DateDue, DateRecd = @DateRecd, Status = @Status 
                WHERE ProjectChangeOrderID = @PCOID">
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
        <asp:QueryStringParameter Name="ProjectID" QueryStringField="ProjectID" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="ProjectID" QueryStringField="ProjectID" Type="Int32" />
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
                   SelectCommand="SELECT ProjectShipmentID, ShipmentNo FROM tblProjectShipment WHERE (ProjectID = @ProjectID)">
    <SelectParameters>
        <%--<asp:Parameter Name="ProjectID" Type="String" DefaultValue="0"/>--%>
        <asp:QueryStringParameter Name="ProjectID" QueryStringField="ProjectID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlEnteredBySQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>"
                   SelectCommand="SELECT u.UserID, e.Name FROM tblEmployee AS e INNER JOIN tblUser AS u ON e.EmployeeID = u.EmployeeID ORDER BY e.Name">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlInitiatorSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
    SelectCommand="SELECT [FieldValue], [FieldName] FROM [tblProjectChangeOrderLookup] WHERE ([FieldName] = @FieldName)">
    <SelectParameters>
        <asp:Parameter DefaultValue="Initiator" Name="FieldName" Type="String"/>
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DdlReasonSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicTestConnectionString %>" 
    SelectCommand="SELECT [FieldValue], [FieldName] FROM [tblProjectChangeOrderLookup] WHERE ([FieldName] = @FieldName)">
    <SelectParameters>
        <asp:Parameter DefaultValue="Reason" Name="FieldName" Type="String"/>
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>