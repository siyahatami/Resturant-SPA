using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;


using System.Web.Script.Serialization;
using System.Web.Script.Services;


namespace _3d2
{
    
    [System.Web.Script.Services.ScriptService]
    public class public_searches : System.Web.Services.WebService
    {


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string sss()
        {
            return "hello";
        }// search 


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string search(string str_search,string type)
        {
            if (type == "city")
                return search_city(str_search);
            else if (type == "rest")
                return search_rest(str_search);
            else if (type == "food")
                return search_food(str_search);

            return "";
        }// search 


        string search_city(string str_search) {
            return "city";
        }// city

        string search_rest(string str_search)
        {
            return "rest";
        }// rest

        string search_food(string str_search)
        {
            return "food";
        }// food



    }
}
