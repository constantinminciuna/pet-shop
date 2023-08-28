<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.ClienteShopDao,it.betacom.bean.*"%>
    
<!DOCTYPE html>
<html>
<head>
	<title>Petshop Minciuna</title>
	<link rel="stylesheet" type="text/css" href="../../css/edit.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<%
	String sessionActive = (String) session.getAttribute("session");
			if(sessionActive.equals("TRUE")){
	%>
	
	<div class="container">
		<table border="1" width="90%">
			<thead>
				<tr>
					<th>Nome</th>
					<th>Cognome</th>
					<th>Citta'</th>
					<th>Telefono</th>
					<th>Indirizzo</th>
				</tr>
			</thead>
			<tbody>
				<form action="aggiungicliente.jsp" method="post">
					<tr>
						<td><input type="text" name="nome"/></td>
						<td><input type="text" name="cognome"/></td>
						<td><input type="text" name="citta"/></td>
						<td><input type="tel" name="telefono"/></td>
						<td><input type="text" name="indirizzo"/></td>
						<div style="display: flex">
							<button style="margin: 10px; color: white" type="submit">Aggiungi</button>
							<button style="margin: 10px; color: white" formaction="../view/viewclienti.jsp">Annulla</button>
						</div>
					</tr>
				</form>
			</tbody>
		</table>
		<br/>
	</div>
	<%}else{
		out.print("Bisogna accedere!");
	}%>
</body>
</html>