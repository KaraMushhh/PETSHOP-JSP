<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>Edit Form</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@page import="it.betacom.dao.ClienteDao,it.betacom.bean.Cliente"%>

<%
String id=request.getParameter("id");
Cliente c=ClienteDao.getRecordById(Integer.parseInt(id));
%>

	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>

<h1 align="center">Edit Form</h1>
<form action="editcliente.jsp" method="post">
<input type="hidden" name="idC" value="<%=c.getIdC() %>"/>
<table align="center">
	<tr>
		<td>Nome:</td>
		<td><input type="text" name="nome" value="<%= c.getNome()%>"/></td>
	</tr>
	
	<tr>
		<td>Cognome:</td>
		<td><input type="text" name="cognome" value="<%= c.getCognome()%>"/></td>
	</tr>
	<tr>
		<td>Citta:</td>
		<td><input type="text" name="citta" value="<%= c.getCitta()%>"/></td>
	</tr>
	<tr>
		<td>Telefono:</td>
		<td><input type="text" name="telefono" value="<%= c.getTelefono()%>"/></td>
	</tr>
	<tr>
		<td>Indirizzo:</td>
		<td><input type="text" name="indirizzo" value="<%= c.getIndirizzo()%>"/></td>
	</tr>
	</td></tr>
	<tr>
		<td colspan="2"><input type="submit" value="Edit User"/></td>
	</tr>
</table>
</form>

<div style="width:250px; padding:25px; margin:auto">
	<br/><a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a>
</div>

</body>
</html>