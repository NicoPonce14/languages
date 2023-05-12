<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body class="p-3">
	<div class="container">

		<div class="row">
			<div class="col-ms-12">
			<h2>Lista de lenguajes</h2>
				<table class="table table-success table-striped">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Creator</th>
							<th scope="col">Version</th>
							<th scope="col">action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lengua" items="${lengua}">
							<tr>

								<td><a href='/languages/show/${lengua.id }'><c:out value="${lengua.name }"></c:out></td>
								<td><c:out value="${lengua.creator }"></c:out></td>
								<td><c:out value="${lengua.currentVersion }"></c:out></td>
								<td><a href='/languages/${lengua.id }'>delete</a> <a href='/languages/edit/${lengua.id }'>edit</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-ms-12">
			<h2>Registra un nuevo lenguaje</h2>
				<form:form action="/languages" method="post"
					modelAttribute="lenguaje">
					<div class="row mb-3">
						<form:errors class="text-danger" path="name"></form:errors>
						<form:errors class="text-danger" path="creator"></form:errors>
						<form:errors class="text-danger" path="currentVersion"></form:errors>
					</div>

					<div class="form-outline mb-4">
						<form:input path="name" type="text" id="name"
							class="form-control" />
						<form:label path="name" class="form-label" for="name">Name</form:label>
					</div>


					<div class="form-outline mb-4">
						<form:input path="creator" type="text" id="creator"
							class="form-control" />
						<form:label path="creator" class="form-label" for="creator">Creator</form:label>
					</div>


					<div class="form-outline mb-4">
						<form:input path="currentVersion" type="text" id="currentVersion"
							class="form-control" />
						<form:label path="currentVersion" class="form-label"
							for="currentVersion">Version</form:label>
					</div>

					<!-- Submit button -->
					<button type="submit" class="btn btn-primary btn-block mb-4">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>