using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;

namespace _3d2.classes
{
    public class bll
    {

        public static DataTable extract_words(string s)
        {
            DataTable dt = new DataTable();
            try
            {
                s = s.Trim();
                dt.Columns.Add("word");
                string item = "";

                for (int i = 0; i < s.Length; i++)
                {
                    if (s[i] == ',' || s[i] == ' ')
                    {
                        if (item == "") continue;

                        dt.Rows.Add(item);
                        item = "";
                        continue;
                    }
                    item += s[i];
                    if (i + 1 == s.Length) dt.Rows.Add(item);
                }
            }
            catch (Exception err)
            {
                throw err;
            }
            return dt;
        }// extract words
        public static string combine_words(DataTable dt,int culomn_index)
        {
            try
            {

                string result = ",";
                for (int i = 0; i < dt.Rows.Count; i++)
                    result += dt.Rows[i][culomn_index].ToString() + ",";

                return result;

            }
            catch (Exception err)
            {
                throw err;
                return "";
            }
            
        }// extract words
    }
}