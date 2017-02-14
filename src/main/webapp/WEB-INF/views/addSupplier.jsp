<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
#errors1{
	color:red;
}

</style>

<!-- AJAX SCRIPT -->
<script type="text/javascript">
	function ajaxFunction() {

		var xmlhttp;
		var username = document.getElementById("username").value;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttp.open("POST", "checkforusername.do", true);
		xmlhttp.setRequestHeader("username", username);

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					if (xmlhttp.responseText == "false") {
						document.getElementById("errorUsername").innerHTML = "User name available";
						document.getElementById("signup").disabled = false;
					} else {
						document.getElementById("errorUsername").innerHTML = "Username already exists";
						document.getElementById("signup").disabled = true;
					}
				} else {
					alert('XMLHTTP status is not 200 !!');
				}
			}
		}
		xmlhttp.send(null);
	}
</script>


<title>Add Genre</title>
</head>
<body>

	<nav class="navbar navbar-default navbar-top">

	<div class="row" style="background-color: #51514E">
		<div class="col-lg-3">
			<a href="goToAdminHome.do"><img alt="product" src="resources/images/beatportLogo.png"
				width="150" height="150"></a> 
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

<div class="container">
<div class="row">
	<div class="col-lg-3" id="addSupplier">
	
		<form class="opaque" class=""id="regSupplier" action="addSupplier.do"
			method="post">
			<h3>Add Supplier</h3>
			
			<div class="form-group" id="errors1"></div>
			<div class="form-group">
				<!-- <label for="company">Company Name</label> -->
				<input type="text" class="form-control" name="firstname"
					id="firstname" placeholder="Enter First Name">
			</div>
			
			<div class="form-group">
				<!-- <label for="company">Company Name</label> -->
				<input type="text" class="form-control" name="lastname"
					id="lastname" placeholder="Enter Last Name">
			</div>
			
			<div class="form-group">
				<!-- <label for="company">Company Name</label> -->
				<input type="text" class="form-control" name="username" id="username"
					placeholder="Enter Username">
					<p id="errorUsername"></p>
			</div>
			<div class="form-group">
				<!-- <label for="company">Company Name</label> -->
				<input type="password" class="form-control" name="password" id="password"
					placeholder="Enter Password">
			</div>
			<br> <input type="submit" id="signup" class="btn btn-default margin"
				value="Add Supplier" />
		</form>
	</div>
</div>
</div>

</body>
</html>