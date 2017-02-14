<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script src="<c:url value="/js/makePayment.js"/>"></script>


<script>
	function validatePaymentButton() {
		var x = document.getElementById("total").innerhtml;
		if (x == 0 ) {
			alert("Cart Empty");
			return;
		}
	}
</script>

<style>
.cartTable {
	margin: 5px 3px;
	border-collapse: collaspe;
	border-spacing: 0;
	width: 100%;
	color: black;
}

tr {
	vertical-align: inherit;
	border-color: inherit;
	/* padding:10px; */
}

tr td {
	margin: 10px;
	padding: 10px;
}

h1 {
	color: white;
}

#big-form {
	padding-bottom: 50px;
}

.bground {
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: -1;
}

.opaque {
	padding: 0px 25px 0px 25px;
	background-color: black;
	opacity: 0.7;
	border-radius: 5px;
}
</style>

<title>Add To Cart</title>

</head>

<body>
	<img class="bground" src="resources/images/20.jpg">
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-top">

		<div class="row" style="background-color: #51514E">
			<div class="col-lg-3">
				<a href="goToHome.do"><img alt="product"
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

	<!-- <img class="bground" src="resources/images/20.jpg"> -->
	<div class="container auth opaque">
		<h1 class="text-center">BEATPORT CART</h1>
		<form action="proceedToPayment.do" method="post">
			<div id="big-form" class="well auth-box formOpacity">
				<h2>My Cart</h2>
				<hr />
				<h3>Order Id: ${cart.orderId}</h3>
				<input type="hidden" name="orderId" value="${cart.orderId}" />
				<table class="cartTable">
					<thead>
						<tr class="rowCartTable">
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Subtotal</th>
						</tr>

						<c:forEach var="orderItem" items="${cart.orderItem}">
							<tr>
								<td><c:out value="${orderItem.music.musicId}" /></td>

								<td><c:out value="${orderItem.music.name}" /></td>

								<td><c:out value="${orderItem.music.price}" /></td>

								<td><input type="text" name="quantity"
									value="${orderItem.quantity}" /></td>
								<%-- <td><c:out value="${orderItem.quantity}"/></td> --%>

								<td id="total"><c:out value="${orderItem.totalCost}" /></td>
								<input type="hidden" name="orderTotal"
									value="${orderItem.totalCost}" />
								<td><a
									href="deleteOrderItem.do?orderItemid=${orderItem.orderItemId}&orderID=${cart.orderId}">
										Delete</a></td>
							</tr>
						</c:forEach>

					</thead>
					<tbody>
						<tr>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" align="right">Total:</td>
							<td>${cart.orderTotal}</td>
						</tr>
					</tfoot>

				</table>
				<input type="submit" class="btn btn-primary pull-right" id="payment"
					name="payment" value="Proceed To Payment"
					onClick="validatePaymentButton()" />
			</div>

			<div class="clearfix"></div>
		</form>
	</div>
</body>
</html>