<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMerchants.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Administration.ViewMerchants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div>
        <fieldset>
            <legend>Merchants </legend>
            <div class="tablediv">
                <asp:GridView ID="gridMerchants" runat="server" DataSourceID="MerchantsView" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="GridViewStyle" Width="1200px">
                    <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
                    <PagerStyle CssClass="GridViewPagerStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                        <asp:BoundField DataField="IBAN" HeaderText="IBAN" SortExpression="IBAN"></asp:BoundField>
                        <asp:BoundField DataField="AccountId" HeaderText="AccountId" SortExpression="AccountId"></asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"></asp:BoundField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource runat="server" ID="MerchantsView" ConnectionString='<%$ ConnectionStrings:CodeDuoTestConnectionString %>' SelectCommand="SELECT * FROM [Merchants]"></asp:SqlDataSource>
            </div>
        </fieldset>


    </div>
</asp:Content>
