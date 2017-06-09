<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Administration.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <div>
    <ul >
                        <li><a runat="server" href="~/Administration/ViewUsers">Users</a></li>
                        <li><a runat="server" href="~/Administration/ViewMerchants">Administration</a></li>
                        <li><a runat="server" href="~/Contact">Merchants</a></li>
                         <li><a runat="server" href="~/Contact">Transactions</a></li>
                          <li><a runat="server" href="~/Contact">Simulator</a></li>
                    </ul>
        </div> 
</asp:Content>
