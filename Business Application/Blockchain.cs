using DRSN.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DRSN.Business_Application
{
    public class Blockchain
    {
        Blockdataset bd = new Blockdataset();
        public IList<Block> Chain { set; get; }
        public int Difficulty { set; get; } = 2;

        public Blockchain()
        {
            //InitializeChain();
            //AddGenesisBlock();
        }


        //public void InitializeChain()
        //{
        //    Chain = new List<Block>();
        //}

        //public Block CreateGenesisBlock()
        //{
        //    return new Block(DateTime.Now, null, "{}");
        //}

        //public void AddGenesisBlock()
        //{

        //    Chain.Add(CreateGenesisBlock());
        //}

        //public Block GetLatestBlock()
        //{            
        //    string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
        //    SqlCommand com;
        //    SqlConnection con = new SqlConnection(strConnString);
        //    com = new SqlCommand();
        //    com.Connection = con;
        //    try
        //    {
        //        con.Open();
        //        com.CommandType = CommandType.StoredProcedure;
        //        com.CommandText = "prevblock";
        //        com.Parameters.Add("@block", SqlDbType.VarChar, 50);
        //        com.Parameters["@block"].Direction = ParameterDirection.Output;
        //        com.Dispose();
        //        com.ExecuteScalar();  
        //        bd.block = Convert.ToInt32(com.Parameters["@block"].Value);
        //        con.Close();
        //    }
        //    catch (Exception e)
        //    {
        //        Console.WriteLine(e);
        //    }
        //    return Chain[bd.block];
        //}

        public void AddBlock(Block block)
        {
            //Block latestBlock = GetLatestBlock();
            bd.dataset();
            string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlCommand com;
            SqlConnection con = new SqlConnection(strConnString);
            com = new SqlCommand();
            com.Connection = con;
            try
            {
                con.Open();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "prevblock";
                com.Parameters.Add("@block", SqlDbType.VarChar, 50);
                com.Parameters["@block"].Direction = ParameterDirection.Output;
                com.Dispose();
                com.ExecuteScalar();
                bd.block = Convert.ToInt32(com.Parameters["@block"].Value);
                con.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }


            block.Index = bd.block + 1;
            block.PreviousHash = bd.prevhash;
            
            
            bd.blocks(block);

            block.Mine(this.Difficulty);

            String connection = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
            SqlConnection sqlcon = new SqlConnection(connection);
            try
            {
                sqlcon.Open();
                SqlCommand sqlcmd = new SqlCommand("isvalidupdate", sqlcon);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@block", block.Index);
                
                sqlcmd.Parameters.AddWithValue("@Isvalid",  IsValid(block).ToString());
                sqlcmd.Parameters.AddWithValue("@Nonce", block.Nonce);
                sqlcmd.ExecuteNonQuery();
                sqlcon.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

         }

        public bool IsValid(DRSN.Business_Application.Block block)
        {
            for (int i = 1; i < block.Index; i++)
            {
                Block currentBlock = block;

                //need to get the whole prevhash data
                string validprevhash = String.Empty;
                string strConnString = ConfigurationManager.ConnectionStrings["DRSNdatabase"].ConnectionString;
                SqlCommand com;

                SqlConnection con = new SqlConnection(strConnString);
                com = new SqlCommand();
                com.Connection = con;
                try
                {
                    con.Open();
                    com.CommandType = CommandType.StoredProcedure;
                    com.CommandText = "isvalidprevhash";
                    com.Parameters.Add("@prhash", SqlDbType.VarChar, 50);
                    com.Parameters["@prhash"].Direction = ParameterDirection.Output;
                    com.Dispose();
                    com.ExecuteScalar();
                    //Storing the output parameters value in 3 different variables.  
                    validprevhash = Convert.ToString(com.Parameters["@prhash"].Value);
                    con.Close();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }

                //Block previousBlock = Convert.ToInt32(block.Index - 1);

                if (currentBlock.Hash != currentBlock.CalculateHash())
                {
                    return false;
                }

                if (currentBlock.PreviousHash != validprevhash)
                {
                    return false;
                }
            }
            bd.isvalid = "True";
            return true;
        }
    }
}