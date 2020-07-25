using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DRSN.User_Interface.Signup
{
    public partial class Authenticate : System.Web.UI.Page
    {
        Common.Signup signup = new Common.Signup();
        Business_Application.accountcreate accountcreate = new Business_Application.accountcreate();
        public bool statuse = false;
        public bool statusm = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            otp.Text = "A verification code has been sent to your email id " + Session["email"] as String + " and " +
                "" +
                " your mobile number " + Session["mobile"] as String + " . Please enter them below. ";

            //s.name = Session["name"].ToString();

        }

        Common.Signup s = new Common.Signup();
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (aemail.Text == Session["emailcode"].ToString())
            {
                everified.Text = "Email Authenticated";
                statuse = true;
                //Session["estatus"] = 
            }
            else
            {
                enverified.Text = "Invalid code";
                statuse = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

                if (amobile.Text == Session["otp"].ToString())
                {

                    mverified.Text = "Your Mobile Number Has Been Verified Successfully - Thanks";
                    statusm = true;
                }
                else
                {
                    mverified.Text = "Invalid Otp. Please enter correct otp.";
                    statusm = false;

                }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (statuse == statusm)
            {
                Session["status"] = "Authenticated";
                String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
                SqlConnection sqlcon = new SqlConnection(connection);
                User_Interface.Signup.adduser ad = new adduser();
                try
                {
                    sqlcon.Open();
                    SqlCommand sqlcmd = new SqlCommand("userdetail", sqlcon);
                    sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                    String acc = Session["accountid"].ToString();
                    String nm = Session["name"].ToString();
                    String em = Session["email"].ToString();
                    String mb = Session["mobile"].ToString();
                    String st = Session["status"].ToString();
                    String pb = Session["publickey"].ToString();
                    String pv = Session["privkey"].ToString();
                    String ps = Session["password"].ToString();

                    sqlcmd.Parameters.AddWithValue("@accountid", acc);
                    sqlcmd.Parameters.AddWithValue("@fullname", nm);
                    sqlcmd.Parameters.AddWithValue("@email", em);
                    sqlcmd.Parameters.AddWithValue("@mobile", mb);
                    sqlcmd.Parameters.AddWithValue("@emailstatus", st);
                    sqlcmd.Parameters.AddWithValue("@mobilestatus", st);
                    sqlcmd.Parameters.AddWithValue("@publicaddress", pb);
                    sqlcmd.Parameters.AddWithValue("@privateaddress", pv);
                    sqlcmd.Parameters.AddWithValue("@password", ps);
                    //sqlcmd.Parameters.AddWithValue("@StatementType", "Insert");


                    sqlcmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                sqlcon.Close();

                Response.Redirect("../Login/Login.aspx");
            }
            else
            {
                Session["status"] = "Not Authenticated";
                Response.Redirect("adduser.aspx");
            }
            //s.name = Session["name"].ToString();


           
        }
    }
}