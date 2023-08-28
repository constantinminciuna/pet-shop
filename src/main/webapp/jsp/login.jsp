<%@page import="it.betacom.dao.UserDao" %>
<jsp:useBean id="c" class="it.betacom.bean.User"></jsp:useBean>
<jsp:useBean id="user" class="it.betacom.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
int i = UserDao.login(c);
 if(i>0){ 
	
	 user = UserDao.getRecordByUsername(c.getUsername());
	 
	 session = request.getSession();
	 session.setAttribute("session","TRUE"); 
	 session.setAttribute("user", user);
	 
	 response.sendRedirect("arrivo.jsp");
	 /* request.getRequestDispatcher("arrivo.jsp").forward(request, response); */
 }
else
%><script>alert('Errore.'); history.back();</script><%

%>
