<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Facult.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<link rel="stylesheet" href="style3.css">
</head>
<body><header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		
				<div class="headerlogo">
			<img src="Flex-Login-3.png" alt="Flex logo">
		</div>
      
        <a class="navbar-brand" href="#">Teacher Interface</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Attendance Sheet Report</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Marks Evaluation Report</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Grade Report</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="#">Count of Grades Report</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="#">Student Feedback Report</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Home_T.aspx">LogOut</a>
                </li>
            </ul>
        </div>
             
    </nav>
</header>
    <div class="container mt-4" id="personal-details">
    <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-header">
                    <div class="card-body">
                        <h5 class="card-title"><asp:Label ID="nameLabel" runat="server"></asp:Label></h5>
                        <p class="card-text"><asp:Label ID="departmentLabel" runat="server"></asp:Label></p>
                        <p class="card-text"><asp:Label ID="universityLabel" runat="server"></asp:Label></p>
                        <p class="card-text"><asp:Label ID="emailLabel" runat="server"></asp:Label></p>
                        <p class="card-text"><asp:Label ID="phoneLabel" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>