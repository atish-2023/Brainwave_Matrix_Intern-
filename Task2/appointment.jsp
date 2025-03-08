<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Schedule Appointment</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        input, select, button { padding: 8px; margin: 5px; }
    </style>
</head>
<body>

<h2>Schedule Appointment</h2>

<form action="scheduleAppointment" method="post">
    Patient ID: <input type="number" name="patient_id" required>
    Doctor: <input type="text" name="doctor" required>
    Date: <input type="date" name="date" required>
    <button type="submit">Schedule</button>
</form>

<%
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) {
        out.println("<p style='color:green;'>Appointment Scheduled Successfully!</p>");
    } else if ("error".equals(msg)) {
        out.println("<p style='color:red;'>Error Scheduling Appointment!</p>");
    }
%>

<h2>Appointment List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Patient ID</th>
        <th>Doctor</th>
        <th>Date</th>
    </tr>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Atish@1193");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointments");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("patient_id") %></td>
        <td><%= rs.getString("doctor") %></td>
        <td><%= rs.getString("date") %></td>
    </tr>
    <%
            }
            conn.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
        }
    %>

</table>

</body>
</html>
