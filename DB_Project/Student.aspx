<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Academic Portal</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="style3.css">
	<link rel="stylesheet" href="std.js">

</head>
<body>
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
							<a class="nav-link" href="#">Home</a>
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
	<main>
		<section class="welcome-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h1>Welcome, Student</h1>
						<p>Your current CGPA is </p>
					</div>
					
				</div>
			</div>
		</section>
		<section class="attendance-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2>Attendance</h2>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Course</th>
									<th>Total Classes</th>
									<th>Present</th>
									<th>Absent</th>
									<th>Percentage</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Course 1</td>
									<td>30</td>
									<td>25</td>
									<td>5</td>
									<td>83.33%</td>
								</tr>
								<tr>
									<td>Course 2</td>
									<td>30</td>
									<td>27</td>
									<td>3</td>
									<td>90.00%</td>
								</tr>
							<tr>
								<td>Course 3</td>
								<td>30</td>
								<td>28</td>
								<td>2</td>
								<td>93.33%</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<section class="evaluation-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>Evaluation Marks</h2>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Course</th>
								<th>Quiz</th>
								<th>Assignment</th>
								<th>Midterm</th>
								<th>Final</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Course 1</td>
								<td>80</td>
								<td>90</td>
								<td>85</td>
								<td>90</td>
								<td>345</td>
							</tr>
							<tr>
								<td>Course 2</td>
								<td>90</td>
								<td>85</td>
								<td>90</td>
								<td>80</td>
								<td>345</td>
							</tr>
							<tr>
								<td>Course 3</td>
								<td>95</td>
								<td>85</td>
								<td>90</td>
								<td>95</td>
								<td>365</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<section class="transcript-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id ="barchart">
					<h2>Transcript</h2>
					<canvas id="myChart" width="100" height="100"></canvas>
				</div>
			</div>
			</div>
		</div>
	</section>
</main>
<footer class="bg-light text-center">
	<p>&copy; 2023 Flex Academic Portal. All rights reserved.</p>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="std.js"></script>
</body>
	</html>