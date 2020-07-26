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
    public partial class Dashboard : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
        SqlCommand com;
        SqlParameter accountid, emailstatus, mobilestatus, section;

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("totalreqmade", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                int count = (int)sqlcmd.ExecuteScalar();
                Label1.Text = "Overall " +count + " requests made";

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("totalreqacc", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                int count = (int)sqlcmd.ExecuteScalar();
                Label2.Text = "Overall " + count + " tasks assigned";

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("totalreqcomp", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                int count = (int)sqlcmd.ExecuteScalar();
                Label3.Text = "Overall " + count + " tasks completed";

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();

        
    }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("assigned", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();
                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlcmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection sqlcon = new SqlConnection(strConnString);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("displayunack", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                
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

        protected void Page_Load(object sender, EventArgs e)
        {
            accountid = new SqlParameter();
            mobilestatus = new SqlParameter();
            emailstatus = new SqlParameter();
            section = new SqlParameter();
            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            con.Open();
            //Session["accountid"] = TextBox2.Text;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "verifyuser";
            accountid.SqlDbType = SqlDbType.VarChar;
            accountid.Size = 50;
            accountid.ParameterName = "@accountid";
            accountid.Value = Session["accountid"].ToString();
            accountid.Direction = ParameterDirection.Input;

            

            com.Parameters.Add(accountid);

            //com.Parameters.Add(password);



            int status;

            status = Convert.ToInt16(com.ExecuteScalar());



            if (status == 1)

            {

                Response.Redirect("Verifyuser.aspx");

            }

            else

            {

                //Label1.Text = "Invalid accountid and password...";

            }

            con.Close();


            Button1_Click(null, null);
            Button2_Click1(null, null);
            Button3_Click(null, null);
            Button4_Click(null, null);
            Button5_Click(null, null);
            
        }
    }
}