using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeDuo.MobileApi.Models
{
    public class AccountBalance
    {
        public string label { get; set; }
        public string number { get; set; }
        public string iban { get; set; }
        public double balance { get; set; }
        public string currency { get; set; }

    }
}