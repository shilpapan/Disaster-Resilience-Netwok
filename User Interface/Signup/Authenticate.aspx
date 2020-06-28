<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authenticate.aspx.cs" Inherits="DRSN.User_Interface.Signup.Authenticate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authenticate your account in DRSN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="assets/image/png" href="assets/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">
						Authenticate your email and moile number
					</span>
				</div>

				<div>
					<asp:Label runat="server" ID="otp"></asp:Label>
				</div>

				<form class="login100-form validate-form" id="form2" runat="server">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Email otp required">
						<span class="label-input100">Email otp</span>
						<asp:TextBox class="input100" type="text" name="username" placeholder="Enter email otp" runat="server" ID="aemail"/>
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<asp:Button class="login100-form-btn" runat="server" Text="Authenticate Email" ID="eauth" OnClick="eauth_Click">
							
						</asp:Button>
					</div>

					<div>
					<asp:Label runat="server" ID="everified"></asp:Label>
				</div>

					<div><br /><br /></div>
					<div class="wrap-input100 validate-input m-b-18" data-validate = "Mobile otp required">
						<span class="label-input100">Mobile otp</span>
						<asp:TextBox class="input100" type="password" name="pass" placeholder="Enter mobile otp" runat="server" ID="amobile"/>
						<span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<asp:Button class="login100-form-btn" runat="server" Text="Authenticate Mobile" ID="mauth">
							
						</asp:Button>
					</div>

					<div>
					<asp:Label runat="server" ID="mverified"></asp:Label>
				</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/bootstrap/js/popper.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="assets/js/main.js"></script>

</body>
</html>
