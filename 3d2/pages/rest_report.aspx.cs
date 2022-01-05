using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

namespace _3d2.pages
{
    public partial class rest_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null) Response.Redirect("login.aspx");
            GridView2.DataSource = "";
            GridView2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
            Calendar2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            Calendar2.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            Calendar2.Visible = false;

            show_result();
        }


        void show_result() {
            string start_date = Calendar1.SelectedDate.Year.ToString() + "-" + Calendar1.SelectedDate.Month.ToString() + "-" + Calendar1.SelectedDate.Day.ToString();
            string end_date = Calendar2.SelectedDate.Year.ToString() + "-" + Calendar2.SelectedDate.Month.ToString() + "-" + Calendar2.SelectedDate.Day.ToString();

            //Response.Redirect("rest_report.aspx?order_state=" + DropDownList1.SelectedValue.ToString()+"&start_date="+start_date+"&end_date="+end_date);
            string script = "exec dbo.report_order_titles " + Session["user_id"] + "," + DropDownList1.SelectedValue.ToString() + ",'" + start_date + "' ,'" + end_date + "'";
            DataTable dt = classes.cls_Dal.execScriptDtRet(script);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Write(e.CommandArgument);
            if (e.CommandName == "show_daitels")
            {
                string food_rest_id = GridView1.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;

                string script = "select * from tbl_order_content a where a.order_title_id=" + food_rest_id;
                DataTable dt = classes.cls_Dal.execScriptDtRet(script);

                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            else if (e.CommandName == "btn_change")
            {
                string order_title_id = GridView1.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;
                DropDownList d = (DropDownList)GridView1.Rows[Convert.ToInt16(e.CommandArgument)].FindControl("dropdownlist_state");

                classes.cls_Dal.execScriptDtRet( "update tbl_order_title set order_state="+d.SelectedValue+" where order_title_id="+order_title_id);
                show_result();
            }

        }





    }
}