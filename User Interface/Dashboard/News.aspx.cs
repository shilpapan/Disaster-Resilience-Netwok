﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRSN.User_Interface.Dashboard
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void Button4_Click1(object sender, EventArgs e)
        {
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);

            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("newsupdate", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                String acc = Session["accountid"].ToString();

                sqlcmd.Parameters.AddWithValue("@accountid", acc);
                sqlcmd.Parameters.AddWithValue("@disastername", form34.Value);
                sqlcmd.Parameters.AddWithValue("@impacts", form29.Value);
                sqlcmd.Parameters.AddWithValue("@participants", form32.Value);
                sqlcmd.Parameters.AddWithValue("@rescue", form8.Value);



                sqlcmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            sqlcon.Close();

            Response.Redirect("Dashboard.aspx");
        }
    }
}