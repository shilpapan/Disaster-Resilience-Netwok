using DRSN.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Collections.Specialized;
using System.Configuration;
using NBitcoin;
using QBitNinja.Client;
using QBitNinja.Client.Models;
using DRSN.Common;
using DRSN.User_Interface.Signup;

namespace DRSN.Business_Application 
{
    public class accountcreate:Signup
    {

        public override void userdetails(string name, string email, string mobile, string password, string accointid, string publicaddress, string privateaddress, string emailverificationcode, string mobileverificationcode, string emailstatus, string mobilestatus)
        {
            base.userdetails(name, email, mobile, password, accointid, publicaddress, privateaddress, emailverificationcode, mobileverificationcode, emailstatus, mobilestatus);



        }



        static String activationcode;
        Common.Signup signup = new Common.Signup();
        public void verifyemail(string email)
        {
            
                Random random = new Random();
                activationcode = random.Next(100001, 999999).ToString();
                signup.emailverificationcode = activationcode;
                
                sendcode(email);
           
        }

        private void sendcode(string email)
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("shilpapan0301@gmail.com", "xxx9ll45chv321!");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Authenticate your email with DRSN";
            msg.Body = "Hi " + signup.name + ", \n\nThe authentication code for your email id is " + signup.emailverificationcode + "\n\nYour user id is: " + signup.accointid +
                "Please use this id as userid when you login. \n\n\nRegards\nDRSN Team";
            string toaddress = email;
            msg.To.Add(toaddress);
            string fromaddress = "DRSN Team <shilpapan0301@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);


            }
            catch
            {
                throw;
            }
        }

        static void createaddress()
        {

        }

        public void MssGenerateMnemo(out string ssMnemo)
        {

            Mnemonic mnemonic = new Mnemonic(Wordlist.English, WordCount.Twelve);

            ssMnemo = mnemonic.ToString();

        }

        public void MssGenerateAddress(
    string ssMnemo,
    int ssKeynumber,
    bool ssIsTestNet,
    out string ssAddress,
    out string ssPrivateKey)
        {

            Network net;
            if (ssIsTestNet)
                net = Network.TestNet;
            else
                net = Network.Main;

            Mnemonic restoreNnemo = new Mnemonic(ssMnemo);

            ExtKey masterKey = restoreNnemo.DeriveExtKey();

            KeyPath keypth = new KeyPath("m/44'/0'/0'/0/" + ssKeynumber);
            ExtKey key = masterKey.Derive(keypth);

            ssAddress = key.PrivateKey.PubKey.GetAddress(net).ToString();
            ssPrivateKey = key.PrivateKey.GetBitcoinSecret(net).ToString();

            signup.publicaddress = ssAddress;
            signup.privateaddress = ssPrivateKey;

        }


    }


}