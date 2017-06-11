using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace CodeDuo.MobileApi.DataAccess
{
    public class bitCoinAPI
    {
        static public double GetBitCoinRate()
        {


            var uri = "https://chain.so/api/v2/get_price/BTC/EUR";

            double rate=1;
            var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(uri);
           
         
            using (var response = webrequest.GetResponse())
            using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
            {
                //var result = ;
                dynamic results = JsonConvert.DeserializeObject<dynamic>(reader.ReadToEnd());

                rate = results.data.prices[0].price;
                
            }
            return rate;
        }

        static public object GetWalletbalance(string cryptocurrency,string address)
        {


            var uri = string.Format("https://chain.so/api/v2/get_address_balance/{0}/{1}",cryptocurrency,address);

            
            var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(uri);

            var result= new object();
            using (var response = webrequest.GetResponse())
            using (var reader = new System.IO.StreamReader(response.GetResponseStream()))
            {
                
                dynamic results = JsonConvert.DeserializeObject<dynamic>(reader.ReadToEnd());

                result = results;

            }
            return result;
        }
        static public Models.Transfer MakeCryptoTransfer(string fromaccountid, string toaccountid, double amount, string reference)
        {
            Models.Transfer transfer = new Models.Transfer();
            transfer.amount = amount;
            transfer.completed = "COMPLETED";
            transfer.currency = "BTC";
            transfer.description = reference;
            transfer.from_account = fromaccountid;
            transfer.status = "COMPLETED";
            transfer.other_account = toaccountid;
            return transfer;

        }
    }
}