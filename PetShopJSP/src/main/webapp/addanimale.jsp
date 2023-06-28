<%@page import="it.betacom.dao.AnimaleDao,java.util.*"%>
<jsp:useBean id="an" class="it.betacom.bean.Animale"></jsp:useBean>
<jsp:setProperty property="*" name="an"/>

<%
int i=AnimaleDao.save(an);
if(i>0){
response.sendRedirect("addanimale-success.jsp");
}else{
	out.print(an);
//response.sendRedirect("addanimale-error.jsp");
}
%>