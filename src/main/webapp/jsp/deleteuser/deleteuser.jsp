<%@page import="it.betacom.dao.UserDao" %>
<jsp:useBean id="c" class="it.betacom.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
int i = UserDao.delete(c);
if(i>0) response.sendRedirect("deleteuser-success.jsp");
else response.sendRedirect("deleteuser-error.jsp");
%>