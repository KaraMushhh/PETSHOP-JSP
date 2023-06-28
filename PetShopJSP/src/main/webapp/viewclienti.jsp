<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>View Clienti</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@page import="it.betacom.dao.ClienteDao,it.betacom.bean.Cliente,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>
	
<br/><br/><br/><br/>

<h1>Lista Clienti</h1>

<%
List<Cliente> list=ClienteDao.getAllRecords();
request.setAttribute("list",list);
%>

<table border="1" width="90%">
	<tr>
		<th>Id</th>
		<th>Nome</th>
		<th>Cognome</th>
		<th>Citta</th>
		<th>Indirizzo</th>
		<th>Telefono</th>
		<th>Lista animali</th>
		<c:if test="${ruolo.equals(manager)}">
			<th>Edit</th>
			<th>Delete</th>
		</c:if>
	</tr>

<c:forEach items="${list}" var="cliente">
	<tr>
		<td>${cliente.getIdC()}</td>
		<td>${cliente.getNome()}</td>
		<td>${cliente.getCognome()}</td>
		<td>${cliente.getCitta()}</td>
		<td>${cliente.getIndirizzo()}</td>
		<td>${cliente.getTelefono()}</td>
		<td><a href="animalicliente.jsp?id=${cliente.getIdC()}">Animali</a></td>
		<c:if test="${ruolo.equals(manager)}">
			<td><a href="editform.jsp?id=${cliente.getIdC()}">Edit</a></td>
			<td><a href="deletecliente.jsp?id=${cliente.getIdC()}">Delete</a></td>
		</c:if>
	</tr>
</c:forEach>
</table>

<div style="width:250px; padding:25px; margin:auto">
	<c:if test="${ruolo.equals(manager)}">
		<br/><a href="addclienteform.jsp" class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all">Add New Cliente</a>
	</c:if>
	<br/><a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a>
</div>

</body>
</html>