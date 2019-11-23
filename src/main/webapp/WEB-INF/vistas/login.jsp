<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Acceso de usuario - AllStuffYouNeed</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
		<script>
			$(document).ready(function(){
				$('#formusuario').trigger('focus');
			});
		</script>
		
	</head>
	<body>
		<nav class="navbar sticky-top navbar-dark bg-dark">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
    			<img src="${pageContext.request.contextPath}/img/box.png" width="30" height="30" class="d-inline-block align-top" alt="">
				AllStuffYouNeed
			</a>			
		</nav>
		<div class="container">
  			<div class="mid-50">
  				<h3>Acceso de usuario</h3>
  				<form:form action="${pageContext.request.contextPath}/autenticarUsuario" method="POST">
	    			<div>      				
      					<c:if test="${param.error!=null}">
							<div class="alert alert-danger">Nombre o contraseña incorrectos.</div>
						</c:if>
	      				<div class="input-group flex-nowrap">
  							<div class="input-group-prepend">
    							<label for="formusuario" class="input-group-text" id="addon-wrapping">Usuario</label>
  							</div>
  							<input id="formusuario" name="username" type="text" class="form-control" placeholder="Nombre de usuario" aria-label="Nombre de usuario">
						</div>
						<div class="input-group flex-nowrap">
  							<div class="input-group-prepend">
    							<label for="formpass" class="input-group-text" id="addon-wrapping">Contraseña</label>
  							</div>
  							<input id="formpass" name="password" type="text" class="form-control" placeholder="Contraseña" aria-label="Contraseña">
						</div>
						<input type="hidden" name="intform" value="false">
						<div class="center">
							<button type="submit" class="btn btn-primary">Acceder</button>
				    	</div>
	        		</div>
        		</form:form>
      		</div>
    	</div>
    </body>
</html>