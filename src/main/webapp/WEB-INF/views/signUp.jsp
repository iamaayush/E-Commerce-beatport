<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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
<script>
	function firstNameVal() {

		var firstName = document.forms["signupform"]["firstName"].value;
		if (firstName.trim() == null || firstName.trim() == "") {
			document.getElementById('errorFirstName').innerHTML = "First name is mandatory";
		} else {
			document.getElementById('errorFirstName').innerHTML = "";
		}
	}

	function lastNameVal() {
		var lastName = document.forms["signupform"]["lastName"].value;
		if (lastName.trim() == null || lastName.trim() == "") {
			document.getElementById('errorLastName').innerHTML = "Last name is mandatory";
		} else {
			document.getElementById('errorLastName').innerHTML = "";
		}
	}

	function addressVal() {
		var address = document.forms["signupform"]["address"].value;
		if (address.trim() == null || address.trim() == "") {
			document.getElementById('errorAddress').innerHTML = "Address is mandatory";
		} else {
			document.getElementById('errorAddress').innerHTML = "";
		}
	}

	function dobVal() {
		var dateOfBirth = document.forms["signupform"]["dob"].value;
		if (dateOfBirth.trim() == null || dateOfBirth.trim() == "") {
			document.getElementById('errordob').innerHTML = "Date Of Birth is mandatory";
		} else {
			document.getElementById('errordob').innerHTML = "";
		}
	}

	function emailVal() {
		var email = document.forms["signupform"]["email"].value;
		var pattEmail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/g;
		if (email.trim() == null || email.trim() == "") {
			document.getElementById('errorEmail').innerHTML = "Email is mandatory";
		} else if (!email.match(pattEmail)) {
			document.getElementById('errorEmail').innerHTML = "Enter valid email";
		} else {
			document.getElementById('errorEmail').innerHTML = "";
		}
	}

	function phoneNoVal() {
		var phoneNo = document.forms["signupform"]["phoneNo"].value;
		var phoneRegex = /^\d{10}$/g;
		if (phoneNo.trim() == null || phoneNo.trim() == "") {
			document.getElementById('errorPhoneNo').innerHTML = "Phone Number is mandatory";
		} else if (isNaN(phoneNo) || phoneNo < 0
				|| !(phoneNo.match(phoneRegex))) {
			document.getElementById('errorPhoneNo').innerHTML = "Enter valid digits of Phone Number";

		} else {
			document.getElementById('errorPhoneNo').innerHTML = "";
		}

	}

	function usernameVal() {
		var username = document.forms["signupform"]["username"].value;
		if (username.trim() == null || username.trim() == "") {
			document.getElementById('errorUsername').innerHTML = "Username is mandatory";
		} else {
			ajaxFunction();
			document.getElementById('errorUsername').innerHTML = "";
		}
	}

	function passwordVal() {
		var password = document.forms["signupform"]["password"].value;
		if (password.trim() == null || password.trim() == "") {
			document.getElementById('errorPassword').innerHTML = "Password is mandatory";
		} else {
			document.getElementById('errorPassword').innerHTML = "";
		}
	}

	function confirmPasswordVal() {
		var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
		if (confirmpassword.trim() == null || confirmpassword.trim() == "") {
			document.getElementById('errorConfirmPassword').innerHTML = "Confirm Password is mandatory";
		} else {
			document.getElementById('errorConfirmPassword').innerHTML = "";
		}
	}

	function matchOrConfirm() {
		var password = document.forms["signupform"]["password"].value;
		var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
		if (confirmpassword.trim() == null || confirmpassword.trim() == "") {
			document.getElementById('errorConfirmPassword').innerHTML = "Confirm Password is mandatory";
		} else if (password != confirmpassword) {
			document.getElementById('errorConfirmPassword').innerHTML = "Password and Confirm Password Didn't match!";
		} else {
			document.getElementById('errorConfirmPassword').innerHTML = "";
		}
	}

	function submitVal() {
		var firstName = document.forms["signupform"]["firstName"].value;
		var lastName = document.forms["signupform"]["lastName"].value;
		var address = document.forms["signupform"]["address"].value;
		var dateOfBirth = document.forms["signupform"]["dob"].value;
		var email = document.forms["signupform"]["email"].value;
		var phoneNo = document.forms["signupform"]["phoneNo"].value;
		var username = document.forms["signupform"]["username"].value;
		var password = document.forms["signupform"]["password"].value;
		var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
		var pattEmail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/g;
		var phoneRegex = /^\d{10}$/g;

		if (firstName.trim() == null || firstName.trim() == ""
				|| lastName.trim() == null || lastName.trim() == ""
				|| address.trim() == null || address.trim() == ""
				|| dateOfBirth.trim() == null || dateOfBirth.trim() == ""
				|| phoneNo.trim() == null || phoneNo.trim() == ""
				|| username.trim() == null || isNaN(phoneNo) || phoneNo < 0
				|| username.trim() == "" || password.trim() == null
				|| password.trim() == "" || !phoneNo.match(phoneRegex)
				|| confirmpassword.trim() == null
				|| confirmpassword.trim() == "" || password != confirmpassword

		) {
			document.getElementById('lastmsg').innerHTML = "One or more fields are empty!";
			return false;
		} else {
			return true;
		}
	}

	function repeat() {
		var price = document.forms["signupform"]["password"].value;
		var patt1 = /^\d+(\.\d{0,2})?$/g;
		if (price.trim() == null || price.trim() == "") {
			return "true";
		} else if (!price.match(patt1)) {
			return "didntmatch";
		} else {
			return "false";
		}
	}

	function validatePrice() {
		var returnVal = repeat();
		if (repeat() == "true") {
			document.getElementById('errorPassword').innerHTML = "Price is mandatory";
		} else if (repeat() == "didntmatch") {
			document.getElementById('errorPassword').innerHTML = "N/A";
		} else {
			document.getElementById('errorPassword').innerHTML = "";
		}
	}
</script>

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
					//document.getElementById("match").innerHTML = xmlhttp.responseText;
					//alert(xmlhttp.responseText);
				} else {
					alert('XMLHTTP status is not 200 !!');
				}
			}
		}
		xmlhttp.send(null);
	}
</script>



<style>
@charset "utf-8";
/* CSS Document */
html, body {
	height: 100%;
	width: 100%;
	background-image: url("resources/images/8.jpg");
}

h2 {
	color: white;
}

.fill {
	width: 100%;
	height: 100%;
	background-position: center;
	background-size: cover;
}

#form {
	width: 1000;
	position: absolute;
	top: 0.5%;
	left: 14%;
}

input[type='text'] {
	width: 300px;
	font-size: 20px;
}

input[type='submit'] {
	width: 300px;
	font-size: 20px;
	background-color: #B8704D
}

.opaque {
	padding: 0px 25px 0px 25px;
	background-color: black;
	opacity: 0.5;
	border-radius: 5px;
}

.signup {
	padding: 5px 30px 5px 30px;
}

.center {
	margin-left: auto;
	margin-right: auto;
}

.font {
	font-size: 15px;
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
}

.msgfont {
	font-size: 25px;
	font-weight: bold;
}

legend a:hover {
	text-decoration: none;
}

legend.legendStyle {
	font-size: 20px;
	font-weight: bold;
}

.marginbot {
	margin-bottom: 10px;
}

.margintop {
	margin-top: 5px;
}

.gender {
	color: gray;
	font-size: large;
}

.glyph {
	border: none;
}

.padding {
	padding: 17px 0px 0px 0px;
}

.popover {
	max-width: 100%;
}

legend.legendStyle {
	font-size: 15px;
	color: #888888;
	background-color: transparent;
	font-weight: bold;
}

#lastmsg {
	color: red;
	font-size: 20px;
}

@media ( max-width : 767px) {
	body {
		padding-left: 0;
		padding-right: 0;
		width: 100%;
	}
	
	#form{
	width:100%;
	}
}
</style>

<title>Customer Sign Up</title>
</head>
<body>


	<div id="form" class="col-sm-4 font">
		<form method="POST" action="signup.do" name="signupform">
			<div class="opaque">
				<div class="row">
					<div class="col-lg-3">
						<h2 class="">Please sign up</h2>
					</div>
					<div class="col-lg-9">
						<div id="info" class="margintop text-right">
							<p id="allmsg" class="text-danger">
								<strong>* All Fields are mandatory!</strong>
							</p>
						</div>
						<div id="lastmsg" class=" text-right">
							<p id="errormsg" class="text-danger">
								<strong></strong>
							</p>
						</div>
					</div>
				</div>
				<fieldset class="fsStyle">
					<legend class="legendStyle">
						<a data-toggle="" data-target="#demo" href="#">Personal
							Details</a>
					</legend>
					<div class="collapse in" id="demo">
						<div class="row">
							<div class="col-lg-6">
								<p id="errorFirstName" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="firstName" class="form-control"
											onblur="firstNameVal()" placeholder="First Name">
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errorLastName" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="lastName" class="form-control"
											onblur="lastNameVal()" placeholder="Last Name">

									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">
								<p id="errorAddress" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="address" class="form-control" id=""
											onblur="addressVal()" placeholder="Address">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errordob" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="dob" class="form-control" id=""
											onblur="dobVal()" placeholder="Date Of Birth">
									</div>
								</div>
							</div>
						</div>

						<div class="row marginbot">
							<div class="col-lg-4">
								<div class="form-group col-lg-2 padding">
									<div class="">
										<span class="gender">Gender</span>
									</div>
								</div>
								<div class="col-lg-7">
									<div class="btn-group padding" data-toggle="buttons">
										<label class="btn btn-default active"> <input
											type="radio" name="gender" checked="checked" value="Female" />
											Female
										</label> <label class="btn btn-default"> <input type="radio"
											name="gender" value="Male" /> Male
										</label>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<p id="errorEmail" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="email" class="form-control" id=""
											onblur="emailVal()" placeholder="Email Id">

									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<p id="errorPhoneNo" class="text-danger">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" name="phoneNo" class="form-control" id=""
											onblur="phoneNoVal()" placeholder="Phone No">
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>

				<fieldset class="fsStyle">
					<legend class="legendStyle">
						<a data-toggle="" data-target="#demo1" href="#">User Account
							Details</a>
					</legend>
					<div class="collapse in" id="demo1">
						<div class="row">
							<div class="col-lg-6">
								<p id="errorUsername" class="text-danger ">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="text" id="username" name="username"
											class="form-control" id="" onblur="usernameVal()"
											onKeyUp="ajaxFunction()" placeholder="User Name">

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<p id="errorPassword" class="text-danger ">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="password" name="password" class="form-control"
											onblur="passwordVal()" placeholder="Password">

									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<p id="errorConfirmPassword" class="text-danger ">
									<strong></strong>
								</p>
								<div class="form-group">
									<div class="input-group input-group-lg center">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-asterisk"></span></span> <input
											type="password" name="confirmPassword" class="form-control"
											id="" onblur="matchOrConfirm()"
											placeholder="Confirm Password">

									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-lg-4 col-lg-offset-4 text-right">
								<div class="input-group input-group-lg">
									<input type="submit" name="submit" value="Signup"
										onclick="return submitVal()" class="btn btn-sm btn-primary"
										data-toggle="popover" data-placement="right"
										data-content="One or more fields are empty!" id="signup"
										disabled />
								</div>
							</div>
							<div class="form-group col-lg-4">
								<div id="lastmsg" class=" text-right">
									<p id="errormsg" class="text-danger msgfont">
										<strong></strong>
									</p>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</form>
	</div>
</body>
</html>