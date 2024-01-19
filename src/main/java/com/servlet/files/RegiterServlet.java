package com.servlet.files;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegiterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegiterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Fullname = request.getParameter("fullname");
        String Password = request.getParameter("password");
        int Age = Integer.parseInt(request.getParameter("age"));
        int Salary = Integer.parseInt(request.getParameter("salary"));
        String Email = request.getParameter("email");
        String Occupation = request.getParameter("occupation");
        String username = request.getParameter("username");
        int userID = generateUniqueUserID();

        if (insertUserToDatabase(userID, Fullname, Password, Age, Salary, Email, Occupation, username)) {
            response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
        }
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
            String query = "SELECT userid FROM users WHERE userid = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userid);
            ResultSet rs = stmt.executeQuery();

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean insertUserToDatabase(int userID, String fullname, String password, int age, int salary,
            String email, String occupation, String username) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense", "root","Sneha@.03");

            String query = "INSERT INTO users (userid, Fullname, Password, Age, Salary, Email, Occupation, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userID);
            stmt.setString(2, fullname);
            stmt.setString(3, password);
            stmt.setInt(4, age);
            stmt.setInt(5, salary);
            stmt.setString(6, email);
            stmt.setString(7, occupation);
            stmt.setString(8, username);

            int rowsInserted = stmt.executeUpdate();

            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
