<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="DRSN.User_Interface.Dashboard.News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Update a news</title>
</head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<body>
    <form id="form1" runat="server">
        <div>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="but" onclick="changeVisibility()">
  Launch demo modal
</button>
        </div>

        <!--Modal-->

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Briefly explain the upcoming situation and measures</h5>
          <button type="button" class="close" aria-label="Close">
  <span aria-hidden="true">&times;</span>
</button>
          
          </div>
      <div class="modal-body mx-3">
        <!-- Body start-->

        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="form34" class="form-control validate" runat="server"/>
          <label data-error="wrong" data-success="right" for="form34">Type of disaster</label>
        </div>

        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="text" id="form29" class="form-control validate" runat="server"/>
          <label data-error="wrong" data-success="right" for="form29">Pre determined Impacts</label>
        </div>

        <div class="md-form mb-5">
          <i class="fas fa-tag prefix grey-text"></i>
          <input type="text" id="form32" class="form-control validate" runat="server"/>
          <label data-error="wrong" data-success="right" for="form32">Participating Organizations</label>
        </div>

        <div class="md-form">
          <i class="fas fa-pencil prefix grey-text"></i>
          <textarea type="text" id="form8" class="md-textarea form-control" rows="4" runat="server"></textarea>
          <label data-error="wrong" data-success="right" for="form8">Rescue and Relief measures </label>
        </div>


          <!-- Body end-->
      
      <div class="modal-footer">
          <asp:Button ID="Button3" runat="server" Text="Close" CssClass="btn btn-secondary" data-dismiss="modal"/>
          <asp:Button ID="Button4" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="Button4_Click1" />

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
    <script>
        function changeVisibility() {
            document.getElementById("but").style.visibility = "hidden";
        }

    </script>
</body>
</html>
