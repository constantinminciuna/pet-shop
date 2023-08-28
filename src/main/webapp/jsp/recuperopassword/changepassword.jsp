<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cambio password</title>
	<link rel="stylesheet" type="text/css" href="../../css/forgotpwd.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="mainchangepwd">
		<form action="changepassword-success.jsp" method="post">
			<label for="chk" aria-hidden="true">Cambio password</label>
			<input type="text" name="username" placeholder="Username" required="">
			<input type="password" name="password" placeholder="Nuova password" required="">
			<button>Conferma</button>
		</form>
	</div>
</body>
</html>