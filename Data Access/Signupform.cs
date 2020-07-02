using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using DRSN.Business_Application;
using DRSN.User_Interface.Signup;
using DRSN.Common;

namespace DRSN.Data_Access
{
    public class Signupform : accountcreate
    {
        Common.Signup signup = new Common.Signup();
        public void parametersinsert(string em)
        {
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            User_Interface.Signup.adduser ad = new adduser();

            verifyemail(em);
            createaddress(out string publickey, out string privatekey);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("userdetail", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@accountid", signup.accointid);
                sqlcmd.Parameters.AddWithValue("@fullname", signup.name);
                sqlcmd.Parameters.AddWithValue("@email", signup.email);
                sqlcmd.Parameters.AddWithValue("@mobile", signup.mobile);
                sqlcmd.Parameters.AddWithValue("@emailstatus", signup.emailstatus);
                sqlcmd.Parameters.AddWithValue("@mobilestatus", signup.mobilestatus);
                sqlcmd.Parameters.AddWithValue("@publicaddress", signup.publicaddress);
                sqlcmd.Parameters.AddWithValue("@privateaddress", signup.privateaddress);
                sqlcmd.Parameters.AddWithValue("@password", signup.password);
                sqlcmd.Parameters.AddWithValue("@StatementType", "Insert");


                sqlcmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            sqlcon.Close();
        }
        User_Interface.Signup.Authenticate au = new Authenticate();
        public override void userdetails(string name, string email, string mobile, string password, string accointid, string publicaddress, string privateaddress, string emailverificationcode, string mobileverificationcode, string emailstatus, string mobilestatus)
        {
            au.userdata();
        }
    }
}