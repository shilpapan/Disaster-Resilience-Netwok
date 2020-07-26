using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRSN.User_Interface.Dashboard
{
    public partial class Requestservice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("servicerequest", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();

                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.Parameters.AddWithValue("@requestid", randomstring());
                sqlcmd.Parameters.AddWithValue("@service", form34.Value);
                sqlcmd.Parameters.AddWithValue("@acknowledger", "null");
                sqlcmd.Parameters.AddWithValue("@requestdescription", form8.Value);
                sqlcmd.Parameters.AddWithValue("@contactnumber", form32.Value);
                sqlcmd.Parameters.AddWithValue("@emailid", form29.Value);



                sqlcmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();

            Response.Redirect("Dashboard.aspx");
        }

        public String randomstring()
        {
            Random ran = new Random();

            String b = "abcdefghijklmnopqrstuvwxyz0123456789";
            int length = 6;

            String random = "";

            for (int i = 0; i < length; i++)
            {
                int a = ran.Next(b.Length); //string.Lenght gets the size of string
                random = random + b.ElementAt(a);
            }
            return random;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}