<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
<title>Add Cliente Form</title>
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

	<h1 align="center">Add New Utente</h1>
	<form action="addutente.jsp" method="post">
	<table align="center">
	<tr><td>Nome:</td><td><input type="text" name="nome"/></td></tr>
	<tr><td>Cognome:</td><td><input type="text" name="cognome"/></td></tr>
	<tr><td>E-mail:</td><td><input type="text" name="email" required/></td></tr>
	<tr><td>Cellulare:</td><td><input type="text" name="cellulare"/></td></tr>
	<tr><td>Password:</td><td><input type="password" name="pass" required/></td></tr>
	<tr><td>Role:</td><td><fieldset data-role="controlgroup" id="radio-1">
								<legend></legend>
								<input name="role" id="roleM" value="M" 
							        type="radio"/>
								<label for="roleM">M</label>
								<input name="role" id="roleG" value="G" 
							        type="radio"/>
								<label for="roleG">G</label>
							</fieldset></td></tr>
	<tr><td>Status:</td><td><fieldset data-role="controlgroup" id="radio-2">
								<legend></legend>
								<input name="status" id="statusA" value="A" 
							        type="radio"/>
								<label for="statusA">A</label>
								<input name="status" id="statusD" value="D" 
							        type="radio"/>
								<label for="statusD">D</label>
							</fieldset></td></tr>
	<tr><td colspan="2"><input type="submit" value="Add Utente"/></td></tr>
	</table>
	</form>
	
	<div style="width:250px; padding:25px; margin:auto">
		<a href="pslistautenti.jsp" class="ui-btn ui-corner-all">View All Records</a><br/>
		<a href="index.jsp" class="ui-btn ui-icon-home ui-btn-icon-notext ui-corner-all">Return Home</a><br/>
	</div>

</body>
</html>