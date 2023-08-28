<%@page import="it.betacom.dao.AnimaleDao" %>
<jsp:useBean id="c" class="it.betacom.bean.Animale"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
int i = AnimaleDao.delete(c);
if(i>0) response.sendRedirect("deleteanimale-success.jsp");
else response.sendRedirect("deleteanimale-error.jsp");
%>