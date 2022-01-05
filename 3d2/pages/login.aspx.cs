using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
namespace _3d2.pages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"]==null)
                LinkButton3.Visible = false;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string id= get_user_id(Login1.UserName, Login1.Password);
            if (id == "")
                e.Authenticated = false;
            else
            {
                Session["user_id"] = id;
                e.Authenticated = true;
                LinkButton3.Visible = true;
            }
                

        }


        string get_user_id(string username, string password)
        {

            if (username.Contains(" ") || password.Contains(" "))
                return "";
            
            DataTable dt= classes.cls_Dal.execScriptDtRet("select rest_id from tbl_rest where LTRIM(rtrim(username))='" + username + "' and LTRIM(rtrim(pass))='" + password + "'");
            if (dt.Rows.Count > 0)
                return dt.Rows[0][0].ToString();
            else
                return "";

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session.Remove("user_id");
            LinkButton3.Visible = false;
        }

    }
}