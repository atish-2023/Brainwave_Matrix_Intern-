<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("patientName") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String patientName = (String) session1.getAttribute("patientName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            background: white;
            width: 50%;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .logout {
            background-color: #dc3545;
        }
        .logout:hover {
            background-color: #b02a37;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, <%= patientName %>!</h2>
        <a href="appointment.jsp" class="btn">Schedule an Appointment</a>
        <a href="index.jsp" class="btn logout">Logout</a>
    </div>
</body>
</html>
