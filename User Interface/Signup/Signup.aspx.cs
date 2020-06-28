using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using DRSN.Business_Application;

namespace DRSN.User_Interface.Signup
{
    public partial class Signup : System.Web.UI.Page 
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void createaccount(object sender, EventArgs e)
        {
            Common.Signup common = new Common.Signup();
            common.name = name.Text;
            common.email = email.Text;
            common.mobile = Convert.ToInt32(mobile.Text);
            common.password = password.Text;

            accountcreate ac = new accountcreate();
            ac.verifyemail(common.email);
            ac.verifymobile(common.mobile);
            Response.Redirect("Authenticate.aspx");
        }
    }
}