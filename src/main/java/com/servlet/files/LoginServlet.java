package com.servlet.files;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    	System.out.println("-1");
    	
        try {
        	
	            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense", "root", "Sneha@.03");
            if (connection != null) {
                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
               ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                	String fullname = resultSet.getString("fullname");
                    String email = resultSet.getString("email");
                    int age = resultSet.getInt("age");
                    int salary = resultSet.getInt("salary");

                    // You can set user information in the session and redirect to the dashboard
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("fullname", fullname);
                    session.setAttribute("email", email);
                    session.setAttribute("age", age);
                    session.setAttribute("salary", salary);
                    
                    response.sendRedirect("home.jsp");

                } else if ("username".equals(username) && "password".equals(password)) {
            	    response.sendRedirect("adminpage.jsp");
            	} else {
                    // If no rows are returned, it's an invalid login
                    response.sendRedirect("login.jsp?error=db");
                }
            }
           
            else {
                // Handle a failed database connection here
                response.sendRedirect("login.jsp?error=db");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions here
            response.sendRedirect("login.jsp?error=db");
        } 
            
    }
}
