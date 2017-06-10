<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QRGenerator.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Simulator.QRGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
     <br />
    <div>
        <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
<asp:Button ID="btnGenerate" runat="server" Text="Generate" onclick="btnGenerate_Click" />
<hr />
<asp:PlaceHolder ID="plBarCode" runat="server" />
    </div>

</asp:Content>
