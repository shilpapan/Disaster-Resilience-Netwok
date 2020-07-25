using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DRSN.Common
{
    public class Blockdataset
    {
        private int Block;

        public int block
        {
            get { return Block; }
            set { Block = value; }
        }

        private DateTime Timestamp;

        public DateTime timestamp
        {
            get { return Timestamp; }
            set { Timestamp = value; }
        }

        private String Prevhash;

        public String prevhash
        {
            get { return Prevhash; }
            set { Prevhash = value; }
        }

        private String Hash;

        public String hash
        {
            get { return Hash; }
            set { Hash = value; }
        }

        private String Data;

        public String data
        {
            get { return Data; }
            set { Data = value; }
        }

        private int Nonce;

        public int nonce
        {
            get { return Nonce; }
            set { Nonce = value; }
        }

        private String Sender;

        public String sender
        {
            get { return Sender; }
            set { Sender = value; }
        }

        private String Receiver;

        public String receiver
        {
            get { return Receiver; }
            set { Receiver = value; }
        }

        private String Duration;

        public String duration
        {
            get { return Duration; }
            set { Duration = value; }
        }

        private String Isvalid;

        public String isvalid
        {
            get { return Isvalid; }
            set { Isvalid = value; }
        }

        private String Difficulty;

        public String difficulty
        {
            get { return Difficulty; }
            set { Difficulty = value; }
        }



        public void dataset()
        {
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlCommand com;
            //SqlParameter prhash;
            //prhash = new SqlParameter();
            
            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            try
            {
                con.Open();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "prevhash";
                com.Parameters.Add("@prhash", SqlDbType.VarChar, 50);
                com.Parameters["@prhash"].Direction = ParameterDirection.Output;
                com.Dispose();
                com.ExecuteScalar();
                //Storing the output parameters value in 3 different variables.  
                this.Prevhash = Convert.ToString(com.Parameters["@prhash"].Value);
                con.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }

        public void blocks(DRSN.Business_Application.Block block)
        {
            Block = block.Index;
            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("insertblock", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@Block", block.Index);
                sqlcmd.Parameters.AddWithValue("@Timestamp", block.TimeStamp);
                sqlcmd.Parameters.AddWithValue("@Previoushash", block.PreviousHash);
                sqlcmd.Parameters.AddWithValue("@Hash", block.Hash);
                sqlcmd.Parameters.AddWithValue("@Data", block.Data);
                sqlcmd.Parameters.AddWithValue("@Nonce", block.Nonce);
                sqlcmd.Parameters.AddWithValue("@Sender", "Barry");
                sqlcmd.Parameters.AddWithValue("@Receiver", "Oliver");
                sqlcmd.Parameters.AddWithValue("@Difficulty", "NA");
                sqlcmd.Parameters.AddWithValue("@Isvalid", "NA");
                sqlcmd.Parameters.AddWithValue("@Duration", "NA");
                sqlcmd.Parameters.AddWithValue("@hashe", block.Hash);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
        }

    }
}