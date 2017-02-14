<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
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
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="resources/js/adminWorkArea.js"></script>
<style>
#error2 {
	color: red;
}

.main {
	padding-top: 100px;
}
</style>
<title>Add Genre</title>
</head>
<body>

	<nav class="navbar navbar-default navbar-top">

		<div class="row" style="background-color: #51514E">
			<div class="col-lg-3">
				<a href="goToAdminHome.do"><img alt="product"
					src="resources/images/beatportLogo.png" width="150" height="150"></a>
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


	<form action="addGenre.do" method="post" id="addGenreForm">

		<div class="container main">
			<div id="error2"></div>
			<label>Enter Genre :</label>
			<div class="form-group">
				<input type="text" class="form-control" name="newGenre"
					id="newGenre" placeholder="Enter Genre here">
			</div>
			<input type="submit" name="submit" value="Add Genre">

		</div>
	</form>

</body>
</html>