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
    private static final String DB_PASSWORD = "Sneha@.03";

    // Constants for SQL queries
    private static final String SELECT_EXPENSES_SQL = "SELECT calc FROM addexpenses WHERE username = ?";
    
    public static double calculateTotalSpending(String username) {
        BigDecimal totalSpending = BigDecimal.ZERO;
        double floatValue=0.0;
        
        try {
            
            // Establish a database connection889999
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Create a prepared statement for the SELECT query
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSES_SQL);
            preparedStatement.setString(1, username);

            System.out.print(username);
            
            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Calculate the total spending
            floatValue=0.0;
            while (resultSet.next()) {
            	
            	BigDecimal amount = resultSet.getBigDecimal("calc");
            	totalSpending = totalSpending.add(amount);
                floatValue = totalSpending.doubleValue();
                System.out.print(floatValue);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return floatValue;
    }

}
