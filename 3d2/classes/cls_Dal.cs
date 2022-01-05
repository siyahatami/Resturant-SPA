using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace _3d2.classes
{
    class cls_Dal
    {
        // public static string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=db_rest;Integrated Security=True";
        public static string connectionString = @"Data Source=dbserver;Initial Catalog=db_rest;User Id=tantaneh.com;password=mypassw0rd;Integrated Security=False";

        public static void execScriptNoneRet(string script)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(script, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Redirect(@"~/pages/error_page.aspx");
                throw err;
                return;
            }

        }

        public static DataSet execScriptDsRet(string script)
        {
            try
            {
                SqlDataAdapter adap = new SqlDataAdapter(script, connectionString);

                DataSet ds = new DataSet();
                adap.Fill(ds);

                return ds;
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Redirect(@"~/pages/error_page.aspx");
                throw err;
                return new DataSet();
            }
        }

        public static DataTable execScriptDtRet(string script)
        {
            try
            {
                SqlDataAdapter adap = new SqlDataAdapter(script, connectionString);
                
                DataTable dt = new DataTable();
                adap.Fill(dt);

                return dt;
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Redirect(@"~/pages/error_page.aspx");
                throw err;
                return new DataTable();
            }

        }

        public static string select_data(string script)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(script, con);

                string result;
                con.Open();
                result = (string)cmd.ExecuteScalar();
                con.Close();

                return result;
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Redirect(@"~/pages/error_page.aspx");
                throw err;
                return "";
            }

        }

        public static SqlDataReader execScriptSrRet(string script)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand(script, con);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                con.Close();

                return dr;
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Redirect(@"~/pages/error_page.aspx");
                throw err;
                SqlDataReader sss = null;
                return sss;
            }

        }


    }


    class cls_Dal_transation
    {                               //not complated !!!!!!!!!!!

        public static string connectionString = "Data Source=.;Initial Catalog=db_rest;Integrated Security=True";
        static SqlConnection con=new SqlConnection(connectionString);
        static SqlTransaction transaction;
        //SqlBulkCopy


        public static DataTable execScriptDtRet(string script)
        {
            try
            {
                /*
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                object[] o=new object[3] ;
                dr.GetValues(o);
                dr.Depth
                SqlDataAdapter adap = new SqlDataAdapter();
                adap.SelectCommand=new SqlCommand(script,con);
                DataTable dt = new DataTable();
                adap.Fill(dt);

                return dt;
                 */

                return new DataTable();
            }
            catch (Exception ee)
            {
                throw ee;
            }

        }


        public static void start_transaction()
        {
            //con.Close();
            con.Open();
            transaction= con.BeginTransaction();
        }

        public static void finish_transaction()
        {
            try
            {
                transaction.Commit();
                con.Close();
            }
            catch (Exception ee)
            {
                rollback_transaction();
                throw ee;
            }
        }

        public static void rollback_transaction()
        {
            transaction.Rollback();
            con.Close();
        }
    }// class transaction    but not complated



    class MyException:Exception{
        public string errorDiscription = "";
        public MyException() {
            errorDiscription= "The operation failed.";
            base.Data.Add(1, Cls_ExceptionTypes.NOT_CONTROLED);
        }
        
        public MyException(string s)
        {
            errorDiscription = s;
            base.Data.Add(1, Cls_ExceptionTypes.CONTROLED);
        }

    }

    class Cls_ExceptionTypes
    {
        public static byte NOT_CONTROLED = 1;
        public static byte CONTROLED = 2;
        
    }
}