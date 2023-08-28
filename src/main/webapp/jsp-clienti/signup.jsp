<%@page import="it.betacom.dao.ClienteShopDao"%>
<jsp:useBean id="c" class="it.betacom.bean.ClienteShop"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>

<%
int i = ClienteShopDao.signup(c);
 if(i>0) response.sendRedirect("signupform-success.jsp");
else
%><script>alert('Errore nella registrazione.'); history.back();</script><%

%>