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

	<%@page import="it.betacom.dao.LoginDao"%>
	<jsp:useBean id="l" class="it.betacom.bean.Login"></jsp:useBean>
	<jsp:setProperty name="l" property="*"/>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<div data-role="header" id="header-1" data-theme="a">
		<h1><% out.print(" Ciao, " +session.getAttribute("username")+" "); %></h1>
		<a href="logout.jsp" class="ui-btn ui-mini ui-btn-inline ui-btn-right ui-corner-all ui-icon-power ui-btn-icon-left">Logout</a>
	</div>
	
	<%
	int i=LoginDao.changePWD(l);
	%>
	
	<br/><br/><br/><br/>
	
	
	<p align="center"> Password reimpostata con successo! </p>
	<div style="width:250px; padding:25px; margin:auto;">
		<a href="index.jsp" class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-left ui-btn-b">Home</a>
	</div>
	
</body>
</html>