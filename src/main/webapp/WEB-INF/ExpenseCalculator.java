package com.servlet.files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;

public class ExpenseCalculator {

    // JDBC URL, username, and password of your MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/expense";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Sneha";

    // Constants for SQL queries
    private static final String SELECT_EXPENSES_SQL = "SELECT amount, duration_in_months FROM addexpenses WHERE username = ?";
    
    public static double calculateTotalSpending(String username) {
        BigDecimal totalSpending = BigDecimal.ZERO;
        double floatValue = 0.0;
        
        try {
            // Establish a database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Create a prepared statement for the SELECT query
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSES_SQL);
            preparedStatement.setString(1, username);

            System.out.print(username);
            
            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Calculate the total spending
            while (resultSet.next()) {
                
                BigDecimal amount = resultSet.getBigDecimal("amount");
                int durationInMonths = resultSet.getInt("duration_in_months");
                BigDecimal expense = amount.multiply(BigDecimal.valueOf(durationInMonths));
                totalSpending = totalSpending.add(expense);
                floatValue = totalSpending.doubleValue();
                System.out.print(floatValue);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return floatValue;
    }
}
