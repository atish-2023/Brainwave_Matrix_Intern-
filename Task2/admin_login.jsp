<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 50px; }
        .form-container { background: white; padding: 20px; width: 300px; margin: auto; border-radius: 5px; box-shadow: 0px 0px 10px gray; }
        input { width: 100%; padding: 8px; margin: 10px 0; }
        input[type="submit"] { background: green; color: white; border: none; cursor: pointer; }
        input[type="submit"]:hover { background: darkgreen; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Admin Login</h2>
        <form action="AdminLogin" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid Username or Password!</p>
        <% } %>
    </div>
</body>
</html>
