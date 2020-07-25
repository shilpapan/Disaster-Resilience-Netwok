using DRSN.Common;
using System;
using System.Web;
using System.Net.Mail;
using NBitcoin;


namespace DRSN.Business_Application 
{
    public class accountcreate:Signup
    {


        public String activationcode;
        Common.Signup signup = new Common.Signup();
        public void verifyemail(string email)
        {

            Random random = new Random();
            activationcode = random.Next(100001, 999999).ToString();
            signup.emailverificationcode = activationcode;


            HttpContext.Current.Session["emailcode"] = activationcode;
            sendcode(email);

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

        public void createaddress(out string publickey, out BitcoinSecret privatekey)
        {
            Key privateKey = new Key();
            PubKey publicKey = privateKey.PubKey;
            publickey = publicKey.GetAddress(ScriptPubKeyType.Legacy, Network.Main).ToString();
            privatekey = privateKey.GetWif(Network.Main);
            HttpContext.Current.Session["publickey"] = publickey.ToString();
            HttpContext.Current.Session["privkey"] = privatekey.ToString();
        }



    }


}