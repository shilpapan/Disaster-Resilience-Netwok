using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRSN.User_Interface.Dashboard
{
    public partial class Notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1_Click(null, null);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("shownews", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlcmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();
        }
    }
}