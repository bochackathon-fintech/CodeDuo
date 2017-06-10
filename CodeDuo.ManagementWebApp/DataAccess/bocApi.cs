using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;

namespace CodeDuo.ManagementWebApp.DataAccess
{
    public class bocApi
    {
        static public void GetBanks()
        {
            
            var client = new HttpClient();
            var queryString = HttpUtility.ParseQueryString(string.Empty);

            // Request headers
            client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", "");
            client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", "c652825ba46c4101ade8dfb1ab1c5807");

            // Request parameters
            queryString["subscription-key"] = "c652825ba46c4101ade8dfb1ab1c5807";
            var uri = "http://api.bocapi.net/v1/api/banks?" + queryString;

            //var response =  client.GetAsync(uri);


            //var url = "http://localhost:8000/DEMOService/Client/156";
            var webrequest = (HttpWebRequest)System.Net.WebRequest.Create(uri);
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "");
            webrequest.Headers.Add("Ocp-Apim-Subscription-Key", "c652825ba46c4101ade8dfb1ab1c5807");
            using (var response = webrequest.GetResponse())
            using (var reader = new StreamReader(response.GetResponseStream()))
            {
                //var result = ;
                dynamic results = JsonConvert.DeserializeObject<dynamic>(reader.ReadToEnd());
                var id = results.banks[0].id;
                var name = results.banks[0].full_name.Value;
                string namestr = name.value;
            }
        }

    }
}