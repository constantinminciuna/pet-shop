<%@page import="it.betacom.dao.UserDao" %>
<jsp:useBean id="c" class="it.betacom.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<!DOCTYPE html>
<%
int i = UserDao.update(c);
if(i>0) response.sendRedirect("edituser-success.jsp");
else response.sendRedirect("edituser-error.jsp");
%>