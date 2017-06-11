using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.IO;
using System.Drawing;

namespace CodeDuo.ManagementWebApp.Simulator
{
    public partial class QRGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGenerateMerchant_Click(object sender, EventArgs e)
        {
            string code = txtmerchantid.Text;
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData   = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;
            QRCode qrCode = new QRCode(qrCodeData);

            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                plBarCode.Controls.Add(imgBarCode);
            }
        }
        protected void btnTrxP2P_Click (object sender, EventArgs e)
        {
            string code =string.Concat(this.txtUserId.Text,";", this.txtp2pAmount.Text,";",this.txtp2pReference.Text,";",this.ddlp2pCurrency.SelectedValue);
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;
            QRCode qrCode = new QRCode(qrCodeData);

            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                plBarCode.Controls.Add(imgBarCode);
            }
        }
        protected void btnTrxP2B_Click(object sender, EventArgs e)
        {
            string code = string.Concat(this.txtp2bmerchantid.Text, ";", this.txtp2bAmount.Text, ";",this.txtp2bReference.Text, ";", this.ddlp2bCurrency.SelectedValue);
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;
            QRCode qrCode = new QRCode(qrCodeData);

            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                plBarCode.Controls.Add(imgBarCode);
            }
        }

        protected void btnContactDetails_Click(object sender, EventArgs e)
        {
            string code = string.Concat(this.txtType.Text, ";", this.txtContactID.Text, ";", this.txtcontactname.Text, ";", this.txtcontactlastname.Text, this.txtDefaultCurrency.Text, this.txtalternateCurrency.Text, this.txtcontactDOB.Text, this.txtLanguage.Text);
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
            System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
            imgBarCode.Height = 150;
            imgBarCode.Width = 150;
            QRCode qrCode = new QRCode(qrCodeData);

            using (Bitmap bitMap = qrCode.GetGraphic(20))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] byteImage = ms.ToArray();
                    imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                }
                plBarCode.Controls.Add(imgBarCode);
            }
        }

        protected void ddlAvailableQR_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.pnlMerchant.Visible = false;
            this.pnltrxP2B.Visible = false;
            this.pnltrxP2P.Visible = false;
            this.pnlContact.Visible = false;
            this.plBarCode.Controls.Clear();
            switch (this.ddlAvailableQR.SelectedValue)
            {
                case "1":
                    this.pnlMerchant.Visible = true;
                    break;
                case "2":
                    this.pnltrxP2P.Visible = true;
                    break;
                case "3":
                    this.pnltrxP2B.Visible = true;
                    break;
                case "4":
                    this.pnlContact.Visible = true;
                    break;
                default:
                    break;
            }
        }
    }
}