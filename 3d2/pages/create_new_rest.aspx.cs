using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Captcha;
using System.Drawing.Imaging;

namespace _3d2.pages
{
    public partial class create_new_rest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["postback"]!=null) //sabtenam
            {
                if (Request.QueryString["rest_name"] == null || Request.QueryString["user"] == null || Request.QueryString["pass"] == null || Request.QueryString["city_id"] == null || Request.QueryString["area_id"] == null || Request.QueryString["area_name"] == null || Request.QueryString["address"] == null || Request.QueryString["email"] == null || Request.QueryString["phone"] == null || Request.QueryString["desc"] == null || Request.QueryString["captcha"] == null)
                {
                    div_new_rest.InnerHtml= "The operation failed";
                    return;
                }
                if (Request.QueryString["captcha"].ToString() != Session["CaptchaCode"].ToString())
                {
                    div_new_rest.InnerHtml = "The operation failed";
                    return;
                }

                try
                {
                    classes.cls_Dal.execScriptDtRet("insert into tbl_rest values ('" + Request.QueryString["rest_name"].ToString() + "','" + Request.QueryString["address"].ToString() + "','" + Request.QueryString["desc"].ToString() + "'," + Request.QueryString["city_id"].ToString() + ",'" + Request.QueryString["user"].ToString() + "','" + Request.QueryString["pass"].ToString() + "'," + Request.QueryString["area_id"].ToString() + ",'" + Request.QueryString["area_name"].ToString() + "','" + Request.QueryString["email"].ToString() + "')");
                    div_new_rest.InnerHtml = "Resturant registration was successful.";
                    
                }
                catch (Exception)   
                {
                    div_new_rest.InnerHtml = "The operation failed";
                    return;
                }
            }// sabtename
            //http://localhost:3048/pages/create_new_rest.aspx?postback=1&rest_name=restttt&user=user1&pass=pass1&city_id=2&area_id=5&area_name=tajrish&address=tehranpars&email=siyas@siya&phone=12345321&desc=desc%20b&captcha=a
            try
            {
                string filename = Session["temp_user_id"].ToString();

                CaptchaImage cImage = new CaptchaImage(CaptchaImage.generateRandomCode(), 170, 60);
                cImage.Image.Save(Server.MapPath("~/files/images/captcha/" + filename + ".jpg"), ImageFormat.Jpeg);
                img_chaptcha.Src = "~/files/images/captcha/" + filename + ".jpg";
                cImage.Dispose();

            }
            catch (Exception)
            {
                div_new_rest.InnerHtml = "The operation failed";
                return;
            }
            

        }//load






    }
}