<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
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
            text-align: left;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        h2 {
            text-align: center;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
        p {
            font-weight: bold;
            text-align: center;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-link a {
            color: #00c3ff;
            text-decoration: none;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Register New Patient</h2>
        <form action="registerPatient" method="post">
            Name: <br> <input type="text" name="name" required><br>
            Age: <br> <input type="number" name="age" required><br>
            Gender: <br> 
            <select name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select><br>
            Contact: <br> <input type="tel" name="contact" required><br>
            Address: <br> <input type="text" name="address" required><br>
            <input type="submit" value="Register">
        </form>

        <% if (request.getParameter("msg") != null) { %>
            <p>
                <%= request.getParameter("msg").equals("success") ? "Patient registered successfully!" : "Registration failed!" %>
            </p>
        <% } %>

        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

</body>
</html>
