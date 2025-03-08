<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('../img/hospi.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
        }
        .form-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            width: 350px;
            text-align: center;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background: #0056b3;
        }
        p {
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Patient Login</h2>
        <form action="PatientLogin" method="post">
            Contact: <br> <input type="tel" name="contact" required><br>
            <input type="submit" value="Login">
        </form>

        <% if (request.getParameter("msg") != null) { %>
            <p>
                <%= request.getParameter("msg").equals("error") ? "Invalid contact number!" : "" %>
            </p>
        <% } %>
    </div>
</body>
</html>
