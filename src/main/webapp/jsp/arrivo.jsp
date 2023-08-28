<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="it.betacom.bean.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Petshop Minciuna</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body>
	<%
	if(session.getAttribute("user") == null || session.getAttribute("session") == null || session.getAttribute("session").equals("FALSE")){
		response.sendRedirect("jsp/signuploginform.jsp");
		}else{
			User user = (User) session.getAttribute("user");
	%>
	<div>
		<label>Benvenuto <%out.print(user.getNome());%>!</label>
		<div>
			<jsp:include page="view/viewusers.jsp"></jsp:include>
		</div>
		<div class="bottonisinistra">
			<form action="view/viewclienti.jsp">
				<button style="color: white">Clienti</button>
			</form>
			<form action="view/viewanimali.jsp">
				<button style="color: white">Animali</button>
			</form>
		</div>
		<div class="bottonidestra" style="color: white">
			<form action="logout.jsp">
				<button style="color: white">Logout</button>
			</form>
		</div>
	</div>
	<% } %>
</body>
</html>