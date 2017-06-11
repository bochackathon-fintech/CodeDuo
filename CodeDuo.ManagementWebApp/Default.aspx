<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CodeDuo.ManagementWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>AllPay</h1>
        <p class="lead"> AllPay is an innovative Mobile App that enables Mobile Payments and Transfers using QR Codes. 
        </p>
          <div class="row">
              <div class="col-md-2">
                  <asp:PlaceHolder ID="plBarCode" runat="server" />
                  </div>
                <div class="col-md-2">
                    
                    <asp:Image ID="imgbitcoin" ImageUrl="~/images/bitcoin.png" Width="120px" Height="120px" runat="server" />
                  </div>
               <div class="col-md-2">
                    
                    <asp:Image ID="imgdash" ImageUrl="~/images/dash.png" Width="120px" Height="120px" runat="server" />
                  </div>
               <div class="col-md-2">
                    
                    <asp:Image ID="imglitecoin" ImageUrl="~/images/litecoin.png" Width="120px" Height="120px" runat="server" />
                  </div>
               <div class="col-md-2">
                    
                    <asp:Image ID="imgdogecoin" ImageUrl="~/images/dogecoin.jpg" Width="120px" Height="120px" runat="server" />
                  </div>
              </div>
        <%--<p> <asp:PlaceHolder ID="plBarCode" runat="server" /></p>--%>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Retail Store Payments</h2>
            <p>
                Make direct payments to any retail store using AllPay!
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Person to Person Transfers</h2>
            <p>
               Transfer Money to any other person using AllPay!
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Parking Ticket Payments</h2>
            <p>
                Pay your Parking Ticket without searching for coins using AllPay !
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
         <div class="col-md-4">
            <h2>Utility Bill Payment</h2>
            <p>
                Scan the QR Code on your Utility Bill invoice and pay directly from your bank account using AllPay !
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
          <div class="col-md-4">
            <h2>Wedding Gift Transfer</h2>
            <p>
                Your guests can transfer their money gift directly to your bank account using AllPay !
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
         <div class="col-md-4">
            <h2>Receive Donations</h2>
            <p>
                Accept Donations directly to your bank account using AllPay !
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
       
    </div>

</asp:Content>
