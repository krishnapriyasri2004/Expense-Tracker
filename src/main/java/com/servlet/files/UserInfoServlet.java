package com.servlet.files;
import java.io.IOException;
import java.sql.Connection;
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

@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Initialize a list to store user information
        List<UserInfo> userInfoList = new ArrayList<>();

        // Establish a database connection using your DatabaseConnection class
        Connection connection = DatabaseConnection.getConnection();

        if (connection != null) {
            String sql = "SELECT * FROM users";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                 ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    // Retrieve user information from the result set
                    String fullname = resultSet.getString("Fullname");
                    String email = resultSet.getString("Email");
                    int age = resultSet.getInt("Age");
                    double salary = resultSet.getDouble("Salary");

                    // Create a UserInfo object and add it to the list
                    UserInfo userInfo = new UserInfo(fullname, email, age, salary);
                    userInfoList.add(userInfo);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Close the database connection
                DatabaseConnection.closeConnection(connection);
            }
        }

        // Set the user information list as an attribute to use in JSP
        request.setAttribute("userInfoList", userInfoList);

        // Forward the request to a JSP page for rendering
        request.getRequestDispatcher("UserInfo.jsp").forward(request, response);
    }
}
