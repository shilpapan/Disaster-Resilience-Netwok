using DRSN.Business_Application;
using DRSN.User_Interface.Signup;
using NBitcoin;

namespace DRSN.Data_Access
{
    public class Signupform : accountcreate
    {
        Common.Signup signup = new Common.Signup();
        public void parametersinsert(string em)
        {
            User_Interface.Signup.adduser ad = new adduser();

            verifyemail(em);
            createaddress(out string publickey, out BitcoinSecret privatekey);            
        }       
    }
}