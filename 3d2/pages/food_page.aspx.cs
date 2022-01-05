using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace _3d2.pages
{
    public partial class food_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int rest_food_id=0;
            if (Request.QueryString["rest_food_id"] == null)
            {
                div_food.InnerText = "Not found";
                div_desc.InnerHtml = "";
                return;
            }
            else if (!int.TryParse(Request.QueryString["rest_food_id"].ToString(), out rest_food_id))
            { // can't convert id
                div_food.InnerText = "Not found";
                div_desc.InnerHtml = "";
                return;
            }

            if (Request.QueryString["desc"] == null || Request.QueryString["desc"].ToString() == "0")
            {
                try
                {
                    div_desc.InnerHtml = "";
                    DataTable dt = new DataTable();
                    dt = classes.cls_Dal.execScriptDtRet("	select top(1) * from 		(select   * from dbo.tbl_rests_foods a		join tbl_foods b on a.food_name_id=b.food_id) a	join tbl_rest b on a.rest_id=b.rest_id	where a.rest_food_id= " + rest_food_id.ToString());

                    if (dt.Rows.Count == 0)
                    {
                        div_food.InnerText = "Not found";
                        return;
                    }

                    div_food_id.InnerHtml = dt.Rows[0]["rest_food_id"].ToString();
                    div_food_name.InnerHtml = dt.Rows[0]["food_name"].ToString();
                    div_price.InnerHtml = dt.Rows[0]["food_price"].ToString();
                    div_rest_name.InnerHtml = dt.Rows[0]["rest_name"].ToString();
                    div_rest_address.InnerHtml = dt.Rows[0]["rest_address"].ToString();
                    div_rest_id.InnerHtml = dt.Rows[0]["rest_id"].ToString();
                    
                    int max_num= Math.Min(Convert.ToInt16(dt.Rows[0]["max_order"].ToString()),Convert.ToInt16(dt.Rows[0]["food_count"].ToString()));
                    if (dt.Rows[0]["check_count"].ToString() == "false") max_num = 1000;
                    div_max_number.InnerHtml = max_num.ToString();


                    if (dt.Rows[0]["food_count"].ToString() == "0")
                        div_can_order.InnerHtml = "Yes";
                    else
                        div_can_order.InnerHtml = "No";

                }//try
                catch (Exception)
                {
                    Response.Redirect("error_page.aspx");
                }

            } //there is no desc
            else // there is both food_id and desc
            {
                try
                {
                    div_food.InnerText = "";
                    DataTable dt = new DataTable();
                    dt = classes.cls_Dal.execScriptDtRet("select top(1) * from 		(select   * from dbo.tbl_rests_foods a		join tbl_foods b on a.food_name_id=b.food_id) a	join tbl_rest b on a.rest_id=b.rest_id	where a.rest_food_id= " + rest_food_id.ToString());

                    if (dt.Rows.Count == 0)
                    {
                        div_desc.InnerText = "Not found";
                        return;
                    }

                    div_food_desc.InnerHtml = dt.Rows[0]["food_desc"].ToString();
                    div_rest_desc.InnerHtml = dt.Rows[0]["rest_desc"].ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("error_page.aspx");
                }
                

            }// else and there is desc


        }// load





    }
}