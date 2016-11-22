using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using MySql.Data.MySqlClient;
using System.Data;
using System.Diagnostics;
using System.Web.Script.Serialization;

namespace WebApplication1
{
    public partial class chart : System.Web.UI.Page
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        protected int[] val;
        protected string[] user;

        public static class JavaScript
        {
            public static string Serialize(object o)
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                return js.Serialize(o);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            
            ////////////////////////////////////////////////////////////////////////// DB

            string con = "database=test;server=localhost;uid=root;pwd=shanon70422";
            MySqlConnection conn = new MySqlConnection(con);    
            string qr = "SELECT idusers,action FROM test.data_history where action='update';";

            MySqlCommand cmd = new MySqlCommand(qr, conn);
             
            DataTable dataTable = new DataTable();

              
            conn.Open();

            using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
            {
                da.Fill(dataTable);
            }

            object[,] names = new object[10,2];
            int i = 0;
           
            string test = "";
            foreach (DataRow row in dataTable.Rows) 
            {
                
                Console.WriteLine("--- Row ---"); 
                foreach (var item in row.ItemArray) 
                {
                    if(item.ToString()!="update")
                    {
                        test = item.ToString();
                        if (i != 0 && names[i - 1,0].ToString() != test)
                        { names[i,0] = test;names[i, 1] = 1; ++i; }
                       else  if (i == 0)
                        { names[0,0] = test;names[0, 1] = 1; ++i; }
                        else if (i!=0 && names[i - 1, 0].ToString() == test) { names[i-1, 1] = Convert.ToInt32(names[i-1, 1]) + 1; }
                        }
                    Debug.Write("Item: "); 
                    Debug.WriteLine(item); 
                }
            }
            

            int rowLength = names.GetLength(0);
            int colLength = names.GetLength(1);
            Debug.WriteLine("here");
            int t2 = 0;
            for (int ii = 0; ii < rowLength; ii++)
            {

                for (int j = 0; j < colLength; j++)
                {
                    Debug.WriteLine(names[ii, j]);
                    if (names[ii, j] == null) { Debug.WriteLine("null"); }
                    else { ++t2; }
                }
               
            }
            

            conn.Close();
            Debug.WriteLine(t2);
            int t3 = t2 / 2;
            val = new int[t3];
            user = new string[t3];

            for (int t=0;t<t3;++t)
            { val[t] = Convert.ToInt32(names[t,1]);
                user[t] = names[t, 0].ToString();
            }

            for (int j2 = 0; j2 < colLength; j2++)
            {
                Debug.WriteLine(user[j2]);
                Debug.WriteLine(val[j2]);
            }

        }
    }
}