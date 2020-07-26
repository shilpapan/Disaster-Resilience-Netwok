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
    public partial class Requestcomplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("reqcomp", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.Parameters.AddWithValue("@requestid", TextBox1.Text);
                sqlcmd.Parameters.AddWithValue("@amount", TextBox2.Text);
                sqlcmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();
            Response.Redirect("Dashboard.aspx");
        }
    }
}