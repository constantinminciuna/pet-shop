<%@page import="it.betacom.dao.UserDao"%>
<jsp:useBean id="c" class="it.betacom.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
int i = UserDao.save(c);
 if(i>0) response.sendRedirect("signupform-success.jsp");
else
%><script>alert('Errore nella registrazione.'); history.back();</script><%

%>