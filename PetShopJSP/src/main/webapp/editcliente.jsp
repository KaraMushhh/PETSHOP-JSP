<%@page import="it.betacom.dao.ClienteDao"%>
<jsp:useBean id="cl" class="it.betacom.bean.Cliente"></jsp:useBean>
<jsp:setProperty name="cl" property="*"/>

<%
int i=ClienteDao.update(cl);
if(i>0){
response.sendRedirect("viewclienti.jsp");
}else{
	out.print(cl);
}
%>