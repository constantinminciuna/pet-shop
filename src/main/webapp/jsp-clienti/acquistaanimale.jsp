<%@page import="it.betacom.dao.AnimaleDao, it.betacom.bean.*" %>

<%
ClienteShop user = (ClienteShop) session.getAttribute("user");

int i = AnimaleDao.acquista(Integer.parseInt(request.getParameter("matricola")),user.getIdCliente());
 if(i>0){ 	
	 %><script>alert('Animale acquistato con successo.')</script><%
	 response.sendRedirect("view/viewanimali.jsp");
 }
else
%><script>alert('Errore.'); history.back();</script><%

%>