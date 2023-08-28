<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="it.betacom.dao.UserDao,it.betacom.bean.*"%>
    
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
		String id = request.getParameter("id");
		User c = UserDao.getRecordById(Integer.parseInt(id));
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
				</tr>
			</thead>
			<tbody>
				<form action="edituser.jsp" method="post">
					<input type="hidden" name="id" value="<%=c.getId() %>"/>
					<tr>
						<td><%out.print(c.getId());%></td>
						<td><input type="text" name="username" value="<%= c.getUsername()%>"/></td>
						<td><input type="text" name="nome" value="<%= c.getNome()%>"/></td>
						<td><input type="text" name="cognome" value="<%= c.getCognome()%>"/></td>
						<td><input type="email" name="email" value="<%= c.getEmail()%>"/></td>
						<td><input type="tel" name="cellulare" value="<%= c.getCellulare()%>"/></td>
						<td><input type="date" name="data_di_nascita" value="<%= c.getData_di_nascita()%>"/></td>
						<td><input type="password" name="password" value="<%= c.getPassword()%>"/></td>
						<td>
							<div style="display: flex">
							<!-- <input type="text" name="ruolo" value="<%= c.getRuolo()%>"/>  -->
							G<input class="inputradio" type="radio" name="ruolo" value="G" <% if (c.getRuolo().equals("G")) out.print("checked"); %> />
	                		M<input class="inputradio" type="radio" name="ruolo" value="M" <% if (c.getRuolo().equals("M")) out.print("checked"); %> />
							</div>
						</td>
						<td>
							<div style="display: flex">
							<!-- <input type="text" name="stato" value="<%= c.getStato()%>"/> -->
							A<input class="inputradio" type="radio" name="stato" value="A" <% if (c.getStato().equals("A")) out.print("checked"); %> />
	                		D<input class="inputradio" type="radio" name="stato" value="D" <% if (c.getStato().equals("D")) out.print("checked"); %> />
							</div>
						</td>
						<div style="display: flex">
							<button style="margin: 10px; color: white" type="submit">Modifica</button>
							<button style="margin: 10px; color: white" formaction="../arrivo.jsp">Annulla</button>
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