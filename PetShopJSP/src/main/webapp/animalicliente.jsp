<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>Animali Cliente</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<%@page import="it.betacom.dao.ClienteDao, it.betacom.bean.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>
	
<br/><br/><br/><br/>

<%
String id=request.getParameter("id");
Cliente c=ClienteDao.getRecordById(Integer.parseInt(id));
List<Animale> listAnim=ClienteDao.getAnimali(c);
request.setAttribute("listAnim",listAnim);
request.setAttribute("clie",c);
//for (Animale a:listAnim) {out.println(a);}
%>
	
<h1>Lista Animali di <c:out value="${clie.getNome()}"/> </h1>


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

<c:forEach items="${listAnim}" var="animale">
	<tr>
		<td>${animale.getIdA()}</td>
		<td>${animale.getNome()}</td>
		<td>${animale.getMatricola()}</td>
		<td>${animale.getDataAcquisto()}</td>
		<td>${animale.getPrezzo()}</td>
		<td>${animale.getIdT()}</td>
		<td>${animale.getIdC()}</td>
		<c:if test="${ruolo.equals(manager)}">
			<td><a href="editform.jsp?id=${animale.getIdA()}">Edit</a></td>
			<td><a href="deletecliente.jsp?id=${animale.getIdA()}">Delete</a></td>
		</c:if>
	</tr>
</c:forEach>
</table>

<div style="width:250px; padding:25px; margin:auto">
	<br/><a href="viewclienti.jsp" class="ui-btn ui-icon-back ui-btn-icon-notext ui-corner-all">Back</a>
	<br/><a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a>
</div>

</body>
</html>