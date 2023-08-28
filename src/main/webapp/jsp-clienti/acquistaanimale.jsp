<%@page import="it.betacom.dao.AnimaleDao" %>

<%
int i = AnimaleDao.acquista(Integer.parseInt(request.getParameter("matricola")),Integer.parseInt(request.getParameter("id_cliente")));
 if(i>0){ 	
	 %><script>alert('Animale acquistato con successo.')</script><%
	 response.sendRedirect("view/viewanimali.jsp");
 }
else
%><script>alert('Errore.'); history.back();</script><%

%>


${u.getMatricola()} ${user.getIdCliente}