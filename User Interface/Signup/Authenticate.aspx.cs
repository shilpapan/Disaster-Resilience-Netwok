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
        Business_Application.accountcreate accountcreate = new Business_Application.accountcreate();
        public bool statuse = false;
        public bool statusm = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            otp.Text = "A verification code has been sent to your email id " + Session["email"] as String + " and " +
                "" +
                " your mobile number " + Session["mobile"] as String + " . Please enter them below. ";

        }

        Common.Signup s = new Common.Signup();
        public void userdata()
        {
            Session["name"] = s.name;
            Session["email"] = s.email ;
            Session["mobile"] = s.mobile;
            Session["password"] = s.password;
            Session["accountid"] = s.accointid;
            Session["otp"] = s.mobileverificationcode;
            Session["emailcode"] = s.emailverificationcode;
            Session["publickey"] = s.publicaddress;
            Session["privkey"] = s.privateaddress;
            Session["status"] = s.mobilestatus;
            Session["status"] = s.emailstatus;
         }

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

                Response.Redirect("../Login/Login.aspx");
            }
            else
            {
                Session["status"] = "Not Authenticated";
                Response.Redirect("adduser.aspx");
            }

        }
    }
}