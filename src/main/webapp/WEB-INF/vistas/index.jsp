<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>P�gina Principal - AllStuffYouNeed</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
		<script>
			var urlParams = new URLSearchParams(window.location.search);
			$(document).ready(function(){
				if (urlParams.has('error')) $("#modalLogin").modal('show');
				$('#modalLogin').on('shown.bs.modal', function () {
  					$('#formusuario').trigger('focus');
				});
			});
		</script>
		
	</head>
	<body>
		<nav class="navbar sticky-top navbar-dark bg-dark">
			<a class="navbar-brand" href="#">
    			<img src="${pageContext.request.contextPath}/img/box.png" width="30" height="30" class="d-inline-block align-top" alt="">
				AllStuffYouNeed
			</a>
			<sec:authorize access="!isAuthenticated()">
				<span class="navbar-text">
					<span class="rightpad">Bienvenido/a invitado/a!</span>
	    			<button class="btn btn-outline-primary my-2 my-sm-0" type="button" data-toggle="modal" data-target="#modalLogin">Login</button>
	  			</span>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<span class="navbar-text">
					<span class="rightpad">Hola de nuevo <sec:authentication property="name"/></span>
					<form:form action="${pageContext.request.contextPath}/logoutUsuario" method="POST">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
					</form:form>
	  			</span>
			</sec:authorize>			
		</nav>
		<div class="mainimg">
			<img src="${pageContext.request.contextPath}/img/tienda.jpg">
			<h1>Todo lo que t� quieras cuando t� quieras</h1>
		</div>
		<div class="container">
			<div class="row">
			    <div class="col-5">
	      			<h4>Busques lo que busques</h4>
	      			<p>Y, vi�ndole don Quijote de aquella manera, con muestras de tanta tristeza, le dijo: S�bete, Sancho, que no es un hombre m�s que otro si no hace m�s que otro. Todas estas borrascas que nos suceden son se�ales de que presto ha de serenar el tiempo y han de sucedernos bien las cosas; porque no es posible que el mal ni el bien sean durables, y de aqu� se sigue que, habiendo durado mucho el mal, el bien est� ya cerca. As� que, no debes congojarte por las desgracias que a m� me suceden, pues a ti no te cabe </p>
	    		</div>
	    		<sec:authorize access="isAuthenticated()">
		    		<div class="col-5">
		    			<h4>Area de usuario</h4>
		    			<div class="margup">
			      			<sec:authorize access="hasRole('COLABORADOR')">
								<a href="${pageContext.request.contextPath}/colabora/" class="btn btn-outline-primary">Acceder a la zona para Colaboradores</a>
							</sec:authorize>
							<sec:authorize access="hasRole('EDITOR')">
								<a href="${pageContext.request.contextPath}/editor/" class="btn btn-outline-primary">Acceder a la zona para Editores</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<a href="${pageContext.request.contextPath}/admin/" class="btn btn-outline-primary">Acceder a la zona de Administraci�n</a>
							</sec:authorize>
						</div>
		    		</div>
	    		</sec:authorize>
	    		<div class="col-5">
	      			<h4>100% seguro</h4>
	      			<p>Una ma�ana, tras un sue�o intranquilo, Gregorio Samsa se despert� convertido en un monstruoso insecto. Estaba echado de espaldas sobre un duro caparaz�n y, al alzar la cabeza, vio su vientre convexo y oscuro, surcado por curvadas callosidades, sobre el que casi no se aguantaba la colcha, que estaba a punto de escurrirse hasta el suelo. Numerosas patas, penosamente delgadas en comparaci�n con el grosor normal de sus piernas, se agitaban sin concierto. - �Qu� me ha ocurrido? No estaba so�ando. Su habitaci�n, una habitaci�n normal, aunque muy peque�a, ten�a el aspecto habitual. Sobre la mesa hab�a desparramado un muestrario </p>
	    		</div>
	    		<div <sec:authorize access="isAuthenticated()">class="col-5"</sec:authorize><sec:authorize access="!isAuthenticated()">class="col-10"</sec:authorize>>
	      			<h4>Te lo llevamos d�nde quieras</h4>
	      			<p>Muy lejos, m�s all� de las monta�as de palabras, alejados de los pa�ses de las vocales y las consonantes, viven los textos simulados. Viven aislados en casas de letras, en la costa de la sem�ntica, un gran oc�ano de lenguas. Un riachuelo llamado Pons fluye por su pueblo y los abastece con las normas necesarias. Hablamos de un pa�s paraisom�tico en el que a uno le caen pedazos de frases asadas en la boca. Ni siquiera los todopoderosos signos de puntuaci�n dominan a los textos simulados; una vida, se puede decir, poco ortogr�fica. Pero un buen d�a, una peque�a l�nea </p>
	    		</div>
  			</div>
		
			
		
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="Acceso de usuario" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered" role="Formulario de acceso">
  				<form:form action="${pageContext.request.contextPath}/autenticarUsuario" method="POST">
	    			<div class="modal-content">
	      				<div class="modal-header">
	        				<h5 class="modal-title">Acceso de usuario</h5>
	        				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          					<span aria-hidden="true">&times;</span>
	        				</button>
	      				</div>
	      				<div class="modal-body">
	      					<c:if test="${param.error!=null}">
								<div class="alert alert-danger">Nombre o contrase�a incorrectos.</div>
							</c:if>
		      				<div class="input-group flex-nowrap">
	  							<div class="input-group-prepend">
	    							<label for="formusuario" class="input-group-text" id="addon-wrapping">Usuario</label>
	  							</div>
	  							<input id="formusuario" name="username" type="text" class="form-control" placeholder="Nombre de usuario" aria-label="Nombre de usuario">
							</div>
							<div class="input-group flex-nowrap">
	  							<div class="input-group-prepend">
	    							<label for="formpass" class="input-group-text" id="addon-wrapping">Contrase�a</label>
	  							</div>
	  							<input id="formpass" name="password" type="text" class="form-control" placeholder="Contrase�a" aria-label="Contrase�a">
							</div>
							<input type="hidden" name="intform" value="true">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">Acceder</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
					    </div>
	        		</div>
        		</form:form>
      		</div>
    	</div>
  

		
	</body>
</html>