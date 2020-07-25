namespace DRSN.Data_Access
{
    public enum CryptoOperation
    {
        ENCRYPT,
        DECRYPT
    };
    public class RSA
    {
        public void startrsa()
        {
            // Asymmetric crypto
            RSACspDemo.LaunchDemo();
            //RsaFileDemo.LaunchDemo();
            //RsaInMemoryDemo.LaunchDemo();
        }
    }
}