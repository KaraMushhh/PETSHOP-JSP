<%@page import="it.betacom.dao.ClienteDao, it.betacom.bean.Cliente"%>

<%
String id=request.getParameter("id");
Cliente c=ClienteDao.getRecordById(Integer.parseInt(id));

int i=ClienteDao.delete(c);
if(i>0){
response.sendRedirect("viewclienti.jsp");
}else{
	out.print(c);
}
%>