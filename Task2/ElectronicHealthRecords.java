package com.hospital.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateEHR")
public class ElectronicHealthRecords extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");
        String diagnosis = request.getParameter("diagnosis");
        String prescription = request.getParameter("prescription");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO ehr(patient_id, diagnosis, prescription) VALUES (?, ?, ?)");
            ps.setString(1, patientId);
            ps.setString(2, diagnosis);
            ps.setString(3, prescription);
            ps.executeUpdate();
            response.sendRedirect("ehr.jsp?msg=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ehr.jsp?msg=error");
        }
    }
}
