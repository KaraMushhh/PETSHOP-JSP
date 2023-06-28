<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>View Utenti</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@page import="it.betacom.dao.UtenteDao,it.betacom.bean.Utente,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>
	
<br/><br/><br/><br/>

<h1>Lista Utenti</h1>

<%
List<Utente> listU=UtenteDao.getAllRecords();
request.setAttribute("listU",listU);
%>


<c:set  var="abilitato" scope="session" value="A"/>
<c:set  var="disabilitato" scope="session" value="D"/>

<table border="1" width="90%">
	<tr>
		<th>Id</th>
		<th>Nome</th>
		<th>Cognome</th>
		<th>Email</th>
		<th>Cellulare</th>
		<th>Password</th>
		<th>Role</th>
		<th>Status</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>

<c:forEach items="${listU}" var="utente">
	<tr>
		<td>${utente.getId()}</td>
		<td>${utente.getNome()}</td>
		<td>${utente.getCognome()}</td>
		<td>${utente.getEmail()}</td>
		<td>${utente.getCellulare()}</td>
		<td>${utente.getPass()}</td>
		<td>${utente.getRole()}</td>
		
		<c:set  var="status" scope="session" value="${utente.getStatus()}"/>
		<c:if test="${status.equals(abilitato)}">
			<td><a href="cambiastatus.jsp?id=${utente.getId()}">Disabilita</a></td>
		</c:if>
		<c:if test="${status.equals(disabilitato)}">
			<td><a href="cambiastatus1.jsp?id=${utente.getId()}">Abilita</a></td>
		</c:if>
		<td><a href="editutente.jsp?id=${utente.getId()}">Edit</a></td>
		<td><a href="deleteutente.jsp?id=${utente.getId()}">Delete</a></td>
	</tr>
</c:forEach>
</table>

<div style="width:250px; padding:25px; margin:auto">
	<br/><a href="addutenteform.jsp" class="ui-btn ui-icon-plus ui-btn-icon-notext ui-corner-all">Add New Utente</a>
	<br/><a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a>
</div>

</body>
</html>