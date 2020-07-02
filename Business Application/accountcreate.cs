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
using System.Security.Cryptography.X509Certificates;

namespace DRSN.Business_Application 
{
    public class accountcreate:Signup
    {
        //User_Interface.Signup.Authenticate au = new Authenticate();
        //public override void userdetails(string name, string email, string mobile, string password, string accointid, string publicaddress, string privateaddress, string emailverificationcode, string mobileverificationcode, string emailstatus, string mobilestatus)
        //{
        //    au.userdata();
        //    //name = HttpContext.Current.Session["name"].ToString();
        //    //email = HttpContext.Current.Session["email"].ToString();
        //    //mobile = HttpContext.Current.Session["mobile"].ToString();
        //    //password = HttpContext.Current.Session["password"].ToString();
        //    //accointid = HttpContext.Current.Session["accountid"].ToString();
        //    //publicaddress = HttpContext.Current.Session["publickey"].ToString();
        //    //privateaddress = HttpContext.Current.Session["privkey"].ToString();
        //    //emailstatus = HttpContext.Current.Session["status"].ToString();
        //    //mobilestatus = HttpContext.Current.Session["status"].ToString();
        //}

        public String activationcode;
        Common.Signup signup = new Common.Signup();
        public void verifyemail(string email)
        {

            Random random = new Random();
            activationcode = random.Next(100001, 999999).ToString();
            signup.emailverificationcode = activationcode;
            //adduser ad = new adduser();
            //ad.emailc = activationcode;

            HttpContext.Current.Session["emailcode"] = activationcode;
            sendcode(email);

            //MssGenerateMnemo(out string ssMnemo);
        }

        public void sendcode(string email)
        {
            Signup s = new Signup();
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("shilpapan0301@gmail.com", "xxx9ll45chv321!");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Authenticate your email with DRSN";
            msg.Body = "Hi " + signup.name + ", \n\nThe authentication code for your email id is " + signup.emailverificationcode + 
                 "\n\n\nRegards\nDRSN Team";
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

        public void createaddress(out string publickey, out string privatekey)
        {
            Key privateKey = new Key(); // generate a random private key
            PubKey publicKey = privateKey.PubKey;
            //Console.WriteLine(publicKey); // 0251036303164f6c458e9f7abecb4e55e5ce9ec2b2f1d06d633c9653a07976560c
            publickey = publicKey.ToString();
            privatekey = privateKey.ToString();
            HttpContext.Current.Session["publickey"] = publicKey.ToString();
            HttpContext.Current.Session["privkey"] = privatekey.ToString();
        }



    }


}