<%@page import="it.betacom.dao.UtenteDao, it.betacom.bean.Utente"%>

<%
String id=request.getParameter("id");
Utente u=UtenteDao.getRecordById(Integer.parseInt(id));
UtenteDao.changeStatus(u);

response.sendRedirect("pslistautenti.jsp");

%>