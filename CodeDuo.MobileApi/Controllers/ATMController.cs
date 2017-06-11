using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeDuo.MobileApi.Controllers
{
    public class ATMController : ApiController
    {
        [HttpGet]
        public IHttpActionResult GetATMS()
        {


            Models.ATM[] atms = new Models.ATM[] { };
            // Retrieve User and Merchant account id's from database
            atms = DataAccess.bocApi.GetATMS();




            return Ok(atms);
        }
    }
}
