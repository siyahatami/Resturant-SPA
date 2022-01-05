using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _3d2.pages
{
    public partial class errpr_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ErrorMessage"] != null)
                ErrorMessage.InnerText = Request.QueryString["ErrorMessage"].ToString();

        }
    }
}