using System;
using Newtonsoft.Json;
using DRSN.Common;
using System.Configuration;
using System.Data.SqlClient;

namespace DRSN.Business_Application
{
    public class startblockchain
    {
        public void startb()
        {
            Blockdataset bd = new Blockdataset();
            var startTime = DateTime.Now;
            Blockchain phillyCoin = new Blockchain();
            phillyCoin.AddBlock(new Block(DateTime.Now, bd.prevhash, "My sixth block"));
            var endTime = DateTime.Now;
            bd.duration = (endTime - startTime).ToString();

            //duration insert in database

            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("durationupdate", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                //sqlcmd.Parameters.AddWithValue("@block", bd.block);

                sqlcmd.Parameters.AddWithValue("@duration", bd.duration);

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

