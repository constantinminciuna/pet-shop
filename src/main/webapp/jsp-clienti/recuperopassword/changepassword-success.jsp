<%@page import="it.betacom.dao.UserDao"%>
<jsp:useBean id="username" class="java.lang.String"></jsp:useBean>
<jsp:useBean id="password" class="java.lang.String"></jsp:useBean>

<%
int i = UserDao.changePassword(username,password);
 if(i>0) response.sendRedirect("loginform-success.jsp");
else
%><script>alert('Errore.'); history.back();</script><%

%>