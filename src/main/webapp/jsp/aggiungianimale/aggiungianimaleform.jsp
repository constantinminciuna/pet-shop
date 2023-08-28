<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.AnimaleDao,it.betacom.bean.*"%>
    
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
					<th>Matricola</th>
					<th>Tipo</th>
					<th>Nome</th>
					<th>Data di acquisto</th>
					<th>Prezzo</th>
					<th>Id Cliente</th>
				</tr>
			</thead>
			<tbody>
				<form action="aggiungianimale.jsp" method="post">
					<tr>
						<td><input type="text" name="matricola"/></td>
						<td><input type="text" name="tipo_animale"/></td>
						<td><input type="text" name="nome_animale"/></td>
						<td><input type="text" name="data_acquisto"/></td>
						<td><input type="number" name="prezzo"/></td>
						<td><input type="number" name="id_cliente"/></td>
						<div style="display: flex">
							<button style="margin: 10px; color: white" type="submit">Modifica</button>
							<button style="margin: 10px; color: white" formaction="../view/viewanimali.jsp">Annulla</button>
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