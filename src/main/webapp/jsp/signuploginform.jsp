<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Petshop Minciuna</title>
	<link rel="stylesheet" type="text/css" href="../css/signuplogin.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="titolo">Petshop Minciuna</div>
	
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form action="signup.jsp" method="post">
					<label for="chk" aria-hidden="true">Registrazione</label>
					<input type="text" name="nome" placeholder="Nome" required="">
					<input type="text" name="cognome" placeholder="Cognome" required="">
					<input type="date" name="data_di_nascita" placeholder="Data di nascita" required="">
					<input type="tel" name="cellulare" placeholder="Cellulare" required="">
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="password" placeholder="Password" required="">
					<button>Registrati</button>
				</form>
			</div>

			<div class="login">
				<form action="login.jsp" method="post">
					<label for="chk" aria-hidden="true">Accesso</label>
					<input type="text" name="username" placeholder="Username" required="">
					<input type="password" name="password" placeholder="Password" required="">
					<button>Accedi</button>
				</form>
				<div class="forgotpwd"><a href="recuperopassword/forgotpwdform.jsp" position=>Password dimenticata?</a></div>
			</div>
	</div>
</body>
</html>