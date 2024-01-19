package com.servlet.files;

import javax.servlet.ServletException;
import java.sql.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.UUID;

@WebServlet("/ProcessExpensesServlet")
public class ProcessExpensesServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form inputs
        String purpose = request.getParameter("purpose");
        BigDecimal amount = new BigDecimal(request.getParameter("amount"));
        String durationType = request.getParameter("durationType");
        String durationInput = request.getParameter("durationInput");

        int convertedDuration = 0;

        // Perform conversion based on the selected duration type
        if (durationType != null && durationInput != null && !durationInput.isEmpty()) {
            int input = Integer.parseInt(durationInput);
            switch (durationType) {
                case "months":
                    convertedDuration =12/input; // Assuming an average month has 30 days
                    System.out.println(input+","+ convertedDuration);
                    break;
                case "years":
                    convertedDuration = input; // Assuming an average year has 365 days
                    break;
                default:
                    convertedDuration = 365/input;
                    break;
            }
        }
        String expenseDateParam = request.getParameter("expense-date");


        // Get the logged-in username from the session
        String username = (String) request.getSession().getAttribute("username");
        Date expenseDate = Date.valueOf(expenseDateParam);

        if (username == null || username.isEmpty()) {
            // Handle the case where the user is not logged in
            response.sendRedirect("login.jsp"); // Redirect to the login page
            return;
        }

     // Insert data into the database
        int intValue = generateUniqueUserID();
        
        System.out.println(intValue);
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense", "root", "Sneha@.03");

            String sql = "INSERT INTO addexpenses(username,expense_id, purpose, amount, duration, expense_date) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
                preparedStatement.setString(1, username);
                preparedStatement.setInt(2, intValue); // Generate a unique expense_id
                preparedStatement.setString(3, purpose);
                preparedStatement.setBigDecimal(4, amount);
                preparedStatement.setInt(5, convertedDuration);
                preparedStatement.setDate(6, expenseDate);

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or SQL errors
            response.sendRedirect("error.jsp"); // Redirect to an error page
            return;
        }

        // Redirect to a success page or handle the response accordingly
        response.sendRedirect("success.jsp");
    }
    private int generateUniqueUserID() {
        Random rand = new Random();
        int userID;
        do {
            userID = rand.nextInt(1000000); 
        } while (isUserIDExistsInDatabase(userID));

        return userID;
    }

    private boolean isUserIDExistsInDatabase(int userid) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense", "root", "Sneha@.03");
            String query = "SELECT expid FROM addexpenses WHERE expense_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userid);
            ResultSet rs = stmt.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
