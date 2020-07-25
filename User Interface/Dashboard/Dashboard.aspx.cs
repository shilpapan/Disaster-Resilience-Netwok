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
        }
    }
}