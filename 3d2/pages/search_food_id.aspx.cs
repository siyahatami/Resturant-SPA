using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace _3d2.pages
{
    public partial class search_food_id : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["count_or_index"]== null || Request.QueryString["food_ids"]== null || Request.QueryString["rest_list"]== null || Request.QueryString["city_list"]== null ) return;

            int COI=0;
            if (!int.TryParse(Request.QueryString["count_or_index"].ToString(),out COI)) return;

            try
            {

                string food_ids = Request.QueryString["food_ids"].ToString();
                DataTable dt = classes.bll.extract_words(food_ids);
                food_ids = classes.bll.combine_words(dt, 0);
                if (dt.Rows.Count == 0)
                    food_ids = classes.bll.combine_words(classes.cls_Dal.execScriptDtRet("select food_id from tbl_foods"), 0);


                dt = classes.bll.extract_words(Request.QueryString["rest_list"].ToString());
                string rest_list = classes.bll.combine_words(dt, 0);
                int rest_count = dt.Rows.Count;

                dt = classes.bll.extract_words(Request.QueryString["city_list"].ToString());
                string city_list = classes.bll.combine_words(dt, 0);
                int city_count = dt.Rows.Count;

                if (COI == 0)
                {
                    if (rest_count > 0)
                        div_count.InnerHtml = search_foods_sensitiv_to_rest(COI, food_ids, rest_list, city_list);
                    else if (rest_count == 0 && city_count == 0)
                        div_count.InnerHtml = search_foods_all(COI, food_ids, rest_list, city_list);
                    else if (rest_count == 0 && city_count > 0)
                        div_count.InnerHtml = search_foods_sensitiv_to_city(COI, food_ids, rest_list, city_list);

                }
                else
                {
                    string food_id = "";
                    if (rest_count > 0)
                        food_id = search_foods_sensitiv_to_rest(COI, food_ids, rest_list, city_list);
                    else if (rest_count == 0 && city_count == 0)
                        food_id = search_foods_all(COI, food_ids, rest_list, city_list);
                    else if (rest_count == 0 && city_count > 0)
                        food_id = search_foods_sensitiv_to_city(COI, food_ids, rest_list, city_list);

                    string desc = "0";
                    if (Request.QueryString["desc"] != null)
                        if (Request.QueryString["desc"].ToString() == "1") desc = "1";
                    Response.Redirect("food_page.aspx?rest_food_id=" + food_id + "&desc=" + desc);

                }
            }
            catch (Exception err)
            {
                throw err;
            }
        }//load


        string search_foods_all(int count_or_index, string q,string rest_list,string city_list)
        {
            try
            {
                DataTable dt;
                if (count_or_index == 0)
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_all_count_or_inde'" + q + "',0");
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_all_count_or_inde'" + q + "'," + count_or_index.ToString());
                    return dt.Rows[0]["rest_food_id"].ToString();
                }

            }
            catch (Exception err)
            {
                throw err;
            }

            return "";
        }

        string search_foods_sensitiv_to_rest(int count_or_index, string q, string rest_list, string city_list)
        {
            try
            {
                DataTable dt;
                if (count_or_index == 0)
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv_count_or_index  '" + q + "','" + rest_list + "',0");
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv_count_or_index  '" + q + "','" + rest_list + "'," + count_or_index);
                    return dt.Rows[0]["rest_food_id"].ToString();
                }

            }
            catch (Exception err)
            {
                throw err;
            }
            return "";

        }

        string search_foods_sensitiv_to_city(int count_or_index, string q, string rest_list, string city_list)
        {
            try
            {
                DataTable dt;
                if (count_or_index == 0)
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_extract_rest_from_city_list '" + city_list + "'");
                    string rests = classes.bll.combine_words(dt, 0);

                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv_count_or_index  '" + q + "','" + rests + "',0");
                    return dt.Rows[0][0].ToString();

                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv_count_or_index  '" + q + "','" + rest_list + "',0");
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_extract_rest_from_city_list '" + city_list + "'");
                    string rests = classes.bll.combine_words(dt, 0);

                    dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_search_foods_sensitiv_count_or_index  '" + q + "','" + rests + "'," + count_or_index);
                    return dt.Rows[0]["rest_food_id"].ToString();
                }

            }
            catch (Exception err)
            {
                throw err;
            }
            return "";

        }



    }
}