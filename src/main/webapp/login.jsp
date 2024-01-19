<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
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
            font-family: Arial, sans-serif;
            background-image: linear-gradient(100deg, #13547a 10%, #80d0c7 100%);
        }
       
        h1 {
            font-family: Cambria;
            text-align: center;
            color:white;
            font-size: 40px;
        }
       
        form {
            max-width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            width: 90%%;
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p.error-message {
            color: red;
            text-align: center;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div id="sticky-wrapper" class="sticky-wrapper" style= "height:75px">

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
                                <a class="nav-link click-scroll" href="register.jsp">Register</a>
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
                    </div>
    <h1> <br> <br> <br> Login </h1> <br>
    <form action="LoginServlet" method="post">
        <label for="username">Userid:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Login">
        </form>
    <% if (request.getParameter("error") != "db") { %>
        <p class="error-message">Invalid username or password.</p>
    <% }else if ((request.getParameter("error") != null)){
    	response.sendRedirect("adminpage.jsp");
    	
    } %> <br> <br> 
    
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