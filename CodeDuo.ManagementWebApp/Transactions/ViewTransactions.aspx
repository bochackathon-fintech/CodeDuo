<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTransactions.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Transactions.ViewTransactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
     <br />
     <br />
     <div>
        <fieldset>
            <legend>Transaction List </legend>
            <div class="tablediv  ">
                <asp:GridView ID="gridTransactions" runat="server" DataSourceID="TransactionsData" AutoGenerateColumns="False" DataKeyNames="TransactionId,Id" CssClass="GridViewStyle" Width="1200px">
                     <FooterStyle CssClass="GridViewFooterStyle" />
    <RowStyle CssClass="GridViewRowStyle" />    
    <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
    <PagerStyle CssClass="GridViewPagerStyle" />
    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="TransactionId" HeaderText="TrxId" ReadOnly="True" InsertVisible="False" SortExpression="TransactionId"></asp:BoundField>
                       <%-- <asp:BoundField DataField="MerchantId" HeaderText="MerchantId" SortExpression="MerchantId"></asp:BoundField>--%>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId"></asp:BoundField>
                        <asp:BoundField DataField="MerchantReference" HeaderText="Reference" SortExpression="MerchantReference" ItemStyle-Width="150px"></asp:BoundField>
                        <asp:BoundField DataField="FromAccountId" HeaderText="From AccountId" SortExpression="FromAccountId" ItemStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField DataField="ToAccountId" HeaderText="To AccountId" SortExpression="ToAccountId" ItemStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" ItemStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" ItemStyle-Width="50px"></asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ItemStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" ItemStyle-Width="150px"></asp:BoundField>
                       <%-- <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="Id"></asp:BoundField>--%>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="150px"></asp:BoundField>
                       <%-- <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ItemStyle-Width="150px"></asp:BoundField>--%>
                        <asp:BoundField DataField="IBAN" HeaderText="Destination IBAN" SortExpression="IBAN" ItemStyle-Width="150px"></asp:BoundField>
                      <%--  <asp:BoundField DataField="AccountId" HeaderText="Destination AccountId" SortExpression="AccountId"></asp:BoundField>--%>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" ItemStyle-Width="50px"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="TransactionsData" ConnectionString='<%$ ConnectionStrings:CodeDuoTestConnectionString %>' SelectCommand="GetTransactionList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </fieldset>
        

    </div>
</asp:Content>
