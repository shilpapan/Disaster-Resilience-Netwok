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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlCommand com;
            SqlParameter accountid, emailb, name;
            accountid = new SqlParameter();
            name = new SqlParameter();
            emailb = new SqlParameter();



            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            con.Open();
            //Session["accountid"] = TextBox2.Text;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "getemail";
            accountid.SqlDbType = SqlDbType.VarChar;
            accountid.Size = 50;
            accountid.ParameterName = "@accountid";
            accountid.Value = Session["accountid"].ToString();
            accountid.Direction = ParameterDirection.Input;

            com.Parameters.Add("@emailb", SqlDbType.VarChar, 50);
            com.Parameters["@emailb"].Direction = ParameterDirection.Output;
            com.Parameters.Add("@name", SqlDbType.VarChar, 50);
            com.Parameters["@name"].Direction = ParameterDirection.Output;
            com.Parameters.Add(accountid);

            com.ExecuteNonQuery();
            //Storing the output parameters value in 3 different variables.  
            email.Value = Convert.ToString(com.Parameters["@emailb"].Value);
            fullname.Value = Convert.ToString(com.Parameters["@name"].Value);
            fullname1.Value = Convert.ToString(com.Parameters["@name"].Value);
            userid.Value = Session["accountid"].ToString();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlCommand com;
            SqlParameter accountid;
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("completeprofile", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@username", acc);
                sqlcmd.Parameters.AddWithValue("@organization", organization.Value);
                sqlcmd.Parameters.AddWithValue("@email", email.Value);
                sqlcmd.Parameters.AddWithValue("@fullname", fullname.Value);
                sqlcmd.Parameters.AddWithValue("@gender", gender.Value);
                sqlcmd.Parameters.AddWithValue("@address", address.Value);
                sqlcmd.Parameters.AddWithValue("@city", city.Value);
                sqlcmd.Parameters.AddWithValue("@country", country.Value);
                sqlcmd.Parameters.AddWithValue("@postalcode", postalcode.Value);
                sqlcmd.Parameters.AddWithValue("@aboutme", aboutme.Value);
                sqlcmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();

        }
    }
}