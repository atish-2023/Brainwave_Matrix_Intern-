<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Electronic Health Records</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>

<h2>Electronic Health Records</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Diagnosis</th>
        <th>Prescription</th>
        <th>Contact No</th>
    </tr>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Atish@1193");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ehr.id, ehr.patient_id, patients.name, ehr.diagnosis, ehr.prescription, patients.contact FROM ehr INNER JOIN patients ON ehr.patient_id = patients.id");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("patient_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("diagnosis") %></td>
        <td><%= rs.getString("prescription") %></td>
        <td><%= rs.getString("contact") %></td>
    </tr>
    <%
            }
            conn.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>

</table>

</body>
</html>
