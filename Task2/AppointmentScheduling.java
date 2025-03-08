package com.hospital.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scheduleAppointment")
public class AppointmentScheduling extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");
        String doctor = request.getParameter("doctor");
        String date = request.getParameter("date");

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO appointments (patient_id, doctor, date) VALUES (?, ?, ?)");
            ps.setInt(1, Integer.parseInt(patientId));
            ps.setString(2, doctor);
            ps.setString(3, date);
            ps.executeUpdate();
            response.sendRedirect("appointment.jsp?msg=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("appointment.jsp?msg=error");
        }
    }
}
