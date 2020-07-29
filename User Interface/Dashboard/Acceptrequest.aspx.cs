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
    public partial class Acceptrequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String dataforblock = String.Empty;
            String combinedata = "00200";

            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("ack", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.Parameters.AddWithValue("@requestid", TextBox1.Text);
                sqlcmd.ExecuteNonQuery();


                dataforblock = acc + combinedata + TextBox1.Text + "Accepting a request";

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();

            Business_Application.startblockchain sb = new Business_Application.startblockchain();
            sb.startb(dataforblock);


            Response.Redirect("Dashboard.aspx");
        }
    }
}