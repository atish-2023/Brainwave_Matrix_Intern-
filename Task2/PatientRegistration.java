package com.hospital.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerPatient")
public class PatientRegistration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO patients(name, age, gender, contact, address) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, age);
            ps.setString(3, gender);
            ps.setString(4, contact);
            ps.setString(5, address);
            ps.executeUpdate();
            response.sendRedirect("index.jsp?msg=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=error");
        }
    }
}
