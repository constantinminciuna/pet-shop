<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="it.betacom.dao.ClienteShopDao, it.betacom.bean.*, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Petshop Minciuna</title>
	<link rel="stylesheet" type="text/css" href="../../css/viewca.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	
	<%
		List<ClienteShop> list = ClienteShopDao.getAllRecords();
		request.setAttribute("list", list);
		
		session = request.getSession();
		String sessionActive = (String) session.getAttribute("session");
		if (sessionActive.equals("TRUE")) {
			User user = (User) session.getAttribute("user");
	%>
	
	<label>Tabella dei clienti</label>
	
	<div class="container">
		<table border="1" width="90%">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Cognome</th>
					<th>Citta'</th>
					<th>Telefono</th>
					<th>Indirizzo</th>
					<th>Visualizza acquisti</th>
					<% 
						if(user.getRuolo().equals("M")){ 
					%>
						<th>Modifica</th>
						<th>Elimina</th>
					<%}%>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getIdCliente()}</td>
						<td>${u.getNome()}</td>
						<td>${u.getCognome()}</td>
						<td>${u.getCitta()}</td>
						<td>${u.getTelefono()}</td>
						<td>${u.getIndirizzo()}</td>
						<td><a href="viewacquisti.jsp?id_cliente=${u.getIdCliente()}">Visualizza acquisti</a></td>
						<% 
							if(user.getRuolo().equals("M")){ 
						%>
							<td><a href="../editcliente/editclienteform.jsp?id_cliente=${u.getIdCliente()}">Modifica</a></td>
							<td><a href="../deletecliente/deletecliente.jsp?id_cliente=${u.getIdCliente()}">Elimina</a></td>
						<% } %>
					</tr>
				</c:forEach>
				<div style="display: flex;flex-direction: row;justify-content: center;align-items: center;"">
					<a href="../aggiungicliente/aggiungiclienteform.jsp" style="text-decoration: none"><button style="color: white">Aggiungi</button></a>
					<a href="../arrivo.jsp" style="text-decoration: none"><button style="color: white">Indietro</button></a>
				</div>
			</tbody>
		</table>
		<br/>
	</div>
	
	<%}else{
		out.print("Bisogna accedere!");
	}%>
	
</body>
</html>