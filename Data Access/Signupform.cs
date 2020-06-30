using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using DRSN.Business_Application;

namespace DRSN.Data_Access
{
    public class Signupform : accountcreate
    {
        Common.Signup signup = new Common.Signup();
       public void parametersinsert()
        {
            String connection = ConfigurationManager.ConnectionStrings["DRSN"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);

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

    
    }
}