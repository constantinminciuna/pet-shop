<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="it.betacom.dao.UserDao,it.betacom.bean.*,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Petshop Minciuna</title>
	<link rel="stylesheet" type="text/css" href="../css/table.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>

	<%
	List<User> list = UserDao.getAllRecords();
	request.setAttribute("list", list);

	session = request.getSession();
	String sessionActive = (String) session.getAttribute("session");
	if (sessionActive.equals("TRUE")) {
		User user = (User) session.getAttribute("user");
	%>

	<div class="container">
		<table border="1" width="90%">
			<thead>
				<tr>
					<th>Id</th>
					<th>Username</th>
					<th>Nome</th>
					<th>Cognome</th>
					<th>Email</th>
					<th>Cellulare</th>
					<th>Data di nascita</th>
					<th>Password</th>
					<th>Ruolo</th>
					<th>Stato</th>
					<% 
						if(user.getRuolo().equals("M")){ 
					%>
						<th>Modifica</th>
						<th>Elimina</th>
					<% } %>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getId()}</td>
						<td>${u.getUsername()}</td>
						<td>${u.getNome()}</td>
						<td>${u.getCognome()}</td>
						<td>${u.getEmail()}</td>
						<td>${u.getCellulare()}</td>
						<td>${u.getData_di_nascita()}</td>
						<td>${u.getPassword()}</td>
						<td>${u.getRuolo()}</td>
						<td>${u.getStato()}</td>
						<% 
							if(user.getRuolo().equals("M")){ 
						%>
							<td><a href="edituser/edituserform.jsp?id=${u.getId()}">Modifica</a></td>
							<td><a href="deleteuser/deleteuser.jsp?id=${u.getId()}">Elimina</a></td>
						<% } %>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br/>
	</div>
	
	<%}else{
		out.print("Bisogna accedere!");
	}%>
	
</body>
</html>