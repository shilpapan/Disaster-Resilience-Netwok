﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DRSN.Common
{
    public class Signup
    {
        private string Fullname;

        public string name
        {
            get { return Fullname; }
            set { Fullname = value; }
        }

        private string Email;

        public string email
        {
            get { return Email; }
            set { Email = value; }
        }

        private string Mobile;

        public string mobile
        {
            get { return Mobile; }
            set { Mobile = value; }
        }

        private string Password;

        public string password
        {
            get { return Password; }
            set { Password = value; }
        }

        private string Accountid;

        public string accointid
        {
            get { return Accountid; }
            set { Accountid = value; }
        }

        private string Publicaddress;

        public string publicaddress
        {
            get { return Publicaddress; }
            set { Publicaddress = value; }
        }

        private string Privateaddtess;

        public string privateaddress
        {
            get { return Privateaddtess; }
            set { Privateaddtess = value; }
        }

        private string Emailverificationcode;

        public string emailverificationcode
        {
            get { return Emailverificationcode; }
            set { Emailverificationcode = value; }
        }

        private string Mobileverificationcode;

        public string mobileverificationcode
        {
            get { return Mobileverificationcode; }
            set { Mobileverificationcode = value; }
        }

        private string Emailstatus;

        public string emailstatus
        {
            get { return Emailstatus; }
            set { Emailstatus = value; }
        }

        private string Mobilestatus;

        public string mobilestatus
        {
            get { return Mobilestatus; }
            set { Mobilestatus = value; }
        }

        //public virtual void userdetails(string name,string email, string mobile, string password, string accointid, string publicaddress,
        //    string privateaddress, string emailverificationcode, string mobileverificationcode, string emailstatus, string mobilestatus)
        //{
        //    this.Fullname = name;
        //    this.Email = email;
        //    this.Mobile = mobile;
        //    this.Password = password;
        //    this.Accountid = accointid;
        //    this.Publicaddress = publicaddress;
        //    this.Privateaddtess = privateaddress;
        //    this.Emailverificationcode = emailverificationcode;
        //    this.Emailstatus = emailstatus;
        //    this.Mobilestatus = mobilestatus;
        //}
    }

}