using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeDuo.MobileApi.Controllers
{
    public class AccountsController : ApiController
    {
        public IHttpActionResult GetAccountBalance(string id,string currency)
        {
            DataAccess.User user;
        
            // Retrieve User and Merchant account id's from database
            using (DataAccess.CodeDuoTestEntities entities = new DataAccess.CodeDuoTestEntities())
            {
                int idint = int.Parse(id);
               
                user = entities.Users.FirstOrDefault(e => e.Id == idint);
                
            }
            double rate=1;
            Models.AccountBalance accountBalance = new Models.AccountBalance();
            switch (currency)
            {
                case "EUR":
                     accountBalance = DataAccess.bocApi.GetAccountBalance(user.AccountId, "5710bba5d42604e4072d1e92");
                    break;
                case "BTC":
                    accountBalance = DataAccess.bocApi.GetAccountBalance(user.AccountId, "5710bba5d42604e4072d1e92");
                    accountBalance.currency = "BTC";
                    rate = DataAccess.bitCoinAPI.GetBitCoinRate();
                    accountBalance.balance = accountBalance.balance / rate;
                    break;
                default:
                    break;
            }

          
            if (accountBalance == null)
            {
                return NotFound();
            }
            return Ok(accountBalance);
        }

    }
}
