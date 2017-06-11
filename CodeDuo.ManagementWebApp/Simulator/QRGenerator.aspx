<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QRGenerator.aspx.cs" Inherits="CodeDuo.ManagementWebApp.Simulator.QRGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <br />
    <div>
        <fieldset>
            <legend>QR Generator</legend>

            <div class="tablediv">
                <asp:DropDownList ID="ddlAvailableQR" runat="server" OnSelectedIndexChanged="ddlAvailableQR_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Selected="True" Value="1">Merchant QR</asp:ListItem>
                    <asp:ListItem Value="2">Transaction QR - P2P</asp:ListItem>
                    <asp:ListItem Value="3">Transaction QR - P2B</asp:ListItem>
                    <asp:ListItem Value="4">ContactDetails QR</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <div class="tablediv">
                <asp:Panel runat="server" ID="pnlMerchant" Visible="true">
                    <asp:Label ID="lblMerchantID" runat="server" Text="Merchant Id" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtmerchantid" runat="server"></asp:TextBox>
                    <asp:Button ID="btnGenerateMerchant" runat="server" Text="Generate" OnClick="btnGenerateMerchant_Click" />

                </asp:Panel>
                <asp:Panel runat="server" ID="pnltrxP2P" Visible="false">
                    <asp:Label ID="lbluserid" runat="server" Text="User Id" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblp2pAmount" runat="server" Text="Amount" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtp2pAmount" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblp2pReference" runat="server" Text="Transaction Reference" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtp2pReference" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblp2pCurrency" runat="server" Text="Currency" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlp2pCurrency" runat="server">
                        <asp:ListItem Selected="True" Value="EUR">EURO</asp:ListItem>
                        <asp:ListItem Value="BIT">BitCoin</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnTrxP2P" runat="server" Text="Generate" OnClick="btnTrxP2P_Click" />

                </asp:Panel>
                <asp:Panel runat="server" ID="pnltrxP2B" Visible="false">
                    <asp:Label ID="lblp2bMerchantID" runat="server" Text="Merchant Id" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtp2bmerchantid" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Amount" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtp2bAmount" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblp2bReference" runat="server" Text="Transaction Reference" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtp2bReference" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblp2bCurrency" runat="server" Text="Currency" Width="100px"></asp:Label>
                    <asp:DropDownList ID="ddlp2bCurrency" runat="server">
                        <asp:ListItem Selected="True" Value="EUR">EURO</asp:ListItem>
                        <asp:ListItem Value="BTC">BitCoin</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnTrxP2B" runat="server" Text="Generate" OnClick="btnTrxP2B_Click" />

                </asp:Panel>
                <asp:Panel runat="server" ID="pnlContact" Visible="false">
                    <asp:Label ID="lblType" runat="server" Text="Type" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtType" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblContactid" runat="server" Text="ID" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtContactID" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblName" runat="server" Text="First Name" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtcontactname" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtcontactlastname" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Default Currency" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtDefaultCurrency" runat="server"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Alternate Currency" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtalternateCurrency" runat="server"></asp:TextBox>
                    <br />

                    <asp:Label ID="Label1" runat="server" Text="Date of Birth" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtcontactDOB" runat="server"></asp:TextBox>
                    <br />

                    <asp:Label ID="Label5" runat="server" Text="Language" Width="100px"></asp:Label>
                    <asp:TextBox ID="txtLanguage" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnContactDetails" runat="server" Text="Generate" OnClick="btnContactDetails_Click" />

                </asp:Panel>
            </div>
        </fieldset>
        <hr />
        <asp:PlaceHolder ID="plBarCode" runat="server" />
    </div>

</asp:Content>
