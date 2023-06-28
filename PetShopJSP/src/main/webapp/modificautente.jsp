<%@page import="it.betacom.dao.UtenteDao"%>
<jsp:useBean id="u" class="it.betacom.bean.Utente"></jsp:useBean>
<jsp:setProperty name="u" property="*"/>

<%
int i=UtenteDao.update(u);
if(i>0){
response.sendRedirect("pslistautenti.jsp");
}else{
	out.print(u);
}
%>