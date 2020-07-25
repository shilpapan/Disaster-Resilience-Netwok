using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace DRSN.Common
{
    public class Completeprofile
    {
        private String Organizaton;

        public String organization
        {
            get { return Organizaton; }
            set { Organizaton = value; }
        }

        private String Gender;

        public String gender
        {
            get { return Gender; }
            set { Gender = value; }
        }   

        private String Address;

        public String address
        {
            get { return Address; }
            set { Address = value; }
        }

        private String City;

        public String city
        {
            get { return City; }
            set { City = value; }
        }

        private String Country;

        public String country
        {
            get { return Country; }
            set { Country = value; }
        }

        private String Postalcode;

        public String postalcode
        {
            get { return Postalcode; }
            set { Postalcode = value; }
        }

        private String Aboutme;

        public String aboutme
        {
            get { return Aboutme; }
            set { Aboutme = value; }
        }

        private String Username;

        public String username
        {
            get { return Username; }
            set { Username = value; }
        }

        private String Email;

        public String email
        {
            get { return Email; }
            set { Email = value; }
        }

        private String Fullname;

        public String fullname
        {
            get { return Fullname; }
            set { Fullname = value; }
        }




        public void updateprofile()
        {
            Username = HttpContext.Current.Session["accountid"].ToString();
            getemail();
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("completeprofile", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                sqlcmd.Parameters.AddWithValue("@organization", Organizaton);
                sqlcmd.Parameters.AddWithValue("@username", Username);
                sqlcmd.Parameters.AddWithValue("@email", Email);
                sqlcmd.Parameters.AddWithValue("@fullname", Fullname);
                sqlcmd.Parameters.AddWithValue("@gender", Gender);
                sqlcmd.Parameters.AddWithValue("@address", Address);
                sqlcmd.Parameters.AddWithValue("@city", City);
                sqlcmd.Parameters.AddWithValue("@country", Country);
                sqlcmd.Parameters.AddWithValue("@postalcode", Postalcode);
                sqlcmd.Parameters.AddWithValue("@aboutme", Aboutme);

                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public void getemail()
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlCommand com;
            SqlParameter accountid, emailb, name;

            accountid = new SqlParameter();
            name = new SqlParameter();
            emailb = new SqlParameter();



            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            con.Open();
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "getemail";
            accountid.SqlDbType = SqlDbType.VarChar;
            accountid.Size = 50;
            accountid.ParameterName = "@accountid";
            accountid.Value = HttpContext.Current.Session["accountid"].ToString();
            accountid.Direction = ParameterDirection.Input;

            com.Parameters.Add("@emailb", SqlDbType.VarChar, 50);
            com.Parameters["@emailb"].Direction = ParameterDirection.Output;
            com.Parameters.Add("@name", SqlDbType.VarChar, 50);
            com.Parameters["@name"].Direction = ParameterDirection.Output;
            com.Parameters.Add(accountid);

            com.ExecuteNonQuery();
            //Storing the output parameters value in 3 different variables.  
            Email = Convert.ToString(com.Parameters["@emailb"].Value);
            Fullname = Convert.ToString(com.Parameters["@name"].Value);
            con.Close();
        }

    }
}