<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>
.main {
	margin: 80px;
}
</style>
<title>Admin Work Area</title>
</head>
<body>

	<nav class="navbar navbar-default navbar-top">

	<div class="row" style="background-color: #51514E">
		<div class="col-lg-3">
			<img alt="product" src="resources/images/beatportLogo.png"
				width="150" height="150">
		</div>
		<div class="col-lg-8">
			<h1>WELCOME TO BEATPORT</h1>
		</div>

		<div class="col-lg-1" id="menuButton">
			<form action="logMeOut.do" method="get">
				<input type="submit" class="btn" value="Logout" />
			</form>
		</div>
	</div>
	</nav>


	<div class="container main">
		<form action="goToAddSupplier.do" method="post">
			<div>
				<input type="submit" name="addSupplier"
					value="Register a Music Producer" class="btn btn-warning" />
			</div>
		</form>
		<br />

		<form action="goToAddGenre.do" method="post">
			<input type="submit" name="addGenre" value="Add Genre"
				class="btn btn-warning" />
		</form>
		<br />
	</div>

	</form>
</body>
</html>