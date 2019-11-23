<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Zona de Editores - AllStuffYouNeed</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
	</head>
	<body>
		<nav class="navbar sticky-top navbar-dark bg-dark">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
    			<img src="${pageContext.request.contextPath}/img/box.png" width="30" height="30" class="d-inline-block align-top" alt="">
				AllStuffYouNeed
			</a>
			<span class="navbar-text">
				<span class="rightpad">Hola de nuevo <sec:authentication property="name"/></span>
				<form:form action="${pageContext.request.contextPath}/logoutUsuario" method="POST">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
				</form:form>
	  		</span>			
		</nav>
		<div class="container todo-c">
			<h1 class="display-1">EDITORES</h1>
			<h3>Página principal para usuarios Editores</h3>
			<div class="btt-spread">
				<a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">Volver al inicio</a>
			</div>
		</div>
	</body>
</html>