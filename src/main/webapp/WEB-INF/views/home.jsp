<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
	$(document).ready(function() {
		$('#link').click();		
		
	});
	
	var x = document.getforms['loginform']['usernmeError'].value;
	document.getElementById('error1Msg').innerHTML= x;
	alert(x);
</script>

<style type="text/css">
.bground {
	width: 100%;
	height: 100%;
}

.button {
	width: 150px;
	padding: 10px;
	background-color: #FF8C00;
	box-shadow: -8px 8px 10px 3px rgba(0, 0, 0, 0.2);
	font-weight: bold;
	text-decoration: none;
}

#cover {
	position: fixed;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.6);
	
	width: 100%;
	height: 100%;
	display: none;
}

#loginScreen {
	height: 380px;
	width: 340px;
	margin: 0 auto;
	position: absolute;
	z-index: 5;
	top: 10%;
	left:180%;
	display: none;
	background: url("resources/images/7(2).png") no-repeat;
	border: 5px solid #cccccc;
	border-radius: 15px;
}

/* #cover {
	position: fixed;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.6);
	z-index: 5;
	width: 100%;
	height: 100%;
	display: none;
}

#loginScreen {
	height: 380px;
	width: 340px;
	margin: 0 auto;
	position: relative;
	z-index: 10;
	display: none;
	background: url("/images/7(2).png") no-repeat;
	border: 5px solid #cccccc;
	border-radius: 15px;
} */

#myform {
	position: absolute;
	top: 5%;
	left: 10%;
	color:white;
	
	}
.logform{
	
	padding:10px;
	
}

#loginScreen:target, #loginScreen:target+#cover {
	display: block;
	opacity: 3;
}

#bigBox {
	position: absolute;
	top: 10%;
	left: 3%;
}

.text{
position: absolute;
	top: 2%;
	left: 40%;
}
</style>
</head>
<body>
	<img class="bground" src="resources/images/h12.jpg">
	<div id="bigBox">
	<div class="">
		<h2 align='center'>Welcome To BEATPORT</h2>
		<h3 align='center'>Buy the best Electronic Dance Music here.</h3>
		</div>
		<div align="center">
			<br>
			
			<br> <a href="#loginScreen" class="button" id="link">Click
				here to Enter the Website.</a>
				
				<p id="userNameError"></p>
				<p id="passwordError"></p>
		</div>

		<div id="loginScreen" class="logform">

			
			<form:form method="POST" commandName="userAccount" action="login.do"
                class="form-horizontal  h3" role="form" id="myform" name="loginform">
                <div class="opaque">
                    <h2 class="">Please log in</h2>
                    <div class="form-group">
                        <div class="input-group input-group-lg center">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <form:input path="username" placeholder="Enter Username" class="form-control"/>
                        </div>
                        <div class="input-group input-group-lg center">
                            <form:errors name = "usernmeError" id="usrNameError" path="username" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-lg center">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                            <form:input type="password" path="password" id="pwdError" placeholder="Enter Password" class="form-control"/>
                        </div>
                        <div class="input-group input-group-lg center">
                            <form:errors  path="password" id="pwdmsg"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-lg center font">
                            <input type="checkbox" name="rememberMe" id="rememberMe" value="rememberMe" /> <label
                                class="control-label" for="rememberMe">Remember Me</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group input-group-lg center">
                            <input type="submit" name="submit" value="Login"
                                class="btn btn-sm btn-primary" />
                                
                        </div>
                    </div>
                </div>
            </form:form>
            <form:form action="goToSignUp.do" role="form">
            <span>Not a member yet?</span>
				<input type="submit" class="btn btn-sm btn-primary" name="signUp" value="Sign Up" />
			</form:form>
			</div>
			
		
		<div id="cover"></div>
	</div>
</body>
</html>