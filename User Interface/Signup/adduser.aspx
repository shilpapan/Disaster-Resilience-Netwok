﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adduser.aspx.cs" Inherits="DRSN.User_Interface.Signup.adduser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign up in DRSN</title>
    <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
<!--===============================================================================================-->
</head>
<body style="background-color: #999999;">


	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('images/bg-01.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form id="form1" runat="server">
					<span class="login100-form-title p-b-59">
						Sign Up
					</span>

					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">Full Name</span>
						<asp:TextBox class="input100" type="text" name="name" placeholder="Name..." runat="server" id="name"/>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<span class="label-input100">Email</span>
						<asp:TextBox class="input100" type="text" name="email" placeholder="Email addess..." id="email" runat="server"/>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Mobile Number is required">
						<span class="label-input100">Mobile Number</span>
						<asp:TextBox class="input100" type="number" name="number" placeholder="Mobile Number" id="mobile" runat="server"/>
						<span class="focus-input100"></span>
					</div>
											<asp:Label ID ="mob" runat="server">
						<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
        ErrorMessage="Error" ForeColor="Red" ControlToValidate="mobile"
        ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator></asp:Label>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<asp:TextBox class="input100" type="password" name="password" id="password" placeholder="*************" runat="server" OnTextChanged="password_TextChanged"/>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
							ErrorMessage="Your password must contain atleast 8 characters, 1 lowercase, 1 uppercase, 1 symbol and 1 digit" 
							ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" ControlToValidate="password" ForeColor="Red"></asp:RegularExpressionValidator>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
						<span class="label-input100">Repeat Password</span>
						<asp:TextBox class="input100" type="password" name="confirmpassword" id="confirmpassword" placeholder="*************" runat="server"/>
						<span class="focus-input100"></span>
					</div>
					<div><asp:Label ID="matchpassword" runat="server" ForeColor="Red">
						<asp:CompareValidator id="comparePasswords" 
              runat="server"
              ControlToCompare="password"
              ControlToValidate="confirmpassword"
              ErrorMessage="Your passwords do not match up!"
              Display="Dynamic" /></asp:Label><br /><br /></div>
					

					<div class="flex-m w-full p-b-33">
						<div class="contact100-form-checkbox">
							
							<asp:Checkbox class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" runat="server"/>
							<label class="label-checkbox100" for="ckb1">
								<span class="txt1">
									I agree to the <a href="#" class="txt2 hov1">Terms of User </a></span></label></div></div><div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<%--<asp:Button class="login100-form-btn" runat="server" ForeColor="#CC00CC" Text="Sign up" ID="sign"/></div>--%>
							<div>

							<asp:Button ID="Button1" runat="server" Text="Sgin Up" class="login100-form-btn" ForeColor="#CC00CC" OnClick="Button1_Click" /></div></div>
						<br /> <br /><div>
							<a href="../Login/Login.aspx" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30">
							Sign in  <i class="fa fa-long-arrow-right m-l-5"></i></a></div></div></form></div></div></div><!--===============================================================================================--><script src="vendor/jquery/jquery-3.2.1.min.js"></script><!--===============================================================================================--><script src="vendor/animsition/js/animsition.min.js"></script><!--===============================================================================================--><script src="vendor/bootstrap/js/popper.js"></script><script src="vendor/bootstrap/js/bootstrap.min.js"></script><!--===============================================================================================--><script src="vendor/select2/select2.min.js"></script><!--===============================================================================================--><script src="vendor/daterangepicker/moment.min.js"></script><script src="vendor/daterangepicker/daterangepicker.js"></script><!--===============================================================================================--><script src="vendor/countdowntime/countdowntime.js"></script><!--===============================================================================================--><script src="js/main.js"></script></body></html>