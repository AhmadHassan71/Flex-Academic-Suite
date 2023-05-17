<!DOCTYPE html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Table Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <link rel="stylesheet" href="style3.css">
</head>
  <body>
      <header>
          <nav class="navbar navbar-expand-lg navbar-light bg-light">

              <div class="headerlogo">
                  <img src="Flex-Login-3.png" alt="Flex logo">
              </div>

              <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                      <li class="nav-item active">
                          <a class="nav-link" href="AcademicOfficer.aspx">Home</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="CourseReport.aspx">Offered Courses Report</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="SectionReport.html">Students Section Report</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="CourseAllocation.html">Course Allocation Report</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="Home_A.aspx">LogOut</a>
                      </li>
                  </ul>
              </div>

          </nav>
      </header>
      <div class="container mt-4">
          <table class="table table-bordered">
              <thead>
                  <tr>
                      <th>CourseCode</th>
                      <th>SectionID</th>
                      <th>FacultyID</th>
                      <th>CourseName</th>
                      <th>Credit_Hours</th>
                      <th>Pre_Req</th>
                      <th colspan="2">SemesterID</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td>CS2005</td>
                      <td>BS213-C</td>
                      <td>FT-1002</td>
                      <td>Database Systems</td>
                      <td align="right">3</td>
                      <td>CS2001</td>
                      <td>S2023</td>
                      <td></td>
                  </tr>
                  <tr>
                      <td>ENG101</td>
                      <td>BS101-A</td>
                      <td>FT-1001</td>
                      <td>Introduction to Literature</td>
                      <td align="right">3</td>
                      <td></td>
                      <td>F2022</td>
                      <td></td>
                  </tr>
                  <tr>
                      <td>MATH2001</td>
                      <td>BS211-A</td>
                      <td>FT-1003</td>
                      <td>Calculus and Analytical Geometry</td>
                      <td align="right">4</td>
                      <td></td>
                      <td>S2023</td>
                      <td></td>
                  </tr>
                  <tr>
                      <td>CS2102</td>
                      <td>BS222-A</td>
                      <td>FT-1002</td>
                      <td>Object Oriented Programming</td>
                      <td align="right">3</td>
                      <td>CS2005</td>
                      <td>S2022</td>
                      <td></td>
                  </tr>
              </tbody>
          </table>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
