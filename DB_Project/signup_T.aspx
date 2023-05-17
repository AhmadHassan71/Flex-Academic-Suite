
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup_T.aspx.cs" Inherits="EvalForm" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>SIGNUP</title>
    <link rel="stylesheet" type="text/css" href="style2.css">

</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="Flex-Login-3.png" alt="Flex logo">
        </div>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="labelLogin"></asp:Label>

        <form runat="server">

            <div class="form-group">
                <label for="roll-number">Username</label>
                <asp:TextBox ID="Username" runat="server" required ></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="name">Name</label>
                <asp:TextBox ID="Name" runat="server" required ></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="CNIC">CNIC</label>
                <asp:TextBox ID="CNIC" runat="server" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <asp:TextBox ID="Email" runat="server" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="PhoneNum">Phone Number</label>
                <asp:TextBox ID="Phonenum" runat="server" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Address">Address</label>
                <asp:TextBox ID="Address" runat="server" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="Password" runat="server" required ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Confirm Password</label>
                <asp:TextBox ID="CP" runat="server" required ></asp:TextBox>
            </div>
            <div class="signup" >
                <asp:Button ID="Button1"  CssClass="btn-login" runat="server" Text="Signup" OnClick="Submit_Click" />
                </div>
        <div class="signup">
            <p>Already have an account? <a href="Home_T.aspx">Login</a></div></p>
        </form>

    </div>


</body>
</html>