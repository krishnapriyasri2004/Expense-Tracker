
<!DOCTYPE html>
<html>
<head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com">

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/font/bootstrap.min.css">
		
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
                        
        <link href="bootstrap.min.css" type="text/css" rel="stylesheet">

        <link href="bootstrap-icons.css" type="text/css" rel="stylesheet">

        <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">  
 <style>
      body {
      font-family: 'Montserrat', sans-serif;
      background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
      }
      h1 {
      text-align: center;
      color: white; 
      }
      form {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      animation: form-fade-in 1s ease-in-out;
    }
    th {
      white-space: nowrap;
      text-align: center;
      color: rgba(255, 255, 255);
      font-size: 30px;
    }
    td {
      text-align: justify;
      color: rgba(255, 255, 255);
    }
     table {
            width: 100%;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        td input, td select {
            margin-top: 5px;
        }
      td input[type="text"],
      td input[type="file"] {
        width: 100%;
        box-sizing: border-box;
      }
      button {
    display: inline-block; /* Ensures the link behaves like a block element */
    padding: 10px 20px; /* Adjust padding as needed */
    font-size: 16px; /* Adjust font size as needed */
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    border: 2px solid #3498db; /* Button border color */
    color: #3498db; /* Button text color */
    background-color: #fff; /* Button background color */
    border-radius: 5px; /* Button border radius */
    transition: background-color 0.3s, color 0.3s;
}

     .button:hover {
    background-color: #3498db; /* Hover background color */
    color: #fff; /* Hover text color */
}
              .content-container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            margin: 20px;
        }
        .table-container, .button-container {
            width: 1000px;
            text-align: center;
        }
        .image img {
            width: 400px;
            height: auto;
        }
 </style>
</head>
<body>
    <div id="sticky-wrapper" class="sticky-wrapper" style= "height:100px" style= "width:2000px">

            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.html">
                        <i class="bi-back"></i>
                        <span>SDK Expense Tracker</span>
                    </a>

                    <div class="d-lg-none ms-auto me-4">
                        <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                    </div>
    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-lg-5 me-lg-auto">
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="index.html#section_1"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="About.jsp">About</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="login.jsp">Login</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="#section_5">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="home.jsp">Usage</a>
                            </li>

                        </ul>

                        <div class="d-none d-lg-block">
                            <a href="#top" class="navbar-icon bi-person smoothscroll"></a>
                        </div>
                    </div>
                </div>
            </nav>
                    </div> <br> <br> <br>
    <br> <br> 
    <div class="content-container">
    <div class="image">
       <img src="exp.png" alt="Expense" />
    </div>
    <div class = "table-container">

        <% 
            String username = (String) session.getAttribute("username");
            String email = null;
            String fullname = null;
            int age = 0;
            int salary = 0;
            int val = 0;
            if (username != null && !username.isEmpty()) {
                fullname = (String) session.getAttribute("fullname");
                email = (String) session.getAttribute("email");
                age = (int) session.getAttribute("age");
                salary = (int) session.getAttribute("salary");
        %>
        <form action="home.jsp" method="post" >
        <table style="width: 300px; text-align: center;">
            <tr>
                <th> User Profile </th>
            </tr>
            <tr>
                <td>Full name:</td>
                <td><%=fullname%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=email%></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td ><%=age%></td>
            </tr>
            <tr>
                <td>Salary:</td>
                <td><%=salary%></td>
            </tr>
        </table>
        <input type="submit" value="Start Tracking">
        </form>

        <%
            } else {
        %>
       <a href='login.jsp' class="button"> Login </a>

        <%
            }
        %>
    </div>
    </div>
                    <section class="contact-section section-padding section-bg" id="section_5">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-12 text-center">
                            <h2 class="mb-5">Get in touch</h2>
                        </div>

                        <div class="col-lg-5 col-12 mb-4 mb-lg-0">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.1372733493376!2d77.0272806!3d11.0283259!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba858979f85136b%3A0xdd9ca28d3c37cf8a!2sCoimbatore%20Institute%20of%20Technology!5e0!3m2!1sen!2sin!4v1696514720330!5m2!1sen!2sin" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        

                        <div class="col-lg-3 col-md-6 col-12 mx-auto">
                            <h4 class="mb-3">Office</h4>

                            <p>Coimbatore Institute of Technology</p>

                            <hr>

                            <p class="d-flex align-items-center mb-1">
                                <span class="me-2">Phone</span>

                                <a href="tel: 110-220-3400" class="site-footer-link">
                                    9345604115
                                </a>
                            </p>

                            <p class="d-flex align-items-center">
                                <span class="me-2">Email</span>

                                <a href="mailto:71762133027@cit.edu.in" class="site-footer-link">
                                    71762133027@cit.edu.in
                                </a>
                            </p>
                        </div>

                        <div class="col-lg-3 col-md-6 col-12 mb-3 mb-lg- mb-md-0 ms-auto">
                            <h4 class="mb-3">Virtual Office</h4>

                    

                            <hr>

                            <p class="d-flex align-items-center mb-1">
                                <span class="me-2">Phone</span>

                                <a href="tel: +918754891109" class="site-footer-link">
                                    8754891109
                                </a>
                                <a href="tel: +919047547774" class="site-footer-link">
                                    9047547774
                                </a>
                            </p>

                            <p class="d-flex align-items-center">
                                <span class="me-2">Email</span>

                                <a href="mailto:71762133042@cit.edu.in" class="site-footer-link">
                                    71762133042@cit.edu.in
                                </a>
                            </p>
                        </div>

                    </div>
                </div>
            </section>

</body>
</html>
    