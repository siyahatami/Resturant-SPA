using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace _3d2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

            Application.Set("user_count",0);

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Set("user_count",Convert.ToInt16(Application.Get("user_count")));
            Session["temp_user_id"] = Application.Get("user_count").ToString();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Response.Redirect("pages/error_page.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {
            //lazeme file Captcha ba IDictionary Session["temp_user_id"]  pak beshe
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}