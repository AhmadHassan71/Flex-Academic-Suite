<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherFeedbackReport.aspx.cs" Inherits="FeedbackReport" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

	<link rel="stylesheet" href="style3.css">
</head>
<body>
    <form id="form1" runat="server">
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
                    <a class="nav-link" href="Facult.aspx">Home</a>
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

<asp:GridView ID="TeacherEvaluationGrid" runat="server" AutoGenerateColumns="true" ShowHeaderWhenEmpty="true"></asp:GridView>
      <Columns>
        <asp:BoundField runat="server" DataField="TeacherName" HeaderText="Teacher Name" />
        <asp:BoundField  runat="server" DataField="TeacherAttendance" HeaderText="Attendance Remarks" DataFormatString="{0:d}" />
        <asp:BoundField runat="server"  DataField="class" HeaderText="Class Enviroment" />
        <asp:BoundField runat="server" DataField="motiv" HeaderText="Teacher Motivation" />
        <asp:BoundField runat="server" DataField="art" HeaderText="Teacher Articulativeness" />
        <asp:BoundField runat="server" DataField="aq1" HeaderText="Assignment and Quiz Relevancy" />
        <asp:BoundField runat="server" DataField="aq2" HeaderText="Assignment and Quiz Critical Pedagogy" />
        <asp:BoundField runat="server" DataField="resp" HeaderText="Teacher Behaviour" />
        <asp:BoundField runat="server" DataField="str" HeaderText="Strengths-based Approach" />
        <asp:BoundField runat="server" DataField="weak" HeaderText="Weakness-based Approach" />

      </Columns>
    </asp:GridView>
        
    </form>

</body>
</html>