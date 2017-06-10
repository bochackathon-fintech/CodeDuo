using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Microsoft.CSharp;

namespace CodeDuo.MobileApi.Test
{
    [TestClass]
    public class MobileApi
    {
        [TestMethod]
        public void GetAccountBalance()
        {
           // var uri = "http://localhost:62417/api/Accounts/bda8eb884efcea209b2a6240"; //
            var uri = "http://codeduomobileapi.azurewebsites.net/api/Accounts/bda8eb884efcea209b2a6240";
            //var response =  client.GetAsync(uri);


            //var url = "http://localhost:8000/DEMOService/Client/156";
            var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(uri);
            webrequest.Headers.Add("Auth-Provider-Name", "01040939298400");
            webrequest.Headers.Add("Auth-ID", "123456789");
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "");
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "d4af6bd7a1164d8eb6c6fca3c72a809a");
            //Models.AccountBalance accountBalance = new Models.AccountBalance();
            string label="";
            using (var response = webrequest.GetResponse())
            using (var reader = new StreamReader(response.GetResponseStream()))
            {
                //var result = ;
                dynamic results = JsonConvert.DeserializeObject<dynamic>(reader.ReadToEnd());
                label = results.label.Value;


            }
            Assert.AreEqual((label.Length>0), true);
        }

        [TestMethod]
        public void Transfer()
        {
             var uri = "http://localhost:62417/api/Transfers/1"; //
            //var uri = "http://codeduomobileapi.azurewebsites.net/api/Accounts/bda8eb884efcea209b2a6240";
            //var response =  client.GetAsync(uri);


            //var url = "http://localhost:8000/DEMOService/Client/156";
            var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(uri);
           
                       webrequest.Headers.Add("Auth-Provider-Name", "01040939298400");
            webrequest.Headers.Add("Auth-ID", "123456789");
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "");
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "d4af6bd7a1164d8eb6c6fca3c72a809a");
            //Models.AccountBalance accountBalance = new Models.AccountBalance();
            string label = "";
            using (var response = webrequest.GetResponse())
            using (var reader = new StreamReader(response.GetResponseStream()))
            {
                //var result = ;
                dynamic results = JsonConvert.DeserializeObject<dynamic>(reader.ReadToEnd());
                label = results.label.Value;


            }
            Assert.AreEqual((label.Length > 0), true);
        }
    }
}
