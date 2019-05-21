<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductionTracker.aspx.cs" Inherits="ProjectLogic.ProductionTracker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GvProdTracker" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlGvProdTracker">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Shipped" HeaderText="Shipped" SortExpression="Shipped" />
            <asp:BoundField DataField="ShipDate" HeaderText="ShipDate" SortExpression="ShipDate" />
            <asp:BoundField DataField="Via" HeaderText="Via" SortExpression="Via" />
            <asp:BoundField DataField="ProjectNum" HeaderText="ProjectNum" SortExpression="ProjectNum" />
            <asp:BoundField DataField="RelNum" HeaderText="RelNum" SortExpression="RelNum" />
            <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
            <asp:BoundField DataField="CityState" HeaderText="CityState" SortExpression="CityState" />
            <asp:BoundField DataField="Series" HeaderText="Series" SortExpression="Series" />
            <asp:BoundField DataField="TotalNumPanels" HeaderText="TotalNumPanels" SortExpression="TotalNumPanels" />
            <asp:BoundField DataField="RelDescription" HeaderText="RelDescription" SortExpression="RelDescription" />
            <asp:BoundField DataField="Standard" HeaderText="Standard" SortExpression="Standard" />
            <asp:BoundField DataField="Gluers" HeaderText="Gluers" SortExpression="Gluers" />
            <asp:BoundField DataField="Curved" HeaderText="Curved" SortExpression="Curved" />
            <asp:BoundField DataField="Complex" HeaderText="Complex" SortExpression="Complex" />
            <asp:BoundField DataField="OtherDesc" HeaderText="OtherDesc" SortExpression="OtherDesc" />
            <asp:BoundField DataField="PM" HeaderText="PM" SortExpression="PM" />
            <asp:BoundField DataField="Programmer" HeaderText="Programmer" SortExpression="Programmer" />
            <asp:BoundField DataField="EstRelToShop" HeaderText="EstRelToShop" SortExpression="EstRelToShop" />
            <asp:BoundField DataField="ProgActual" HeaderText="ProgActual" SortExpression="ProgActual" />
            <asp:BoundField DataField="InstallDrawingsRel" HeaderText="InstallDrawingsRel" SortExpression="InstallDrawingsRel" />
            <asp:BoundField DataField="MaterialForRelease" HeaderText="MaterialForRelease" SortExpression="MaterialForRelease" />
            <asp:BoundField DataField="InHouse" HeaderText="InHouse" SortExpression="InHouse" />
            <asp:BoundField DataField="SupportMatl" HeaderText="SupportMatl" SortExpression="SupportMatl" />
            <asp:BoundField DataField="PaintedExtrInHouse" HeaderText="PaintedExtrInHouse" SortExpression="PaintedExtrInHouse" />
            <asp:BoundField DataField="DateDueBack" HeaderText="DateDueBack" SortExpression="DateDueBack" />
            <asp:BoundField DataField="TruckingCompany" HeaderText="TruckingCompany" SortExpression="TruckingCompany" />
            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
            <asp:BoundField DataField="TruckAtMDSITime" HeaderText="TruckAtMDSITime" SortExpression="TruckAtMDSITime" />
            <asp:BoundField DataField="OnsiteDeliveryDate" HeaderText="OnsiteDeliveryDate" SortExpression="OnsiteDeliveryDate" />
            <asp:BoundField DataField="OnsiteDeliveryTime" HeaderText="OnsiteDeliveryTime" SortExpression="OnsiteDeliveryTime" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlGvProdTracker" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectLogicConnectionString %>" 
        SelectCommand="SELECT * FROM [tblProductionTracker] WHERE ([ProjectNum] IS NOT NULL)">

    </asp:SqlDataSource>

</asp:Content>
