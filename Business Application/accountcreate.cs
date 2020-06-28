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

namespace DRSN.Business_Application
{
    public class accountcreate:Signup
    {
        static String activationcode;
        public void verifyemail(string email)
        {
            Random random = new Random();
            activationcode = random.Next(100001, 999999).ToString();
            //String query = "insert into emaildetails(name, address, status, code) values('" + name + "','" + email + "','Unverified','" + activationcode + "')";
            //String conn =
            //SqlConnection con = new SqlConnection(conn);
            //con.Open();
            //SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = query;
            //cmd.Connection = con;
            //cmd.ExecuteNonQuery();
            sendcode();

        }

        private void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("shilpapan0301@gmail.com", "xxx9ll45chv321!");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "";
            msg.Body = "" + activationcode;
            string toAddress = email;
            msg.To.Add(toAddress);
            string fromaddress = "Disaster Resilience Seystem Network <shilpapan0301 @gmail.com>";
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
         public void verifymobile(int mobile)
        {

        }
        static void createaccountid()
        {

        }
        static void createaddress()
        {

        }
        static void sendemail()
        {

        }
    }


}