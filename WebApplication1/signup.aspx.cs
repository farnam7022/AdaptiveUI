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
using System.IO;
using System.Text;

namespace WebApplication1
{
    public partial class signup : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.WriteLine("-----------------------------------------------------------");
            //string path = "~/Desktop/Hi.txt";
            string[] lineOfContents = File.ReadAllLines("Hi.txt");

            soal1.InnerText = lineOfContents[0];
            /* var firstLine = lineOfContents[1];
           var fields = firstLine.Split(',');
            for (int i = 0; i < 2; ++i)
                testSelect2.Items[i].Value = fields[i];*/
            soal2.InnerText = lineOfContents[2];
                   
            }
           

           

        

        public void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "(" + msg + ")",true);
       }

        

        protected void submitbtn_OnClick(object Source, EventArgs e)
        {
            
            

            string test, qr, constr;
            constr = "database=test;server=localhost;uid=root;pwd=shanon70422";
            MySqlConnection con = new MySqlConnection(constr);

            try
            {

                if (Page.IsValid)
                {

                    Debug.WriteLine("start");
                    string name = user.Value.ToString();
                    string pas = pass.Value.ToString();
                    Session["user"] = name;
                    Debug.WriteLine(name);
                    Debug.WriteLine(pas);
                    test =
                    "SELECT count(*) FROM users " +
                    "WHERE idusers ='"+ name +"'";
                    Debug.WriteLine(test);
                    MySqlCommand cmd = new MySqlCommand(test, con);
                    con.Open();
                    Debug.WriteLine("open");
                    string filter;int zoom;
                    object res = cmd.ExecuteScalar();
                    Debug.WriteLine(res);
                    if (Convert.ToInt32(res) == 0)
                    {
                        if (testSelect.SelectedIndex == 0)
                        {
                            filter = "restaurant";
                        }

                        else { filter = "hospital"; }


                        if (testSelect2.SelectedIndex == 1)
                        {
                            zoom =13; }
                        else { zoom =15; }
                        
                        qr = "INSERT INTO users (idusers, pass,zoom,filter) VALUES(@user, @pass,@zoom,@filter)";
                        MySqlCommand cmd2 = new MySqlCommand(qr, con);
                        cmd2.Parameters.AddWithValue("@user", name);
                        cmd2.Parameters.AddWithValue("@pass", pas);
                        cmd2.Parameters.AddWithValue("@filter", filter);
                        cmd2.Parameters.AddWithValue("@zoom", zoom);
                        cmd2.ExecuteNonQuery();
                        Debug.WriteLine("end");
                        Session["value2"] = zoom;
                        //Session["value"] = filter;
                        Response.Redirect("index.aspx?value=" + filter);
                        Response.Redirect("index.aspx");

                    }
                }
            }

            catch (MySqlException ex)
            {
                Debug.WriteLine(ex);
            }
            finally
            {
                con.Close();
                Debug.WriteLine("end2");
               
            }

            




        }
    }
}
