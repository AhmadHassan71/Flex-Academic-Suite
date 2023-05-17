<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EvalForm.aspx.cs" Inherits="EvalForm" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Evaluation Portal</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="style3.css">
	<link rel="stylesheet" href="style3.css">
	
	<style type="text/css">
		body {
			background-color: #f0ffff;
		}
		h2 {
			color: #008b8b;
			text-align: center;
			margin-top: 50px;
			margin-bottom: 50px;
		}
		form {
			background-color: #ffffff;
			padding: 20px;
			margin-bottom: 50px;
		}
		label {
			color: #008b8b;
		}
		.btn {
			background-color: #008b8b;
			border-color: #008b8b;
			color:aliceblue
		}
		.btn:hover {
			background-color: #00bfff;
			border-color: #00bfff;
		}
	

	</style>
</head>
<body>
	<div class="container">
		<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<div class="headerlogo">
			<img src="Flex-Login-3.png" alt="Flex logo">
		</div>
				<!-- just replace the tables withs excel htmls -->
				<button class="navbar-toggler"  data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<a class="nav-link" href="Student.aspx">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="EvalForm.aspx">Evaluation Form</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#barchart">Transcript</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="Home_S.aspx">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
		<h2>Teacher Evaluation Form</h2>
		<form runat="server">
			<div class="form-group">
				<label for="name">Teacher Name:</label>
				<asp:TextBox ID="TeacherName" runat="server" CssClass="form-control" ></asp:TextBox>

			</div>
			<div class="form-group">
				<label for="course">Course-Code:</label>
				<asp:TextBox ID="CourseCode" runat="server" CssClass="form-control" ></asp:TextBox>

			</div>
			<div class="form-group">
				<label for="TeacherAttendance">Teacher attends the class in a presentable manner</label>
				<asp:DropDownList ID="Tat" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="class">The enviroment of the class is conductive for learning</label>
				<asp:DropDownList ID="classEnv" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			
			<div class="form-group">
				<label for="motiv">Teacher is motivated to teach</label>
				<asp:DropDownList ID="motiv" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="atriculate">Teacher is articulate and shows full knowledge about their subject</label>
				<asp:DropDownList ID="Articulate" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="aq1">The assignments and quizes given by the teacher are relevant to the course</label>
				<asp:DropDownList ID="aq1" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="aq">The assignments and quizes given by the teacher promote critical thinking</label>
				<asp:DropDownList ID="aq2" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="res">Teacher treats people from all the cultural, racial and religious backgrounds as equals</label>
				<asp:DropDownList ID="resp" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="str">Teacher finds students strengths as a basis for growth</label>
				<asp:DropDownList ID="str" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			<div class="form-group">
				<label for="weak">Teacher finds students weaknesses as an oppurtunity for improvement</label>
				<asp:DropDownList ID="weak" CssClass="form-control" runat="server">
					<asp:ListItem Text="5 - Strongly Agree" Value="5" />
					<asp:ListItem Text="4 - Agree" Value="4" />
					<asp:ListItem Text="3 - Neutral" Value="3" />
					<asp:ListItem Text="2 - Disagree" Value="2" />
					<asp:ListItem Text="1 - Strongly Disagree" Value="1" />
				</asp:DropDownList>
			</div>
			
			<div class="form-group">
				<label for="comments">Comments:</label>&nbsp;
				<asp:TextBox ID="Comments" runat="server" CssClass="form-control" ></asp:TextBox>

			</div>
			  <asp:Button runat="server" Text="Submit" CssClass="btn" OnClick="Submit_Click" />
		</form>
	</div>
</body>
</html>
