<%@page import="it.betacom.dao.UtenteDao, it.betacom.bean.Utente"%>

<%
String id=request.getParameter("id");
Utente u=UtenteDao.getRecordById(Integer.parseInt(id));

int i=UtenteDao.delete(u);
if(i>0){
response.sendRedirect("pslistautenti.jsp");
}else{
	out.print(u);
}
%>