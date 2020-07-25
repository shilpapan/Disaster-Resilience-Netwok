using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DRSN.Common;

namespace DRSN.User_Interface.Dashboard
{
    public partial class Userprofile : System.Web.UI.Page
    {
        


        protected void Page_Load(object sender, EventArgs e)
        {
               
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}