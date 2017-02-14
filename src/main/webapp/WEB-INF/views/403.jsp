<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>403 - Authorization Error</title>
<script>

onLoad = setTimeout(function() {
	document.getElementById("clickIt").click();
	},5000);

</script>
</head>
<body>
<h1>403 - Authorization Error</h1>
<h2>Forbidden - Access is Denied.</h2>

You will be redirected to home page in 5 seconds.
Click <a href="/edu" id="clickIt">here</a> to go back to <b>LOGIN</b> page.
</body>
</html>