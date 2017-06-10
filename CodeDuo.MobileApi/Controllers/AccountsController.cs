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
        public IHttpActionResult GetAccountBalance(string id)
        {
            var accountBalance = DataAccess.bocApi.GetAccountBalance(id, "5710bba5d42604e4072d1e92");
            if (accountBalance == null)
            {
                return NotFound();
            }
            return Ok(accountBalance);
        }

    }
}
