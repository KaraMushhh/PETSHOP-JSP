<%@page import="it.betacom.dao.ClienteDao"%>
<jsp:useBean id="cl" class="it.betacom.bean.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="cl"/>

<%
int i=ClienteDao.save(cl);
if(i>0){
response.sendRedirect("addcliente-success.jsp");
}else{
response.sendRedirect("addcliente-error.jsp");
}
%>