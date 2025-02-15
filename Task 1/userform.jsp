<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ATM Login</title>
<style>
body {
	background: blue;
	color: white;
	text-align: center;
	font-family: Arial, sans-serif;
}

.atm {
	margin-top: 150px;
	background-color: violet;
}

input {
	padding: 5px;
	margin: 8px;
	width: 180px;
}

input[type="text"], input[type="password"] {
	background: white;
	color: black;
}

input[type="submit"] {
	background: green;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="atm">
		<h2>ATM Login</h2>
		<form action="atmvalidation" method="post">
			<input type="text" name="accno1" placeholder="Enter Account No"
				required><br> <input type="password" name="pin1"
				placeholder="Enter PIN" required><br> <input
				type="submit" value="Submit">
		</form>
	</div>

</body>
</html>
