using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace _3d2.pages
{
    public partial class search_word : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string s = "";
                if (Request.QueryString["q"] == null || Request.QueryString["txt_num"] == null)
                    return;
                else
                    s = Request.QueryString["q"].ToString();

                int txt_num = 0;
                if (!int.TryParse(Request.QueryString["txt_num"].ToString(), out txt_num)) return;

                if (txt_num == 1)
                    search_city(s);
                else if (txt_num == 2)
                {
                    string city = "";
                    if (Request.QueryString["city_list"] != null) city = Request.QueryString["city_list"].ToString();

                    search_rest(s, city);
                }
                else if (txt_num == 3)
                {
                    string city = "";
                    if (Request.QueryString["rest_list"] != null) city = Request.QueryString["rest_list"].ToString();

                    search_food(s,city);
                }
                else if (txt_num == 4)
                {
                    string city = "";
                    if (Request.QueryString["city_list"] != null) city = Request.QueryString["city_list"].ToString();

                    search_area(s, city);
                }
            }
            catch (Exception)
            {
                return;
            }
            

        }

        void search_city(string s) {
            try
            {
                DataTable dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_city N'" + s + "'");
                for (int i = 0; i < dt.Rows.Count; i++)
                    myul.InnerHtml += @"<li><div class='hidden'>" + dt.Rows[i][0].ToString() + @"</div>" + dt.Rows[i][1].ToString() + @"</li>";
            }
            catch (Exception err)
            {
                throw err;
            }
        } // search_city


        void search_rest(string q,string cityes)
        {
            try
            {

                cityes = cityes.Trim();
                DataTable dt_cityes = extract_words(cityes);
                string str_cityes = ",";

                for (int i = 0; i < dt_cityes.Rows.Count; i++)
                    str_cityes += dt_cityes.Rows[i][0].ToString() + ",";


                DataTable dt;
                if (cityes == "")
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_rest_not_sensitiv '" + q + "'");
                else
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_rest_sensitive '" + q + "','" + str_cityes + "'");


                for (int i = 0; i < dt.Rows.Count; i++)
                    myul.InnerHtml += @"<li><div class='hidden'>" + dt.Rows[i][0].ToString() + @"</div>" + dt.Rows[i][1].ToString() + @"</li>";

            }
            catch (Exception err)
            {
                throw err;
            }
        } // search_rest


        void search_food(string q,string city_list)
        {
            try
            {
                DataTable dt_cityes = extract_words(city_list);
                string str_cityes = ",";

                for (int i = 0; i < dt_cityes.Rows.Count; i++)
                    str_cityes += dt_cityes.Rows[i][0].ToString() + ",";


                DataTable dt;
                if (city_list == "")
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_all '" + q + "'");
                else
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv '" + q + "','" + str_cityes + "'");


                for (int i = 0; i < dt.Rows.Count; i++)
                    myul.InnerHtml += @"<li><div class='hidden'>" + dt.Rows[i][0].ToString() + @"</div>" + dt.Rows[i][1].ToString() + @"</li>";

            }
            catch (Exception err)
            {
                throw err;
            }

        } // search_food


        DataTable extract_words(string s)
        {
            DataTable dt = new DataTable();
            try
            {
                s = s.Trim();
                
                dt.Columns.Add("word");

                string item = "";
                for (int i = 0; i < s.Length; i++)
                {
                    if (s[i] == ',' || s[i] == ' ')
                    {
                        if (item == "") continue;

                        dt.Rows.Add(item);
                        item = "";
                        continue;
                    }

                    item += s[i];
                    if (i + 1 == s.Length) dt.Rows.Add(item);
                }
            }
            catch (Exception err)
            {
                throw err;
            }
            return dt;

        }// extract words

        void search_area(string q, string cityes)
        {
            try
            {

                cityes = cityes.Trim();
                DataTable dt_cityes = extract_words(cityes);
                string str_cityes = ",";

                for (int i = 0; i < dt_cityes.Rows.Count; i++)
                    str_cityes += dt_cityes.Rows[i][0].ToString() + ",";


                DataTable dt;
                //if (cityes == "")
                //    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_area_not_sensitiv '" + q + "'");
                //else
                //    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_area_sensitiv '" + q + "','" + str_cityes + "'");

                dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_city '" + q + "'");
                

                for (int i = 0; i < dt.Rows.Count; i++)
                    myul.InnerHtml += @"<li><div class='hidden'>" + dt.Rows[i][0].ToString() + @"</div>" + dt.Rows[i][1].ToString() + @"</li>";

            }
            catch (Exception err)
            {
                throw err;
            }
        } // search_rest


    }
}