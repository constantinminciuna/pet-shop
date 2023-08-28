<%@page import="it.betacom.dao.ClienteShopDao" %>
<jsp:useBean id="c" class="it.betacom.bean.ClienteShop"></jsp:useBean>
<jsp:useBean id="user" class="it.betacom.bean.ClienteShop"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
int i = ClienteShopDao.login(c);
 if(i>0){ 
	
	 user = ClienteShopDao.getRecordByUsername(c.getUsername());
	 
	 session = request.getSession();
	 session.setAttribute("session","TRUE"); 
	 session.setAttribute("user", user);
	 
	 response.sendRedirect("arrivo.jsp");
	 /* request.getRequestDispatcher("arrivo.jsp").forward(request, response); */
 }
else
%><script>alert('Errore.'); history.back();</script><%

%>
