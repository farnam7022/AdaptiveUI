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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        

        protected void submitbutton_OnClick(object Source, EventArgs e)
        {
            string test, constr;
            object res;
            constr = "database=test;server=localhost;uid=root;pwd=shanon70422";
            MySqlConnection con = new MySqlConnection(constr);

            try
            {
                    Debug.WriteLine("start");
                    string name = username.Value.ToString();
                 Session["user"] =name;
                string pas = password.Value.ToString();
                    Debug.WriteLine(name);
                    Debug.WriteLine(pas);
                test =
                "SELECT count(*) FROM users WHERE idusers=@user and pass=@pass;";
                    Debug.WriteLine(test);
                    MySqlCommand cmd = new MySqlCommand(test, con);
                Debug.WriteLine("here1");
                con.Open();
                Debug.WriteLine("here2");
                cmd.Parameters.AddWithValue("@user", name);
                cmd.Parameters.AddWithValue("@pass", pas);

                res =  cmd.ExecuteScalar() ;
                    Debug.WriteLine(res);
                if (Convert.ToInt32(res) != 0)
                {
                    string test2="SELECT zoom" +
                    " FROM users " +
                    "WHERE idusers ='" + name + "'";
                    Debug.WriteLine(test2);
                    MySqlCommand cmd2 = new MySqlCommand(test2, con);
                    object res2 = cmd2.ExecuteScalar();
                    Debug.WriteLine(res2);
                    Session["value2"] = res2;
                    string test3 = "SELECT filter" +
                    " FROM users " +
                    "WHERE idusers ='" + name + "'";
                    Debug.WriteLine(test3);
                    MySqlCommand cmd3 = new MySqlCommand(test3, con);
                    object res3 = cmd3.ExecuteScalar();
                    Debug.WriteLine(res3);
                    //Session["value"] = res3;
                    Response.Redirect("index.aspx?value="+res3);
                   

                }
                else
                {
                    Debug.WriteLine("user not found");
                }
               
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

        protected void signup_OnClick(object Source, EventArgs e)
        {
            Response.Redirect("signup.aspx");
            

        }

      
        }
    }
