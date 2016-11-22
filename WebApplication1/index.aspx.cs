using System;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }
              protected void outbutton_OnClick(object Source, EventArgs e)
        {

            Debug.WriteLine("------------------------------------------------------------------------------------------");
            object obj = tp.Value;
            Debug.WriteLine(obj);
            if (obj == "") { Debug.WriteLine("null obj"); }
            string name2= Session["user"].ToString();
           int t = Convert.ToInt16(z.Value);
            Debug.WriteLine(t);
           
            string constr2;
            constr2 = "database=test;server=localhost;uid=root;pwd=shanon70422";
            MySqlConnection con = new MySqlConnection(constr2);
            string s="";

            try
            {
                if (obj =="")
                { s = "UPDATE users SET zoom=" + t + " WHERE idusers ='" + name2 + "'"; }
                if (obj != "")
                {    s = "UPDATE users SET filter ='" + obj + "', zoom=" + t + " WHERE idusers ='" + name2 + "'"; }



                Debug.WriteLine(s);

                MySqlCommand cmd = new MySqlCommand(s, con);
                con.Open();

                cmd.ExecuteNonQuery();

                Response.Redirect("login.aspx");
            
            }

            catch (MySqlException ex)
            {
                Debug.WriteLine(ex);
            }
            finally
            {
                con.Close();
            }

        }




    }




    }
   
