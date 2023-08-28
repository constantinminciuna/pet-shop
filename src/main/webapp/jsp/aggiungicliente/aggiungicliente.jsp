<%@page import="it.betacom.dao.ClienteShopDao" %>
<jsp:useBean id="c" class="it.betacom.bean.ClienteShop"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<!DOCTYPE html>
<%
int i = ClienteShopDao.save(c);
if(i>0) response.sendRedirect("aggiungicliente-success.jsp");
else response.sendRedirect("aggiungicliente-error.jsp");
%>