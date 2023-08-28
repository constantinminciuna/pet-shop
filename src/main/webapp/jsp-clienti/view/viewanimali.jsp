<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="it.betacom.dao.AnimaleDao, it.betacom.bean.*, java.util.*"%>
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
		List<Animale> list = AnimaleDao.getBuyableRecords();
		request.setAttribute("list", list);
		
		session = request.getSession();
		String sessionActive = (String) session.getAttribute("session");
		if (sessionActive.equals("TRUE")) {
			ClienteShop user = (ClienteShop) session.getAttribute("user");
	%>
	
	<label>Tabella degli animali</label>
	
	<div class="container">
		<table border="1" width="90%">
			<thead>
				<tr>
					<th>Matricola</th>
					<th>Tipo</th>
					<th>Nome</th>
					<th>Prezzo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getMatricola()}</td>
						<td>${u.getTipoAnimale()}</td>
						<td>${u.getNomeAnimale()}</td>
						<td>${u.getPrezzo()}</td>
						<td><a href="../acquistaanimale.jsp?matricola=${u.getMatricola()}">Acquista</a></td>
					</tr>
				</c:forEach>
				<div style="display: flex;flex-direction: row;justify-content: center;align-items: center;"">
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