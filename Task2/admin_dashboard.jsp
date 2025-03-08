<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("adminName") == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
    String adminName = (String) session1.getAttribute("adminName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin: 50px; }
        .container { padding: 20px; background: #f2f2f2; border-radius: 10px; display: inline-block; box-shadow: 0px 0px 10px gray; }
        a { display: block; margin: 10px; padding: 10px; background: #007bff; color: white; text-decoration: none; border-radius: 5px; }
        a:hover { background: #0056b3; }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome, <%= adminName %>!</h2>
        <a href="view_patient.jsp">View All Patients</a>
        <a href="view_ehr.jsp">View Health Records</a>
        <a href="manage_doctors.jsp">Manage Doctors</a>
        <a href="appointment.jsp">View Appointments</a>
        <a href="index.jsp">Logout</a>
    </div>

</body>
</html>
