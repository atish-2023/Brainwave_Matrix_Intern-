<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banking System</title>
</head>
<body>
	<%
	String username = (String) session.getAttribute("session_name");
	if (username == null) {
		response.sendRedirect("userform.jsp");
		return;
	}
	%>

	<h3>
		Welcome:
		<%=username%></h3>

	<form action="depositmn" method="post"
		onsubmit="return getAmount('depositAmount', 'Enter deposit amount:')">
		<input type="hidden" id="depositAmount" name="deposit_amount">
		<input type="submit" value="Deposit Money"> &nbsp; &nbsp;
	</form>
	
	<br/><br/>

	<form action="withdrawmn" method="post"
		onsubmit="return getAmount('withdrawAmount', 'Enter withdrawal amount:')">
		<input type="hidden" id="withdrawAmount" name="withdraw_amount">
		<input type="submit" value="Withdraw Money">
	</form>
	<br/><br/>

	<form action="checkbalancemn" method="post"
		onsubmit="return confirm('Check balance?')">
		<input type="submit" value="Check Balance"> &nbsp; &nbsp;
	</form>
	
	<br/><br/>

	<form action= "exit" method = "post" >
		<input type="submit" value="Exit">
	</form>
	
	<br/><br/>

	<script>
		function getAmount(fieldId, message) {
			let amount = prompt(message);
			if (amount > 0) {
				document.getElementById(fieldId).value = amount;
				return true;
			}
			alert("Invalid amount!");
			return false;
		}
		
		
		
	</script>
</body>
</html>
