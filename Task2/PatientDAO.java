package com.hospital.dao;
import com.hospital.dao.Patient;
import java.sql.*;

public class PatientDAO {
    public static boolean registerPatient(Patient patient) {
        try {
            Connection conn = DBConnection.getConnection();
            String query = "INSERT INTO patients (name, age, gender, contact, address, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, patient.getName());
            ps.setInt(2, patient.getAge());
            ps.setString(3, patient.getGender());
            ps.setString(4, patient.getContact());
            ps.setString(5, patient.getAddress());
            ps.setString(6, patient.getEmail());
            ps.setString(7, patient.getPassword());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
