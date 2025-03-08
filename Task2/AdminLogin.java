package com.hospital.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection variables
        String dbURL = "jdbc:mysql://localhost:3306/hospital";
        String dbUser = "root";
        String dbPass = "Atish@1193";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ✅ Try-with-resources (Auto-close connection)
            try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                 PreparedStatement stmt = conn.prepareStatement("SELECT password FROM admin WHERE username = ?")) {

                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("adminName", username);
                    response.sendRedirect("admin_dashboard.jsp"); // ✅ Redirects to Dashboard
                } else {
                    response.sendRedirect("admin_login.jsp?error=1"); // ❌ Redirects back to login on failure
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_login.jsp?error=1");
        }
    }
}
