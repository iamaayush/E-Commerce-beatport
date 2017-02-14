<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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

<link rel="stylesheet" href="resources/css/userHomePage.css" />
<title>User Home Page</title>
<style>
#match {
	padding-left: 15px;
}

.width {
	width: 170px;
	padding-right: 15px;
}
</style>
<script type="text/javascript">
	function ajaxFunction() {

		var xmlhttp;
		var musicName = document.getElementById("musicName").value;
		var genre = document.getElementById("reg").value;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttp.open("POST", "quickFetchMusic.do", true);
		xmlhttp.setRequestHeader("musicName", musicName);
		xmlhttp.setRequestHeader("genre", genre);

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					document.getElementById("match").innerHTML = xmlhttp.responseText
							+ "\n";
				} else {
					alert('XMLHTTP is not 200');
				}
			}
		}
		xmlhttp.send(null);
	}
</script>

</head>
<body>

	<div class="container-fluid">
		<div class="row" style="background-color: #51514E">
			<div class="col-lg-2">
				<img alt="product" src="resources/images/beatportLogo.png"
					width="150" height="150">
			</div>
			<div class="col-lg-5">
				<h1>WELCOME TO BEATPORT : ${userFName}</h1>
			</div>
			<div class="col-lg-1">
				<form method="POST" action="getOrderHistory.do" role="form">
					<input type="hidden" name="customerID" value="${customerId}">
					<div class="form-group marginLogout">
						<div class="input-group input-group-lg pull-right">
							<input type="submit" name="orderHistory" value="View My Orders"
								class="btn btn-sm" />
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-1" id="menuButton">
				<a href="viewCart.do" id="viewCart" class="form-control viewCart">Cart</a>
			</div>
			<div class="col-lg-2" id="menuButton">
				<form action="goToChangePassword.do" method="post">
					<input type="submit" class="btn" value="Change Password" />
				</form>
			</div>
			<div class="col-lg-1" id="menuButton">
				<form action="logMeOut.do" method="get">
					<input type="submit" class="btn" value="Logout" />
				</form>
			</div>
		</div>

		<div class="row" style="background-color: white">
			<div class="col-lg-8 col-lg-offset-4 text-center">
				<form name="myform" action="getMusic.do" method="post">
					<div class="form-group">

						<div class="col-lg-1">
							<label>Genre: </label>
						</div>


						<div class="col-lg-3">
							<select id="reg" name="genre" class="form-control width">
								<c:forEach var="item" items="${listGenre}">
									<option value="${item}">${item}</option>

								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">

						<div class="col-lg-2">
							<input id="musicName" name="musicName"
								class="form-control input-md width" type="text" maxlength="100"
								onblur="validateMusicName()" placeholder="Music name"
								onKeyUp="ajaxFunction()">
							<p id="match" class="text-danger"></p>
						</div>
					</div>

					<div class="col-lg-3">
						<input type="submit" class="btn btn-info mybutton1">
					</div>
				</form>
			</div>
		</div>

		<div class="row" style="background-color: black">
			<div class="col-lg-7 changeMargin col-lg-offset-1">
				<div id="myCarousel"
					class="carousel slide carousel-fade carouselheight"
					data-ride="carousel">
					<div class="carousel-inner carouselmargin">
						<div class="item active picCaraousel1">
							<img src="resources/images/carousel1.JPG" class="mycar1">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<div class="item picCaraousel2">
							<img src="resources/images/carousel2.JPG" class="mycar2">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<div class="item picCaraousel3">
							<img src="resources/images/carousel3.JPG" class="mycar3">
							<div class="container">
								<div class="carousel-caption"></div>
							</div>
						</div>

					</div>
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="row">
					<h3>Top DJ's</h3>
				</div>
				<div class="row topdjpadding">
					<div class="col-lg-5 topimage">
						<img src="resources/images/albumCover.jpg" class="image">
					</div>
					<div class="col-lg-3 col-lg-offset-2">
						<h4>HARDWELL</h4>
					</div>
				</div>
				<div class="row topdjpadding">
					<div class="col-lg-5 topimage">
						<img src="resources/images/tiesto.jpg" class="image">
					</div>
					<div class="col-lg-3 col-lg-offset-2">
						<h4>TIESTO</h4>
					</div>
				</div>
				<div class="row topdjpadding">
					<div class="col-lg-5 topimage">
						<img src="resources/images/shm.jpeg" class="image">
					</div>
					<div class="col-lg-3 col-lg-offset-2">
						<h4>SWEDISH HOUSE MAFIA</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>