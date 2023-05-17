<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_A.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FLEX</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmIv373Qp8kXw2I8Vi1r"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+JqnjvayY8qzGxgJQUp8Xa2Ihq27NX"
		crossorigin="anonymous"></script>
  
</head>
<body>
	<div class="container">
    <form id="form1" runat="server">
       
		<div class="logo">
			<img src="Flex-Login-3.png" alt="Flex Logo" />
		</div>
			
						<h1>Welcome Academic Officer!</h1>
			
			<asp:Label ID="lblMessage" runat="server" Text="" CssClass="labelLogin"></asp:Label>
			<p></p>
			<div class="form-group">
				<label for="username" >Username</label>&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" placeholder= "aXXX" required></asp:TextBox>
			</div>
			<div class="form-group">
				<label for="password">Password</label>&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" placeholder= "Enter your password" required></asp:TextBox>
			</div>
			<div class="signup" >
				<asp:Button ID="Button1"  CssClass="btn-login" runat="server" Text="Login" OnClick="Button1_Click" />
                <p>
                    Don't have an account? Use ARN to <a href="signup_A.aspx">Sign up</a></p>
				</div>
</div>
		</form>
	
	
</body>
</html>
