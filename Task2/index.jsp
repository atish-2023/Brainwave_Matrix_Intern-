<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hospital Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            background: #f2f2f2;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background: #007bff;
            border-radius: 5px;
        }
        a:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Welcome to Hospital Management System</h1>
        <p>
            Our Hospital Management System provides a seamless way to manage patient records, schedule 
            appointments, and maintain electronic health records. Whether you are a patient looking for 
            medical assistance or an administrator managing hospital operations, our system ensures 
            efficient and hassle-free healthcare services.
        </p>

        <h2>Get Started</h2>
        <a href="login.jsp">Login as Patient</a>
        <a href="admin_login.jsp">Login as Admin</a>

        <h3>Other Services</h3>
        <a href="register.jsp">Register as a New Patient</a>
        
        <a href="ehr.jsp">View Electronic Health Records</a>
    </div>

</body>
</html>
