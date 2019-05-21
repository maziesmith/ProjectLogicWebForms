<%@ Page Title="Booking Forms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BFIndex.aspx.cs" Inherits="ProjectLogic.BFList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <br />
    <table runat="server">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Project #: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProjectID" runat="server"></asp:TextBox>
            </td>
        </tr>
        
    </table>
    <br />
    <asp:Button ID="btnSearch" runat="server" OnCommand="btnSearch_Click" Text="Search" />
    <br />
    <br />
    <asp:ListView ID="lvBFList" runat="server" OnItemCommand="lvBFList_ItemCommand" DataKeyNames="BookingFormID" DataSourceID="lvBFListSQL">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <a href="/ProjectLogic/BookingForm/<%# Eval("BookingFormID") %>">
                        <asp:Label ID="BookingFormIDLabel" runat="server" Text='<%# Eval("BookingFormID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="ReleaseNumLabel" runat="server" Text='<%# Eval("ReleaseNum") %>' />
                </td>
                <td>
                    <asp:Label ID="ReleaseDescLabel" runat="server" Text='<%# Eval("ReleaseDesc") %>' />
                </td>
                <td>
                    <asp:Label ID="NumPanelsThisReleaseLabel" runat="server" Text='<%# Eval("NumPanelsThisRelease") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReleasedByPMCheckBox" runat="server" Checked='<%# Eval("ReleasedByPM") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="ProgrammingCompleteCheckBox" runat="server" Checked='<%# Eval("ProgrammingComplete") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="ProductionCompleteCheckBox" runat="server" Checked='<%# Eval("ProductionComplete") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DateDimsApprovedLabel" runat="server" Text='<%# Eval("DateDimsApproved", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="ActEngRelDateLabel" runat="server" Text='<%# Eval("ActEngRelDate", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="ActProjShipDateLabel" runat="server" Text='<%# Eval("ActProjShipDate", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Eval("CreatedBy") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No Booking Forms found for Project # <asp:Label ID="lblProjectID" runat="server" />.</td>
                </tr>
                <tr></tr>
                <tr>
                    <td><asp:LinkButton ID="btnNewBookingForm" runat="server" CommandName="NewInsert" Text="New Booking Form" /></td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <a href="/ProjectLogic/BookingForm/<%# Eval("BookingFormID") %>">
                        <asp:Label ID="BookingFormIDLabel" runat="server" Text='<%# Eval("BookingFormID") %>' />
                    </a>
                </td>
                <td>
                    <asp:Label ID="ReleaseNumLabel" runat="server" Text='<%# Eval("ReleaseNum") %>' />
                </td>
                <td>
                    <asp:Label ID="ReleaseDescLabel" runat="server" Text='<%# Eval("ReleaseDesc") %>' />
                </td>
                <td>
                    <asp:Label ID="NumPanelsThisReleaseLabel" runat="server" Text='<%# Eval("NumPanelsThisRelease") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="ReleasedByPMCheckBox" runat="server" Checked='<%# Eval("ReleasedByPM") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="ProgrammingCompleteCheckBox" runat="server" Checked='<%# Eval("ProgrammingComplete") %>' Enabled="false" />
                </td>
                <td>
                    <asp:CheckBox ID="ProductionCompleteCheckBox" runat="server" Checked='<%# Eval("ProductionComplete") %>' Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="DateDimsApprovedLabel" runat="server" Text='<%# Eval("DateDimsApproved", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="ActEngRelDateLabel" runat="server" Text='<%# Eval("ActEngRelDate", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="ActProjShipDateLabel" runat="server" Text='<%# Eval("ActProjShipDate", "{0:MM-dd-yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Eval("CreatedBy") %>' />
                </td>
            </tr>
        </ItemTemplate>

        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server">BFID</th>
                                <th runat="server">Release&nbsp#</th>
                                <th runat="server">Description</th>
                                <th runat="server">#&nbspPanels</th>
                                <th runat="server">Rel By PM</th>
                                <th runat="server">Prog Complete</th>
                                <th runat="server">Prod Complete</th>
                                <th runat="server">Date Dims Appr</th>
                                <th runat="server">Eng Release Date</th>
                                <th runat="server">Ship Date</th>
                                <th runat="server">Created By</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="False" ShowLastPageButton="False" ShowNextPageButton="false" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="False" ShowLastPageButton="False" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
            <asp:LinkButton ID="btnNewBookingForm" runat="server" CommandName="NewInsert" Text="New Booking Form" />
        </LayoutTemplate>
    </asp:ListView>

        <asp:SqlDataSource ID="lvBFListSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
            SelectCommand="SELECT [ProjectID], [ProjectName], [BookingFormID], [ReleaseNum], [NumPanelsThisRelease], [ReleasedByPM], [ProgrammingComplete], 
            [ProductionComplete], [DateDimsApproved], [ReleaseDesc], [ActEngRelDate], [ActProjShipDate], [CreatedBy] 
            FROM [vueBookingForm] 
            WHERE ([ProjectID] = @ProjectID) ORDER BY [ReleaseNum]" CancelSelectOnNullParameter="False"
            InsertCommand="INSERT INTO tblBookingForm (ProjectID) VALUES (@ProjectID)">
            <SelectParameters>
                <asp:ControlParameter Name="ProjectID" ControlID="txtProjectID" Type="Int32" PropertyName="Text" ConvertEmptyStringToNull="true" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    <br />
</asp:Content>
