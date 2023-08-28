<%@page import="it.betacom.dao.UserDao" %>
<jsp:useBean id="c" class="it.betacom.bean.User"></jsp:useBean>
<jsp:useBean id="cliente" class="it.betacom.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
	 session.invalidate();
	 response.sendRedirect("signuploginform.jsp");
%>
