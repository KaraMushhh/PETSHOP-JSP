<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>Pet Shop Site</title>
<link rel="icon" type="image/x-icon" href="img/dank.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>


	
	
	<br/><br/><br/><br/>
	
	<c:set  var="ruolo" scope="session" value='<%=(String)session.getAttribute("role")%>'/>
	<c:set  var="manager" scope="session" value="M"/>
	<div data-role="controlgroup" id="buttons-1" style="width:250px; padding:25px; margin:auto;">
		<c:if test="${ruolo.equals(manager)}">
			<a href="addclienteform.jsp" class="ui-btn ui-corner-all ui-icon-plus ui-btn-icon-left ui-btn-b">Add Cliente</a>
    		<a href="pslistautenti.jsp" class="ui-btn ui-corner-all ui-icon-user ui-btn-icon-left ui-btn-b">View Utenti</a>
    	</c:if>
    		<a href="viewclienti.jsp" class="ui-btn ui-corner-all ui-icon-bars ui-btn-icon-left ui-btn-b">View Clienti</a>
			<a href="viewanimali.jsp" class="ui-btn ui-corner-all ui-icon-bars ui-btn-icon-left ui-btn-b">View Animali</a>
	</div>
	

</body>
</html>