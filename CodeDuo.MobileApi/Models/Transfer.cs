using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeDuo.MobileApi.Models
{
    public class Transfer
    {
        public int transactionid { get; set; }
        public string merchantName { get; set; }
        public string description { get; set; }
        public string completed { get; set; }
        public string from_account { get; set; }
        public double amount { get; set; }
        public string currency { get; set; }
        public string other_account { get; set; }
        public string status { get; set; }
        public string createddate { get; set; }
    }
}