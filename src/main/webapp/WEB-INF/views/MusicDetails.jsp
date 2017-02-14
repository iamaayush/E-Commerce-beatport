<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Music Details</title>

<style>
.vertical {
	margin-top: 30px;
}
</style>

<script type="text/javascript">
	function ajaxFunction() {

		var xmlhttp;
		var musicId = document.getElementById("musicId").value;
		var quantity = document.getElementById("quantity").value;
		if (quantity == "") {
			alert("Enter valid quantity");
			document.getElementById("submit").disabled = true;
			return;
		}

		//document.getElementById("match").innerHTML = oldPass;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttp.open("POST", "quantityCheck.do", true);
		xmlhttp.setRequestHeader("musicId", musicId);
		xmlhttp.setRequestHeader("quantity", quantity);

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					if (xmlhttp.responseText == "false") {
						document.getElementById("quantText").innerHTML = "Not in Stock";
						document.getElementById("submit").disabled = true;
					} else {
						document.getElementById("quantText").innerHTML = "Quantity available";
						document.getElementById("submit").disabled = false;
					}
					//document.getElementById("match").innerHTML = xmlhttp.responseText;
					//alert(xmlhttp.responseText);
				} else {
					alert("XMLHTTP status 200");
					document.getElementById("submit").disabled = true;
				}
			}
		}
		xmlhttp.send(null);
	}
</script>

</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-top">
	<div class="row" style="background-color: #51514E">
		<div class="col-lg-3">
			<a href="goToHome.do" ><img alt="product"
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

	<div class="container-fluid">
		<div class="row">
			<form action="addToCart.do" method="post">
				<input type="hidden" name="musicId" id="musicId"
					value=${requestScope.music.musicId}>
				<div class="row col-lg-10 col-lg-offset-1 detailsborder">
					<div class="col-lg-4 col-lg-offset-1">
						<div class="row col-lg-offset-1">
							<h1>Song name : ${requestScope.music.name}</h1>
						</div>
						<div class="row col-lg-offset-1">
							<h3>Music Producer : ${requestScope.music.supplierName}</h3>
						</div>
						<div class="row col-lg-offset-1">
							<h3>Description : ${requestScope.music.description}</h3>
						</div>
						<div class="row col-lg-offset-1">
							<h3>Price : $ ${requestScope.music.price}</h3>
						</div>
						<div class="row col-lg-offset-1 margintopmd">
							<div class="form-group pull-left marginright">
								<label for="quantity">Quantity</label>
							</div>
							<div class="form-group pull-left marginright">
								<div class="input-group input-group-md price">
									<input type="text" name="quantity" placeholder=""
										class="form-control pricewidth" id="quantity"
										OnKeyUp="ajaxFunction()">
									<p id="quantText"></p>
								</div>
							</div>
							<p id="match"></p>
						</div>
						<div class="row col-lg-offset-1 margintopmd">
							<input type="submit" id="submit" value="Add to cart"
								class="btn btn-sm btn-warning" disabled>
						</div>
					</div>
					<div class="col-lg-4 col-lg-offset-1 vertical">
						<div class="row image">
							<img alt="Image" src="resources/images/${music.imagePath}"
								width="150" height="150">
						</div>
						<div class="row vertical">
							<audio controls id="sample"> <source
								src="resources/mp3/${music.samplePath}" type="audio/mpeg">
							Your browser does not support the audio element. </audio>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>