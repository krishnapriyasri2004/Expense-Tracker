<!DOCTYPE html>
<html>
<head>
    <title>Expense Submission Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lavender;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: lavender;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-top: 0;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .success-message {
            text-align: center;
            font-size: 18px;
            color: #333;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            backdrop-filter: blur(5px);
        }

        .success-message a {
            text-decoration: none;
            background-color: lavender;
            color: #333;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .success-message a:hover {
            background-color: lavender;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Expense Submission Successful</h1>
    <p>Your expense has been successfully submitted.</p>
    <div class="success-message">
        <a href="home.jsp">BACK</a>
    </div>
</div>
</body>
</html>