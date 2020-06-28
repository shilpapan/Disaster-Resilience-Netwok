using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DRSN.User_Interface.Signup
{
    public partial class Authenticate : System.Web.UI.Page
    {
        Common.Signup signup = new Common.Signup();
        protected void Page_Load(object sender, EventArgs e)
        {
            otp.Text = "A verification code has been sent to your email id" + signup.email + "and" +
                "" +
                " your mobile number" + signup.mobile + ". Please enter them below";

        }

        protected void eauth_Click(object sender, EventArgs e)
        {
            //String conn =
            //String query = "insert into emaildetails(name, address, status, code) values('" + name + "','" + email + "','Unverified','" + activationcode + "')";
            //SqlConnection con = new SqlConnection(conn);
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = query;
            //cmd.Connection = con;
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmd;
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //if(ds.Tables[0].Rows.Count>0)
            //{
            //    String activationcode;
            //    activationcode = ds.Tables[0].Rows[0]["activationcode"].ToString();
            //    if(activationcode == signup.emailverificationcode)
            //    {
            //        changestatus();
            //        everified.Text = "Email has been authenticated";
            //    }
            //    else
            //    {
            //        everified.Text = "The otp you have entered is invalid. Please try again";
            //    }
            //}
            //con.Close();
        }
    }
}