<%@page import="it.betacom.dao.UtenteDao"%>
<jsp:useBean id="u" class="it.betacom.bean.Utente"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UtenteDao.save(u);
if(i>0){
response.sendRedirect("addutenteform.jsp");
} else if (i==-2){
	response.sendRedirect("addutente-exists.jsp");
} else {
response.sendRedirect("addutente-error.jsp");
}
%>