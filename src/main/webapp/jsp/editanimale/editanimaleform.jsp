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
		String matricola = request.getParameter("matricola");
		Animale a = AnimaleDao.getRecordByMatricola(Integer.parseInt(matricola));
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
				<form action="editanimale.jsp" method="post">
					<input type="hidden" name="matricola" value="<%=a.getMatricola() %>"/>
					<tr>
						<td><%out.print(a.getMatricola());%></td>
						<td><input type="text" name="tipo_animale" value="<%= a.getTipoAnimale()%>"/></td>
						<td><input type="text" name="nome_animale" value="<%= a.getNomeAnimale()%>"/></td>
						<td><input type="text" name="data_acquisto" value="<%= a.getDataAcquisto()%>"/></td>
						<td><input type="number" name="prezzo" value="<%= a.getPrezzo()%>"/></td>
						<td><input type="number" name="id_cliente" value="<%= a.getClienteShop()%>"/></td>
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