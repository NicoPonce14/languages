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
<title>TITULO AQUi</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container">


		<div class="row">
			<div class="col-ms-12">
				<h2>Edita lenguaje</h2>
				<a href='/languages/${lenguaje.id }'>delete</a> <a href="/languages">Dashboard</a>
				<form:form action="/languages/edit/${lenguaje.id }" method="post"
					modelAttribute="lenguaje">
					<input type="hidden" name="_method" value="put">
					<div class="row mb-3">
						<form:errors class="text-danger" path="name"></form:errors>
						<form:errors class="text-danger" path="creator"></form:errors>
						<form:errors class="text-danger" path="currentVersion"></form:errors>
					</div>

					<div class="form-outline mb-4">
						<form:input path="name" type="text" id="name" class="form-control"
							value="${lenguaje.name }" />
						<form:label path="name" class="form-label" for="name">Name</form:label>
					</div>


					<div class="form-outline mb-4">
						<form:input path="creator" type="text" id="creator"
							class="form-control" value="${lenguaje.creator }" />
						<form:label path="creator" class="form-label" for="creator">Creator</form:label>
					</div>


					<div class="form-outline mb-4">
						<form:input path="currentVersion" type="text" id="currentVersion"
							class="form-control" value="${ lenguaje.currentVersion}" />
						<form:label path="currentVersion" class="form-label"
							for="currentVersion">Version</form:label>
					</div>

					<!-- Submit button -->
					<form:input type="hidden" path="id" class="form-control" id="id"
						value="${lenguaje.id }" />
					<button type="submit" class="btn btn-primary btn-block mb-4">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>