using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRSN.User_Interface.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;

        SqlCommand com;

        SqlParameter accountid, password;

        protected void Button1_Click(object sender, EventArgs e)
        {
            accountid = new SqlParameter();

            password = new SqlParameter();

            SqlConnection con = new SqlConnection(strConnString);



            com = new SqlCommand();

            com.Connection = con;

            con.Open();

            Session["accountid"] = TextBox2.Text;

            com.CommandType = CommandType.StoredProcedure;

            com.CommandText = "loginuser";



            accountid.SqlDbType = SqlDbType.VarChar;

            accountid.Size = 50;

            accountid.ParameterName = "@accountid";

            accountid.Value = TextBox2.Text.ToString();

            accountid.Direction = ParameterDirection.Input;



            password.SqlDbType = SqlDbType.VarChar;

            password.Size = 50;

            password.ParameterName = "@password";

            password.Value = TextBox1.Text.ToString();

            password.Direction = ParameterDirection.Input;



            com.Parameters.Add(accountid);

            com.Parameters.Add(password);



            int status;

            status = Convert.ToInt16(com.ExecuteScalar());



            if (status == 1)

            {

                Response.Redirect("../Dashboard/Dashboard.aspx");

            }

            else

            {

                Label1.Text = "Invalid accountid and password...";

            }

            con.Close();

        }
    }
}