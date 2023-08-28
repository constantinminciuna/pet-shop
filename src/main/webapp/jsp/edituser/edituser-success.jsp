<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Petshop Minciuna</title>
</head>
<body>
	<%
	if(session.getAttribute("session") == null || session.getAttribute("session").equals("FALSE")){
			response.sendRedirect("signuploginform.jsp");
	}else{
	%>
	<script>alert("Utente modificato con successo!")</script>
	<jsp:include page="../arrivo.jsp"></jsp:include>
	<% } %>
</body>
</html>