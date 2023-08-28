<%@page import="it.betacom.dao.AnimaleDao" %>
<jsp:useBean id="a" class="it.betacom.bean.Animale"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>
<!DOCTYPE html>
<%
int i = AnimaleDao.update(a);
if(i>0) response.sendRedirect("editanimale-success.jsp");
else response.sendRedirect("editanimale-error.jsp");
%>