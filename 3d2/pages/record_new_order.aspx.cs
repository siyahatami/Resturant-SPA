using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace _3d2.pages
{
    public partial class record_new_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div_result.Visible = false;
            if (Request.QueryString["rest_id"] == null || Request.QueryString["user_phone"] == null || Request.QueryString["user_Address"] == null || Request.QueryString["food_list"] == null) return;
            if (Request.QueryString["user_phone"].ToString().Trim().Contains(' ')) return;

            int rest_id = 0;
            if (!int.TryParse(Request.QueryString["rest_id"].ToString(), out rest_id)) return;


            DataTable dt = get_food_ids_and_counts(Request.QueryString["food_list"].ToString());
            // check kardane in ke aya ghazaha hame bara in resturan hast ya na
            if (dt.Rows.Count == 0 ||
                    classes.cls_Dal.execScriptDtRet("exec dbo.proc_is_true_food_list_to_rest " + rest_id.ToString() + ",'" + classes.bll.combine_words(dt, 0) + "'").Rows[0][0].ToString() != dt.Rows.Count.ToString()
                ) return;

            // tayine in ke hameye ghaza ha tedade sefaresheshun morede tayid hast ya na
            if (
                !is_all_food_counts_correct(
                                        classes.cls_Dal.execScriptDtRet("exec dbo.proc_get_food_ids_counts '" + classes.bll.combine_words(dt, 0) + "'")
                                        , dt)
                ) return;

            // anajame amaliyat

            SqlConnection tran_con = new SqlConnection(classes.cls_Dal.connectionString);
            SqlTransaction transaction;
            SqlDataAdapter adap = new SqlDataAdapter();
            tran_con.Open();
            adap.SelectCommand = new SqlCommand("", tran_con);
            transaction = tran_con.BeginTransaction();
            adap.SelectCommand.Transaction = transaction;

            try
            {
                DateTime t = DateTime.Now;
                string date = t.Date.Year.ToString() + "-" + t.Date.Month.ToString() + "-" + t.Date.Day.ToString();
                string time = t.Hour.ToString() + ":" + t.Minute.ToString() + ":" + t.Second.ToString();

                adap.SelectCommand.CommandText = "exec dbo.insert_new_order_title " + rest_id.ToString() + ",'" + Request.QueryString["user_phone"].ToString() + "','" + Request.QueryString["user_address"].ToString() + "','" + date + "','" + time + "'";
                DataTable temp_dt = new DataTable();
                adap.Fill(temp_dt);
                string order_title_id = temp_dt.Rows[0][0].ToString();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    adap.SelectCommand.CommandText = "exec dbo.add_new_order_content " + order_title_id.ToString() + "," + dt.Rows[i][0].ToString() + "," + dt.Rows[i][1].ToString();
                    adap.Fill(temp_dt);
                }
                transaction.Commit();
                tran_con.Close();

                div_fault.Visible = false;
                order_id.InnerHtml = order_title_id;
                dt = classes.cls_Dal.execScriptDtRet("select a.phone_number,a.user_name from tbl_rest_phone_book a where a.rest_id=" + rest_id.ToString());
                for (int i = 0; i < dt.Rows.Count; i++)
                    rest_phone.InnerHtml += @"<li>" + dt.Rows[i][1] + " " + dt.Rows[i][0] + @"</li>";


                dt = classes.cls_Dal.execScriptDtRet("select SUM( a.food_price*a.food_count) from tbl_order_content a where order_title_id=" + order_title_id.ToString());
                total_price.InnerHtml = dt.Rows[0][0].ToString();

                div_result.Visible = true;

            }
            catch (Exception sd)
            {
                transaction.Rollback();
                tran_con.Close();
                Response.Redirect("error_page.aspx");
            }

        }//load



        DataTable get_food_ids_and_counts(string list)
        {
            DataTable dt_list = classes.bll.extract_words(list);
            DataTable dt_result = new DataTable();
            dt_result.Columns.Add("rest_food_id");
            dt_result.Columns.Add("food_count");

            if (dt_list.Rows.Count % 2 != 0) return dt_result;

            for (int i = 0; i < dt_list.Rows.Count; i += 2)
                dt_result.Rows.Add(dt_list.Rows[i][0].ToString(), dt_list.Rows[i + 1][0].ToString());


            return dt_result;
        }


        bool is_all_food_counts_correct(DataTable dt1, DataTable dt2)
        {
            if (dt1.Rows.Count != dt2.Rows.Count) return false;

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                string food_id = dt1.Rows[i]["rest_food_id"].ToString();
                int max_count = Math.Min(Convert.ToInt16(dt1.Rows[i]["food_count"].ToString()), Convert.ToInt16(dt1.Rows[i]["max_order"].ToString()));
                if (dt1.Rows[i]["check_count"].ToString() == "0") continue;

                for (int j = 0; i < dt2.Rows.Count; i++)
                    if (dt2.Rows[j][0].ToString() == food_id.ToString() && Convert.ToInt16(dt2.Rows[j][0].ToString() == food_id.ToString()) > max_count) return false;

            }

            return true;
        }


    }
}