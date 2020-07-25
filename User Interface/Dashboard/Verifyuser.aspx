<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verifyuser.aspx.cs" Inherits="DRSN.User_Interface.Dashboard.Verifyuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
<title>Example of Auto Loading Bootstrap Modal on Page Load</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#myModal").modal('show');
	});
</script>
</head>
<body runat="server">
   <div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                <h4 class="modal-title" style="font-family:Georgia;color:red;font-style:italic"><b>You have not authenticated your account!!!</b></h4>
            </div>
            <div class="modal-body">
				<p>Authenticate your account to avail our services</p>
                <form runat="server">
                    <div class="form-group">
                        <%--<input type="text" class="form-control" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email Address">--%>
                        <%--<asp:Button class="btn btn-primary" Text="Authenticate your account" runat="server" OnClickEvent="verifyuser" />--%>
                    
                    
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Authenticate your account" class="btn btn-primary" />
                    </div>
                    <%--<button type="submit" class="btn btn-primary">Subscribe</button>--%>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
