using DRSN.Business_Application;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DRSN.User_Interface.Dashboard
{
    public partial class Verifyuser : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
        SqlCommand com;
        SqlParameter accountid, email, mobile;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            accountid = new SqlParameter();
            mobile = new SqlParameter();
            email = new SqlParameter();

            

            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            con.Open();
            //Session["accountid"] = TextBox2.Text;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "userauth";
            accountid.SqlDbType = SqlDbType.VarChar;
            accountid.Size = 50;
            accountid.ParameterName = "@accountid";
            accountid.Value = Session["accountid"].ToString();
            accountid.Direction = ParameterDirection.Input;

            com.Parameters.Add("@email", SqlDbType.VarChar, 50);
            com.Parameters["@email"].Direction = ParameterDirection.Output;
            com.Parameters.Add("@mobile", SqlDbType.VarChar, 50);
            com.Parameters["@mobile"].Direction = ParameterDirection.Output;
            com.Parameters.Add(accountid);

            com.ExecuteNonQuery();
            //Storing the output parameters value in 3 different variables.  
            string em = Convert.ToString(com.Parameters["@email"].Value);
            string mb = Convert.ToString(com.Parameters["@mobile"].Value);
            con.Close();
            accountcreate ac = new accountcreate();
            
            ac.verifyemail(em);

            Random random = new Random();
            int value = random.Next(1001, 9999);
            string destinationaddr = "91" + mb;
            string message = "Your OTP Number is " + value + " ( Sent By : DRSN Team )";
            //Label3.Text = message;
            String message1 = HttpUtility.UrlEncode(message);

            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "q0fLh6VFYeg-pJBpgv9zMwv7C5vJTuJ4Co2TROeAYY"},
                {"numbers" , destinationaddr},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);
                Session["otp"] = value;

            }
            

            Response.Redirect("authenticatemodal.aspx");

        }
    }
}