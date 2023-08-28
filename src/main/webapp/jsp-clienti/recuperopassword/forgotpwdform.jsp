<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Recupero password</title>
	<link rel="stylesheet" type="text/css" href="../../css/forgotpwd.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="main">
		<form action="forgotpwd.jsp" method="post">
				<label aria-hidden="true">Recupero password</label>
				<input type="email" name="email" placeholder="Email" required="">
				<button>Conferma</button>
		</form>
	</div>
	
	
</body>
</html>