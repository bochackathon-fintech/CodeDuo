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
            Models.AccountBalance accountBalance = new Models.AccountBalance();
            switch (currency)
            {
                case "EUR":
                     accountBalance = DataAccess.bocApi.GetAccountBalance(user.AccountId, "5710bba5d42604e4072d1e92");
                    break;
                case "BTC":
                    accountBalance = DataAccess.bocApi.GetAccountBalance(user.AccountId, "5710bba5d42604e4072d1e92");
                    accountBalance.currency = "BTC";
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
