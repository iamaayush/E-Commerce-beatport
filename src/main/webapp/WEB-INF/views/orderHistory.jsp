<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/makePayment.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/custHomePage.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/supplierWorkArea.css"/>" />
<link rel="stylesheet" href="<c:url value="/css/orderHistory.css"/>" />
<style>
.tableDiv {
	background-color: #FFFFCC;
	padding-bottom: 5%;
}

h2 {
	padding-left: 30px;
}

.tableDiv tr td {
	padding: 10px;
}

.topmargin {
	margin: 10px;
}
</style>
<title>Order History</title>

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


	<div class="container-fluid">
		<div class="row tableDiv">
			<div class="row">
				<h2>Order History</h2>
				<div class="col-lg-2 col-lg-offset-2 pull-left bordertop">
					<h3>Order Id</h3>
				</div>
				<div class="col-lg-2 pull-left bordertop">
					<h3>Music Name</h3>
				</div>
				<div class="col-lg-2 pull-left bordertop">
					<h3>Quantity</h3>
				</div>
				<div class="col-lg-2 pull-left bordertop">
					<h3>E-Bill</h3>
				</div>
			</div>
			<c:forEach var="order" items="${orderList}">
				<div class="row padding topmargin">
					<div class="col-lg-2 col-lg-offset-2 pull-left">
						${order.orderId}</div>
					<div class="col-lg-2">${order.orderStatus}</div>
					<div class="col-lg-2">${order.orderTotal}</div>
					<div class="col-lg-2">
						<a href="viewPdf.do?orderId=${order.orderId}&paymentId=${order.orderId}" class="btn">View Invoice</a>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</body>
</html>