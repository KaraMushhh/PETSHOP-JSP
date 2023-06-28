<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>View Animali</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@page import="it.betacom.dao.AnimaleDao,it.betacom.bean.Animale,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>
	
<br/><br/><br/><br/>

<h1>Lista Animali</h1>

<%
List<Animale> listA=AnimaleDao.getAllRecords();
request.setAttribute("listA",listA);
%>

<table border="1" width="90%">
	<tr>
		<th>Id</th
		><th>Nome</th>
		<th>Matricola</th>
		<th>Data acquisto</th>
		<th>Prezzo</th>
		<th>Id catalogo</th>
		<th>Id cliente</th>
		<c:if test="${ruolo.equals(manager)}">
			<th>Edit</th>
			<th>Delete</th>
		</c:if>
	</tr>

<c:forEach items="${listA}" var="a">
	<tr>
		<td>${a.getIdA()}</td>
		<td>${a.getNome()}</td>
		<td>${a.getMatricola()}</td>
		<td>${a.getDataAcquisto()}</td>
		<td>${a.getPrezzo()}</td>
		<td>${a.getIdT()}</td>
		<td>${a.getIdC()}</td>
		<c:if test="${ruolo.equals(manager)}">
			<td><a href="editform.jsp?id=${a.getIdA()}">Edit</a></td>
			<td><a href="deletecliente.jsp?id=${a.getIdA()}">Delete</a></td>
		</c:if>
	</tr>
</c:forEach>
</table>

<div style="width:250px; padding:25px; margin:auto">
	<c:if test="${ruolo.equals(manager)}">
		<br/><a href="addanimaleform.jsp" class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all">Add New Animale</a>
	</c:if>
	<br/><a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a>
</div>

</body>
</html>