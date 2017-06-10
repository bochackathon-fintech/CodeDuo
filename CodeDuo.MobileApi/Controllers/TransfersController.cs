using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeDuo.MobileApi.Controllers
{
    public class TransfersController : ApiController
    {
        public IHttpActionResult GetTransfer(string id, string merchantid, double amount, string reference, string currency)
        {
            // double amount = 12;
            //string reference = "testrransfer";
            DataAccess.User user;
            DataAccess.Merchant merchant;
            // Retrieve User and Merchant account id's from database
            using (DataAccess.CodeDuoTestEntities entities = new DataAccess.CodeDuoTestEntities())
            {
                int idint = int.Parse(id);
                int merchid = int.Parse(merchantid);
                user = entities.Users.FirstOrDefault(e => e.Id == idint);
                merchant = entities.Merchants.FirstOrDefault(m => m.Id == merchid);
            }

            string fromaccountid = user.AccountId; //"e863600a86656f979d646e83";

            string toaccountid = merchant.AccountId;//"e863600a86656f979d646e83";
            var transfer = DataAccess.bocApi.Transfer(fromaccountid, toaccountid, amount, reference);
            // var accountBalance = DataAccess.bocApi.GetAccountBalance(id, "5710bba5d42604e4072d1e92");
            if (transfer == null)
            {
                return NotFound();
            }

            //Store Transaction details in SQL database
            // insert
            using (DataAccess.CodeDuoTestEntities entities = new DataAccess.CodeDuoTestEntities())
            {
                DataAccess.Transaction newTransaction = new DataAccess.Transaction();
                newTransaction.Amount = (decimal)amount;
                newTransaction.CreatedDate = DateTime.Now;
                newTransaction.Currency = "EUR";
                newTransaction.FromAccountId = user.IBAN;
                newTransaction.MerchantId = merchant.Id;
                newTransaction.MerchantReference = reference;
                newTransaction.Status = transfer.status;
                newTransaction.ToAccountId = merchant.IBAN;
                newTransaction.UserId = user.Id;
                var customers = entities.Transactions.Add(newTransaction);

                entities.SaveChanges();
            }
            if (transfer.status == "COMPLETED")
            {
                transfer.status = "SUCCESS";
            }
            else
            {
                transfer.status = "FAILED";
            }


            return Ok(transfer);
        }
    }
}
