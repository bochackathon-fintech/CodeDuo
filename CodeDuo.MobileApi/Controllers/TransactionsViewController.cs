using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeDuo.MobileApi.Controllers
{
    public class TransactionsViewController : ApiController
    {

        public IHttpActionResult GetTransactions(int id)
        {
            // double amount = 12;
            //string reference = "testrransfer";
           List< DataAccess.GetTransactionListByUserId_Result> transactions;
            int userId = id;
            // Retrieve User and Merchant account id's from database
            using (DataAccess.CodeDuoTestEntities entities = new DataAccess.CodeDuoTestEntities())
            {

                transactions = entities.GetTransactionListByUserId(userId).ToList();
                 
               
            }

          
            // var accountBalance = DataAccess.bocApi.GetAccountBalance(id, "5710bba5d42604e4072d1e92");
            if (transactions == null)
            {
                return NotFound();
            }

          

            return Ok(transactions);
        }
    }
}
