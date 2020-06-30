using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DRSN.Business_Application;
using System.Net;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using DRSN.Common;


namespace DRSN.User_Interface.Signup
{
    public partial class adduser : System.Web.UI.Page 
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {






            Common.Signup common = new Common.Signup();
            string name1 = name.Text;
            common.name = name1;
            common.email = email.Text;
            common.mobile = mobile.Text;
            common.password = password.Text;



            string NewGUID = System.Guid.NewGuid().ToString();
            common.accointid = NewGUID;


            Random random = new Random();
            int value = random.Next(100001, 999999);
            string destinationaddr = "91" + common.mobile;
            string message = "Your OTP Number is " + value + " ( Sent By : Hariti Study Hub )";
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



            accountcreate ac = new accountcreate();
            ac.verifyemail(common.email);

            Response.Redirect("Authenticate.aspx");



            




        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}