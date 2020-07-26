<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceptrequest.aspx.cs" Inherits="DRSN.User_Interface.Dashboard.Acceptrequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enter a requestid</title>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
  
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="display:none" id="but">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please enter a request id</h4>
        </div>
        <div class="modal-body">
          <p>
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <asp:Button ID="Button1" runat="server" Text="Accept" CssClass="btn btn-primary" OnClick="Button1_Click"/>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

        </div>
    </form>
    <script>
        window.onload = function () {
            this.document.getElementById("but").click();
        }

    </script>
</body>
</html>
