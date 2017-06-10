using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeDuo.MobileApi.Controllers
{
    public class AcceptPaymentsController : ApiController
    {
        [HttpGet]
        public IHttpActionResult AcceptPayments(string id)
        {
           
            DataAccess.Merchant merchant;
            Models.AcceptPayment acceptPayment = new Models.AcceptPayment();
            // Retrieve User and Merchant account id's from database
            using (DataAccess.CodeDuoTestEntities entities = new DataAccess.CodeDuoTestEntities())
            {
                int idint = int.Parse(id);
               merchant = entities.Merchants.FirstOrDefault(m => m.Id == idint);
            }
            if (merchant == null)
            {
                acceptPayment.CanAccept = "false";
                
            }
            acceptPayment.CanAccept = "true";
            return Ok(acceptPayment);
        }
    }
}
