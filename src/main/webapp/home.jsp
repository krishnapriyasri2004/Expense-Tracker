<!DOCTYPE html>
<%@ page import="com.servlet.files.ExpenseCalculator" %>
<%@ page import="java.math.BigDecimal" %>

<html>
<head>
  <title>SDK Expense Tracker</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@latest/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@latest/font/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600;700&family=Open+Sans&display=swap" rel="stylesheet">
    <link href="bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="bootstrap-icons.css" type="text/css" rel="stylesheet">
    <link href="templatemo-topic-listing.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css"> 
  <style>
  #main-container {
            display: flex;
            overflow: auto;
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
            
   }

   .scrollable-container {
            max-height: 400px;
            overflow: auto;
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }
    body {
      font-family: Arial, sans-serif;
      background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
    }
    #main-container,
      .scrollable-container,
      .container1,
      .container,
      .details-container,
      .expense-frame-container,
      .details-frame-container {
          background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
       }
    .scrollable-container {
            max-height: 400px; 
            overflow: auto; 
            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }
    .container1 {
     background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    margin: 0;
    right: 0;
    padding-top: 0;
    padding-bottom: 0;
    height: 75px;
    width: 8500px;
    }
 
    .container {
      max-width: 2000px;
      height: 68px;
      margin: 0 auto;
      top: 0;
      padding: 0;
       background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h1 {
      color: #333;
      font-size: 24px;
      margin-top: 0;
    }

    th {
      text-align: center;
      color: rgba(0, 0, 0);
    }
    td {
      text-align: justify;
      color: rgba(0, 0, 0);
    }
    table {
            width: 350px;
            border-collapse: collapse;
            margin-top: 20px;
            border-spacing: 0; /* Set border-spacing to 0 to reduce space between columns */
        }

        th, td {
            padding: 5px;
            text-align: left;
        }

        td input, td select {
            margin-top: 3px;
        }
      td input[type="text"],
      td input[type="file"] {
        width: 100%;
        box-sizing: border-box;
      }
    
    h2 {
      color: #333;
      font-size: 24px;
      margin-top: 0;
    }

    p {
      color: #666;
      font-size: 16px;
      margin-bottom: 20px;
    }

    .menu {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: space-between;
       background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li {
      margin-right: 10px;
       background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li a {
      color: #333;
      text-decoration: none;
      font-size: 16px;
      padding: 5px 10px;
      border-radius: 5px;
       background-image: linear-gradient(0deg, #13547a 0%, #80d0c7 100%);
    }

    .menu li a:hover {
       background-image: linear-gradient(0deg, #13547a 0%, #80d0c7 100%);
    }

    /* Add a style for the top-right corner */
    .user-info {
      text-align: right;
      font-size: 16px;
      color: #333;
      top: 255px;
    }
    .details-container {
            position: absolute; /* Use absolute positioning */
            left: 348px; /* Set the starting horizontal position */
            top: 78px; /* Set the starting vertical position */
            width: 820px; /* Set the container width */
            height: 1200px; /* Set the container height */
             background-image: linear-gradient(0deg, #13547a 0%, #80d0c7 100%);
        }

    /* Style for the frame */
.expense-frame-container {
  position: fixed;
  top: 78px;
  left: 0;
  width: 348px; /* Set the width to 300px */
  height: 100%; /* Set the height to 100% to cover the entire height */
   background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
  padding: 20px;
 /* Set height to 100vh for full viewport height */
    }
        /* Style for the frame */
.details-frame-container {
  position: fixed;
  top: 78px;
  right: 0;
  width: 348px; 
  height: 100%;
   background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
  padding: 20px;
  box-sizing: border-box; 
  overflow-y: scroll; 
    } 
   .details-frame-container img {
        width: 100%; /* Set the desired width, in this case, 100% of the container */
        max-width: 400px; /* Optionally, set a maximum width to prevent images from becoming too large */
        height: auto; /* Maintain the aspect ratio of the images */
        display: block; /* Remove any extra spacing below the images */
        margin: 0 auto; /* Center the images horizontally within the container */
    }

    .expense-frame-content {
       display: block; /* Display each radio button on a new line */
       margin-bottom: 10px;
    }


    /* Style for radio buttons */
    .radio-group {
      margin-top: 10px;

    }

    .radio-group label {
      margin-right: 10px;
    }
            /* Style text boxes */
        input[type="text"] {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        select {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            appearance: none;
            -webkit-appearance: none;
            background: url("dropdown-arrow.png") no-repeat right center;         }

        /* Style dropdown options */
        select option {
            background-color: #fff;
        }
        /* Style for login message */
        .login-message {
            text-align: center;
            font-size: 18px;
            color: #333;
            background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            backdrop-filter: blur(5px);
        }

.login-message h2 {
  font-size: 24px;
  margin-bottom: 10px;
}
.login-message a {
  text-decoration: none;
  background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
  color: #fff;
  padding: 10px 20px;
  border-radius: 5px;
  font-weight: bold;
  transition: background-color 0.3s;
}

.login-message a:hover {
  background-image: linear-gradient(0deg, #74EBD5 0%, #9FACE6 100%);
}      
    #myGroupedBarChart .axis-label,
    #myGroupedBarChart .axis-title {
        color: black !important; // Change color to black
    }
</style> 
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
<body>
      <div id="main-container">
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
                                <a class="nav-link click-scroll" href="index.html">  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Home</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="About.jsp">About</a>
                            </li>
    
                            <li class="nav-item">
                                <a class="nav-link click-scroll" href="register.jsp">Register</a>
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
                            <a href="viewProfile.jsp" class="navbar-icon bi-person smoothscroll"></a>
                        </div>
                    </div>
                </div>
            </nav>
                    </div>
         
                                       

<div class="expense-frame-container">
    <div class="expense-frame-content">
        <h2>Add your expenses</h2>

        <form action="ProcessExpensesServlet" method="post">
          <label for="expense-purpose">Expense Purpose:</label>
            <select id="expense-purpose" name="purpose">
                <option value="electricity">Electricity Bill</option>
                <option value="phone">Phone Bill</option>
                <option value="water">Water Bill</option>
                <option value="cable">Cable Bill</option>
                <option value="other-purpose">Other Purpose</option>
            </select>

            <!-- Text field for custom purpose -->
            <div id="other-purpose" style="display: none;">
                <label for="custom-purpose">Other Purpose:</label>
                <input type="text" id="custom-purpose" name="custom-purpose">
            </div>

            <!-- Amount input -->
            <label for="expense-amount">Amount:</label>
            <input type="text" id="expense-amount" name="amount" required>

            <br>
		<div class="radio-group">
        <label>
            <input type="radio" name="durationType" value="days" checked> Days
        </label><br>
        <label>
            <input type="radio" name="durationType" value="months"> Months
        </label><br>
        <label>
            <input type="radio" name="durationType" value="years"> Years
        </label><br><br>
    </div> 

    <div class="additional-input">
        <label>Enter Duration:</label>
        <input type="number" name="durationInput">
    </div>

			<label for="expense-date">Expense Date:</label>
   			<input type="date" id="expense-date" name="expense-date" required>
         
            <input type="submit" value="Add Expense">
        </form><br>
        <h2>Add Additional Income </h2>
        <form action="UpdateSalaryServlet" method="post">
    			<label for="newSalary">Additional Income</label>
    			<input type="text" id="newSalary" name="newSalary" required>
    			<br>
    			<input type="submit" value="Update Salary">
		</form>
    </div>
</div> 
<script>
    var purposeDropdown = document.getElementById("expense-purpose");
    var customPurposeField = document.getElementById("other-purpose");
    var customPurposeInput = document.getElementById("custom-purpose");

    purposeDropdown.addEventListener("change", function () {
        if (this.value === "other-purpose") {
            customPurposeField.style.display = "block";
        } else {
            customPurposeField.style.display = "none";
        }
    });
</script>
   
    <div class="details-container">
        <div class="user-info">
      <%String username = (String) session.getAttribute("username");
      String email = null;
      String fullname = null;
      int age = 0;
      int salary=0;
      int val=0;
      double totalSpending=0.0;
        if (username != null && !username.isEmpty()) {
        	 fullname = (String) session.getAttribute("fullname");
             email = (String) session.getAttribute("email");
             age = (int) session.getAttribute("age");
             salary = (int) session.getAttribute("salary");
      %> <br>
        Logged in as <%= username %>
      <%
        } else {
      %>
        Login
      <%
        }
      %>
    </div>
    <%
if (username != null && !username.isEmpty()) {
      %>

        <table>
            <tr>
                <th>User Details</th>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><%=fullname%></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><%=email%></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><%=age%></td>
            </tr>
            <tr>
                <td>Salary:</td>
                <td><%=salary%></td>
            </tr>
        </table> <br>
<%			

            totalSpending = ExpenseCalculator.calculateTotalSpending(username);

            // Display total spending
            out.println("<p><font color=black>Total spending for " + username + ": $" + totalSpending + "</p>");
            BigDecimal salaryBigDecimal = new BigDecimal(String.valueOf(salary));
            BigDecimal totalSpendingBigDecimal = new BigDecimal(String.valueOf(totalSpending));

            BigDecimal remaining2 = salaryBigDecimal.subtract(totalSpendingBigDecimal);
            float remaining = remaining2.floatValue();

            out.println("<p ><font color=Purple>Remaining: " + remaining+"</p>");
            if(remaining>= salary *0.8){
				val=8;
                out.println("<p><font color=green> You've 80% of your income on. Now time to enjoy the benefits ! <br> Refer the options to your right to utilize your savings efficiently. </p>");}
			else if(remaining >= salary * 0.50 && remaining <= salary * 0.79){
				val=7;
	        	out.println("<p> <font color=blue> You've more than 50% of your income still ! Now make it more beneficial by utilizing the options to your right. </p>");
	        	}
			else if(remaining >= salary * 0.35 && remaining <= salary * 0.49) {
				val=5;
	        	out.println("<p> <font color=yellow> You still have more than 30% of your income ! Now make it more beneficial by utilizing the options to your right. </p>");
			}
			else {
				val = 3;
	        	out.println("<p> <font color=red> Your funds are getting drained ! Start your savings plan now. No ideas? Refer to your right side of the screen. </p>");
			}
%>

<%
        } else{
      %> 
       <a href='login.jsp'> Login</a>

 <%} %>
 <br><br>
<h1><b>Expense Chart :</b></h1>
<h2 align ="Center">Total Expense :<%= totalSpending%></h2>
<canvas id="myPieChart" width="350" height="350" >

    <%    if(username!=null){
            	salary = (int) session.getAttribute("salary");
        		out.println("<h2>"+"The Total Salary is :"+salary+"</h2>");

            
            	
                totalSpending = ExpenseCalculator.calculateTotalSpending(username);
               // Prepare data for the chart
               double remaining = salary - totalSpending;
                String[] categories = {"Remaining", "Expense"};
                double[] data = {remaining, totalSpending};
                %>

                <script>
                    var data = {
                        labels: <%= new org.json.JSONArray(categories) %>,
                        datasets: [{
                            label: 'Expense Chart',
                            data: <%= new org.json.JSONArray(data) %>,
                            backgroundColor: [
                            	'rgba(39, 245, 169, 0.53)',
                            	'rgba(245, 39, 93, 0.53)'	

                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(46, 209, 0, 0.2)'

                            ],
                            borderWidth: 1
                        }]
                    };

                    var ctx = document.getElementById('myPieChart').getContext('2d');
                    
                    var myBarChart = new Chart(ctx, {
                        type: 'pie',
                        data: data,
                        options: {
                            responsive: false, // Disable responsiveness
                            maintainAspectRatio: false, // Disable aspect ratio
                            legend: {
                                display: true,
                                position: 'bottom'
                                // Adjust legend position
                            }
                        }
                    });
                </script>


<%} %>
 </canvas> <br> <br> <br>
 
<canvas id="myGroupedBarChart" width="600" height="400">

<%
if (username != null) {
    salary = (int) session.getAttribute("salary");
    totalSpending = ExpenseCalculator.calculateTotalSpending(username);

    // Calculate remaining amount
    double remainingAmount = salary - totalSpending;

    // Prepare data for the chart
    String[] labels = {"Attributes"};
    double[] totalSalaryData = {salary};
    double[] totalExpenseData = {totalSpending};
    double[] remainingAmountData = {remainingAmount};
%>

<script>
    var data = {
        labels: <%= new org.json.JSONArray(labels) %>,
        datasets: [
            {
                label: 'Total Salary',
                data: <%= new org.json.JSONArray(totalSalaryData) %>,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderWidth: 1
            },
            {
                label: 'Total Expense',
                data: <%= new org.json.JSONArray(totalExpenseData) %>,
                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                borderWidth: 1
            },
            {
                label: 'Remaining Amount',
                data: <%= new org.json.JSONArray(remainingAmountData) %>,
                backgroundColor: 'rgba(39, 245, 169, 0.53)',
                borderWidth: 1
            }
        ]
    };

    var ctx = document.getElementById('myGroupedBarChart').getContext('2d');

    var myGroupedBarChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: {
            responsive: false, // Disable responsiveness
            maintainAspectRatio: false, // Disable aspect ratio
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontColor: 'black' }
                // Adjust legend position
            },
            scales: {
                xAxes: [{
                    ticks: {
                        fontColor: 'black' // Set x-axis label text color to black
                    }
                }],
                yAxes: [{
                    ticks: {
                        fontColor: 'black' // Set y-axis label text color to black
                    }
                }]
            }
        }
    });
</script>

<%
}
%>

</canvas>
    </div>
<div class="details-frame-container">
<h2> Recommendations</h2>
<% if (val!=0){
	if(val==8){
        out.println("<ul> <li> <p> Stocks </p> </li> </ul>");

        // Adding images with redirection
        out.println("<a href=\"https://www.moneycontrol.com/stocksmarketsindia/\"><img src=\"stock.jpg\" alt=\"Stocks\"></a>");

        out.println("<ul> <li> <p> Mutual Funds </p> </li> </ul>");
        out.println("<a href=\"https://www.bajajfinserv.in/investments/mutual-funds-listing?utm_source=bing&utm_medium=cpc&utm_campaign=Bajaj_MF_Search_Generic_23Nov_M&msclkid=2757ff55e3f51fc394639a3c52d76c44\"><img src=\"Mutual funds.png\" alt=\"Mutual Funds\"></a>");

        out.println("<ul> <li> <p> Acquisition of Property </p> </li> </ul>");
        out.println("<a href=\"https://www.magicbricks.com/\"><img src=\"Property.png\" alt=\"Acquisition of Property\"></a>");

        out.println("<ul> <li> <p> Vacation </p> </li> </ul>");
        out.println("<a href=\"https://services.india.gov.in/service/detail/check-your-nearest-vaccination-center-and-slots-availability-1\"><img src=\"Vacation.jpg\" alt=\"Vacation\"></a>");

        }
	else if(val==7) {
		out.println("<ul> <li> <p> Acquisition of Property </p> </li> </ul>");
        out.println("<a href=\"https://www.magicbricks.com/\"><img src=\"Medium size property.jpg\" alt=\"Acquisition of Property\"></a>");

        out.println("<ul> <li> <p> Fixed Deposit </p> </li> </ul>");
        out.println("<a href=\"https://www.bajajfinserv.in/investments/fixed-deposit-application-form?utm_source=bingsearch_mktg&utm_medium=cpc&utm_campaign=WPB_FD_18072023_Bing_Pan_India_Generic&utm_term=bank%20fixed%20deposit_e_c_&utm_location=149915&utm_content=703457d64ee01174e95632bfff02c9cc&msclkid=703457d64ee01174e95632bfff02c9cc\"><img src=\"Fixed deposit.jpg\" alt=\"Fixed Deposit\"></a>");

        out.println("<ul> <li> <p> Vacation </p> </li> </ul>");
        out.println("<a href=\"https://services.india.gov.in/service/detail/check-your-nearest-vaccination-center-and-slots-availability-1\"><img src=\"Vacation-2.jpg\" alt=\"Vacation\"></a>");
    	
	}
	else if(val==5) {
		 out.println("<ul> <li> <p> Dining </p> </li> </ul>");
	        out.println("<a href=\"https://www.dineout.co.in/fine-dining-restaurants-near-me\"><img src=\"Dining.jpg\" alt=\"Dining\"></a>");
	        out.println("<ul> <li> <p> Recurring Deposit </p> </li> </ul>");
	        out.println("<a href=\"#\"><img src=\"Recurring Deposit.jpg\" alt=\"Recurring Deposit\"></a>");

	}
	else if(val==3) {
		out.println("<ul> <li> <p> Saving Time! </p> </li> </ul>");
        out.println("<a href=\"https://groww.in/recurring-deposit/rd-interest-rates\"><img src=\"Savings.jpg\" alt=\"Saving Money\"></a>");

	}	
} %>
</div>
</div>
</body>
</html>