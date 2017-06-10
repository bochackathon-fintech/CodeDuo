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
        public IHttpActionResult GetTransfer(string id)
        {
            double amount = 12;
            string reference = "testrransfer";
            string fromaccountid = "e863600a86656f979d646e83";
            string toaccountid = "e863600a86656f979d646e83";
            var accountBalance = DataAccess.bocApi.Transfer(fromaccountid, toaccountid, amount);
           // var accountBalance = DataAccess.bocApi.GetAccountBalance(id, "5710bba5d42604e4072d1e92");
            if (accountBalance == null)
            {
                return NotFound();
            }
            return Ok(accountBalance);
        }
    }
}
