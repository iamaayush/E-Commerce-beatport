<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/home.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700,400italic,600italic,700italic&effect=shadow-multiple|crackle'
	rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="resources/css/musicDisplay.css" />

<title>Music Display</title>

<style>
body {
	background-color: #FFFFCC;
}

.marginC {
	margin-top: 220px;
}

.poplink {
	width: 150px;
	padding: 10px;
	margin-top: 40px;
	background-color: #FF8C00;
	box-shadow: -8px 8px 10px 3px rgba(0, 0, 0, 0.2);
	font-weight: bold;
	text-decoration: none;
}

.marginrightlg {
	margin-right: 20px;
}

.marginrightmd {
	margin-right: 10px;
}

.margintopsm {
	margin-top: 5px;
}

.margintopmd {
	margin-top: 10px;
}

.margintoplg {
	margin-top: 30px;
}

.lefty {
	margin-left: 4em;
}

.nameGap {
	margin-top: 10px;
}

.clear {
	clear: both;
}

.vertical {
	margin-top: 70px;
}

.eachDiv {
	
}
</style>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-top">

	<div class="row" style="background-color: #51514E">
		<div class="col-lg-3">
			<a href="goToHome.do"><img alt="product" src="resources/images/beatportLogo.png"
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

	<div class="container-fluid">
		<div class="row">
			<div class="quickbar col-lg-offset-2">
				<form action="quickSearch.do" method="post" class="margintop">
					<div class="form-group margintopsm">
						<!-- <div class="form-group marginright">
							<label>Music</label>
						</div> -->
						<div
							class="input-group input-group-md pull-left center marginrightlg">
							<input type="text" name="musicName"
								placeholder="Enter Music Name" class="form-control" id="round">
						</div>
					</div>
					<div class="margintop">
						<div class="form-group">
							<!-- <span class="gender">Gender</span> -->
							<div class="form-group">
								<div class="form-group marginrightmd pull-left margintopsm">
									<label>Music Producer</label>
								</div>
								<div class="input-group input-group-md pull-left marginrightlg">
									<select name="supplier" class="form-control" id="round">
										<c:forEach var="item" items="${supplierList}">
											<option value="${item}">${item}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<!-- <div class="col-lg-7"></div> -->
					</div>
					<div class="margintop">
						<div class="form-group pull-left marginrightmd margintopsm">
							<label>Price</label>
						</div>
						<div class="form-group pull-left marginrightmd">
							<div class="input-group input-group-md price">
								<input type="text" name="priceFrom" placeholder="From"
									class="form-control pricewidth" id="round">
							</div>
						</div>
						<div class="form-group">
							<div
								class="input-group input-group-md pull-left price marginrightlg">
								<input type="text" name="priceTo" placeholder="To"
									class="form-control pricewidth" id="round">
							</div>
						</div>
					</div>
					<%-- <div class="form-group form-horizontal col-md-2">
						<div class="input-group input-group-md">
							<select name="category" class="form-control">
								<c:forEach var="item" items="${categories}">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div> --%>
					<div class="form-group pull-left">
						<div class="input-group input-group-md">
							<input type="submit" name="quicksearch" value="Go"
								class="btn btn-md btn-info form-control" />
						</div>
					</div>

					<!-- <span class="input-group-addon"><span
					class="glyphicon glyphicon-search"></span></span> -->

				</form>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h4 class="margintop lefty">Search Results are:</h4>
					<div class="margintopmd marginleft">
						<c:forEach var="music" items="${musicList}">
							<div class="row margintoplg col-lg-offset-2 eachDiv">
								<div
									class="col-lg-3 pop popmarginrt margintop marginbot pull-left">
									<div class="popimg">
										<img alt="product" src="resources/images/${music.imagePath}"
											width="150" height="150">
									</div>
								</div>
								<div class="col-lg-4 pop popmarginrt margintop marginbot divAdjust">
									<div class="row">
										<c:out value="Song : ${music.name}" />
									</div>
									<div class="row nameGap">
										<c:out value="By : ${music.supplierName}" />
									</div>
									<div class="row vertical clear">
										<audio controls> <source
											src="resources/mp3/${music.samplePath}" type="audio/mpeg">
										Your browser does not support the audio element. </audio>
									</div>
								</div>
								<div class="col-lg-3 pop popmarginrt margintop marginbot">
									<div class="row poplink">
										<a href="showMusicDetails.do?musicID=${music.musicId}">
											View Details</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
</body>
</html>