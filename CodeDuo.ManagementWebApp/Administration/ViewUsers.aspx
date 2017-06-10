<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Administration.ViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <div>
        <fieldset>
            <legend>Users </legend>
            <div class="tablediv">
                <asp:GridView ID="gridUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="UsersTable" CssClass="GridViewStyle" Width="1200px">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                        <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo"></asp:BoundField>
                        <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN"></asp:BoundField>
                        <asp:BoundField DataField="AccountId" HeaderText="AccountId" SortExpression="AccountId"></asp:BoundField>
                        <asp:BoundField DataField="CarRegistrationNo" HeaderText="CarRegistrationNo" SortExpression="CarRegistrationNo"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="UsersTable" ConnectionString='<%$ ConnectionStrings:CodeDuoTestConnectionString %>' SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
            </div>
        </fieldset>


    </div>
</asp:Content>
