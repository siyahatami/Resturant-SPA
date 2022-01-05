using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _3d2.pages
{
    public partial class new_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
                Response.Redirect("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txt_new_food.Text.Trim() != "")
            {
                classes.cls_Dal.execScriptDtRet("insert into tbl_foods values('" + txt_new_food.Text + "')");
                Response.Redirect(Request.Url.ToString());
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            classes.cls_Dal.execScriptDtRet("insert into tbl_rests_foods values ("+Session["user_id"].ToString()+","+ListBox1.SelectedValue.ToString()+","+txt_price.Text+","+txt_count.Text+","+txt_max.Text+",'true','"+txt_desc.InnerText+"')");

            Response.Write("ثبت غذا با موفقیت انجام گرفت");
        }
    }
}