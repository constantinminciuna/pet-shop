<%@page import="it.betacom.dao.ClienteShopDao" %>
<jsp:useBean id="c" class="it.betacom.bean.ClienteShop"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%
int i = ClienteShopDao.delete(c);
if(i>0) response.sendRedirect("deletecliente-success.jsp");
else response.sendRedirect("deletecliente-error.jsp");
%>