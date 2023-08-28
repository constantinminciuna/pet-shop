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
		String id_cliente = request.getParameter("id_cliente");
		ClienteShop c = ClienteShopDao.getRecordById(Integer.parseInt(id_cliente));
	%>
	
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
				</tr>
			</thead>
			<tbody>
				<form action="editcliente.jsp" method="post">
					<input type="hidden" name="id_cliente" value="<%=c.getIdCliente() %>"/>
					<tr>
						<td><%out.print(c.getIdCliente());%></td>
						<td><input type="text" name="nome" value="<%= c.getNome()%>"/></td>
						<td><input type="text" name="cognome" value="<%= c.getCognome()%>"/></td>
						<td><input type="text" name="citta" value="<%= c.getCitta()%>"/></td>
						<td><input type="tel" name="telefono" value="<%= c.getTelefono()%>"/></td>
						<td><input type="text" name="indirizzo" value="<%= c.getIndirizzo()%>"/></td>
						<div style="display: flex">
							<button style="margin: 10px; color: white" type="submit">Modifica</button>
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