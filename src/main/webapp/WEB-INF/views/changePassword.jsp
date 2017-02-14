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

<title>Music Display</title>
<style>
body {
	background-color: #FFFFCC;
}

.tablePassword {
	border:none;
	
	padding:20px;
	
}

td{
padding: 10px;
}

#textIfMatch{


}

#newPwdTF,#retypeNewPwd,#textIfMatch{
/* border:none; */
}
</style>

<script type="text/javascript">
	function changePwd() {

		var xmlhttpObj;
		var oldPwd = document.getElementById("oldPwdTF").value;

		if (window.XMLHttpRequest) {
			xmlhttpObj = new XMLHttpRequest(); //for IE, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttpObj = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttpObj.open("POST", "checkPassword.do", true);
		xmlhttpObj.setRequestHeader("oldPassword", oldPwd);

		xmlhttpObj.onreadystatechange = function() {
			if (xmlhttpObj.readyState == 4) {
				if (xmlhttpObj.status == 200) {
					if (xmlhttpObj.responseText == "true") {
						document.getElementById("textIfMatch").innerHTML = "Old Password is correct";
						document.getElementById("newPwdTF").disabled = false;
						document.getElementById("retypeNewPwd").disabled = false;
					} else {
						document.getElementById("textIfMatch").innerHTML = "Old Password is Incorrect";
						document.getElementById("newPwdTF").disabled = true;
						document.getElementById("retypeNewPwd").disabled = true;
					}
				} else {
					alert("XMLHTTP status is not 200");
				}
			}
		}
		xmlhttpObj.send(null);
	}
</script>

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
	<div class="container-fluid">
		<div class="row">
			<form action="changePassword.do" method="post">
				<table border='1' align="center" class="tablePassword">
					<tr>
						<td colspan="2"> <h3>Change your Password</h3></td>
					</tr>

					<tr>
						<td>Enter old password:</td>
						<td><input type="text" id="oldPwdTF" onkeyup="changePwd()" /></td>
						
					</tr>

					<tr>
						<td>Enter NEW password:</td>
						<td><input type="text" id="newPwdTF" name="newPwdTF" disabled /></td>
					</tr>

					<tr>
						<td>Confirm New Password:</td>
						<td><input type="text" id="retypeNewPwd" disabled /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Change Password"></td>
					</tr>
				</table>
				<div class="col-lg-5 col-lg-offset-4" id="textIfMatch"></div>
				
			</form>
		</div>
	</div>
</body>
</html>