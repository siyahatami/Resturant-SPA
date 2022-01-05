using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;


namespace _3d2.pages
{
    public partial class user_address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
	        {	        
		        if (Request.QueryString["phone_number"] == null) return;
                string phone = Request.QueryString["phone_number"].ToString().Trim();
                if (phone.Contains(" ")) return;

                DataTable dt = classes.cls_Dal.execScriptDtRet("exec dbo.proc_get_user_address_from_phone '" + phone + "'");

                for (int i = 0; i < dt.Rows.Count;i++ )
                    form1.InnerHtml += @"<div>" + dt.Rows[i]["user_address"] + @"<hr/></div>";

            }
	        catch (Exception)
	        {
                return;
	        }


        }
    }
}