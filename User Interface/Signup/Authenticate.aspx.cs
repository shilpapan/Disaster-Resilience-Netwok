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
            otp.Text = "A verification code has been sent to your email id " + signup.email + " and " +
                "" +
                " your mobile number " + signup.mobile + " . Please enter them below. ";

        }

        protected void eauth_Click(object sender, EventArgs e)
        {
            if (signup.emailverificationcode == aemail.Text)
            {
                everified.Text = "Email Authenticated";
                statuse = true;
            }
            else
            {
                enverified.Text = "Invalid code";
                statuse = false;
            }
        }

        protected void mauth_Click(object sender, EventArgs e)
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

        protected void pushdata(object sender, EventArgs e)
        {
            if(statuse = statusm)
            {
                signup.emailstatus = "Authenticated";
                signup.mobilestatus = "Authenticated";
            }
            else
            {
                signup.emailstatus = "Not Authenticated";
                signup.mobilestatus = "Not Authenticated";
            }
        }
    }
}