<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Acceso denegado</title>
		<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
	</head>
	</head>
	<body>
		<div class="container todo-c">
			<div class="display-1">403</div>
			<h1 class="text-danger">Acceso denegado</h1>
			<h3>Ops, no tienes permisos para acceder a esta página</h3>
			<div class="btt-spread">
				<a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">Volver al inicio</a>
				<form:form action="${pageContext.request.contextPath}/logoutUsuario" method="POST">
					<button type="submit" class="btn btn-outline-primary">Logout</button>
				</form:form>
			</div>
		</div>
	</body>
</html>