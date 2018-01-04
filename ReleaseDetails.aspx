<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReleaseDetails.aspx.cs" Inherits="ProjectLogic.ReleaseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        window.onunload = refreshParent;

        function refreshParent() {
            window.opener.location.reload();
        }
    </script>

</asp:Content>
