package com.servlet.files;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ExpenseGraphServlet")
public class ExpenseGraphServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");

        // Establish database connection and retrieve expense dates
        List<String> expenseDates = getExpenseDates(username);

        // Forward the data to home.jsp
        request.setAttribute("expenseDates", expenseDates);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    private List<String> getExpenseDates(String username) {
        List<String> expenseDates = new ArrayList<>();
        String JDBC_URL = "jdbc:mysql://localhost:3306/expense";
        String DB_USER = "root";
        String DB_PASSWORD = "Sneha@.03";

        // SQL query to retrieve expense dates
        String SELECT_DATES_SQL = "SELECT DISTINCT expense_date FROM expenses WHERE username = ?";

        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DATES_SQL)) {

            preparedStatement.setString(1, username);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String date = resultSet.getString("expense_date");
                    expenseDates.add(date);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return expenseDates;
    }
}
